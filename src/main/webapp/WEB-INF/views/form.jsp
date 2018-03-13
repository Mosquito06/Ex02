<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
<script>
	$(function(){
		$("#addBtn").click(function(){
			var userid = $("#userid").val();
			var username = $("#username").val();
			var userpw = $("#userpw").val();
			var email = $("#email").val();
			
			var sendData = {userid : userid, userpw : userpw, username : username, email : email};
			
			$.ajax({
				url : "/ex02/member/",
				type: "post",
				headers : {"Content-Type" : "application/json"},
				dataType : "text",
				data : JSON.stringify(sendData),
				success: function(data){
					console.log(data);
					alert(data);
					getList();
				}
			})
		})
		
		$("#listBtn").click(function(){
			getList();
		})
		
		$(document).on("click", ".updateBtn", function(){
			$("#modal").css("display", "block");
			var userid = $(this).parents("tr").find("td:eq(0)").text();
			var username = $(this).parents("tr").find("td:eq(2)").text();
			var userpw = $(this).parents("tr").find("td:eq(1)").text();
			var email = $(this).parents("tr").find("td:eq(3)").text();
			
			$("#updateid").val(userid);
			$("#updatename").val(username);
			$("#updatepw").val(userpw);
			$("#updateemail").val(email);
		})
		
		$(document).on("click", "#closeBtn", function(){
			$("#modal").css("display", "none");
		})
		
		
		$("#updateBtn").click(function(){
			var userid = $("#updateid").val();
			var username = $("#updatename").val();
			var userpw = $("#updatepw").val();
			var email = $("#updateemail").val();
			
			var sendData = {userid : userid, username : username, userpw : userpw, email : email};
			
			$.ajax({
				url : "/ex02/member/" + userid,
				type : "patch",
				dataType : "text",
				data : JSON.stringify(sendData), 
				headers : {"Content-Type" : "application/json"},
				success : function(data){
					console.log(data);
									
					$("#modal").css("display", "none");
					getList();
				}
			
			})
		})
		
		$(document).on("click", ".deleteBtn", function(){
			var userid = $(this).parents("tr").find("td:eq(0)").text();
			
			$.ajax({
				url : "/ex02/member/" + userid,
				type: "delete",
				dataType : "text",
				success : function(data){
					console.log(data);
					getList();
				}
			}) 
		})
		
	})
	
	
	function getList(){
		$.ajax({
			url : "/ex02/member/",
			type: "get",
			dataType : "json",
			success: function(data){
				console.log(data);
				
				var source = $("#template").html();
				var fn = Handlebars.compile(source);
				$("#resultDiv").html(fn(data));
			}
		})
	}
</script>
<script id="template" type="text/x-handlebars-template">
	<table>
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>이메일</th>
			<th>선택</th>	
		</tr>
		{{#each.}}	
			<tr>
				<td>{{userid}}</td>
				<td>{{userpw}}</td>
				<td>{{username}}</td>
				<td>{{email}}</td>
				<td><button class='updateBtn'>수정</button><button class='deleteBtn'>삭제</button></td>
			</tr>
		{{/each}}
	</table>
</script>
<style>
	label{
		width: 100px;
		float: left;
	}
	
	input{
		margin-bottom: 10px;
	}
	
	button#addBtn{
		margin-bottom: 20px;
	}
	
	table{
		border: 1px solid black;
		border-collapse: collapse;
		width: 500px;
	}
	
	th, td{
		border: 1px solid black;
	}
	
	#modal{
		display: none;
		width: 350px;
		padding: 20px;
		background-color: yellow;
		position: absolute;
		top: 100px;
		left: 200px;
	}
	
</style>
</head>
<body>
	<label for="userid">아이디</label>
	<input type="text" name="userid" id="userid"><br>
	<label for="username">이름</label>
	<input type="text" name="username" id="username"><br>
	<label for="userpww">비밀번호</label>
	<input type="text" name="userpw" id="userpw"><br>
	<label for="email">이메일</label>
	<input type="text" name="email" id="email"><br>
	<button id="addBtn">추가</button><button id="listBtn">리스트 가져오기</button>
	<div id="resultDiv"></div>
	
	<div id="modal">
		<label for="updateid">아이디</label>
		<input type="text" name="updateid" id="updateid"><br>
		<label for="updatename">이름</label>
		<input type="text" name="updatename" id="updatename"><br>
		<label for="updatepw">비밀번호</label>
		<input type="text" name="updatepw" id="updatepw"><br>
		<label for="updateemail">이메일</label>
		<input type="text" name="updateemail" id="updateemail"><br>
		<button id="updateBtn">수정</button><button id="closeBtn">닫기</button>
	</div>
</body>
</html>