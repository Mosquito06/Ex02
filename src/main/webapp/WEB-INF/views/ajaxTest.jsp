<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
<style>
	.pagination{
		width: 100%;
		
	}
	
	.pagination li{
		list-style: none;
		float: left;
		padding: 3px;
		border: 1px solid blue;
		margin: 3px;
	}
	
	.pagination a{
		text-decoration: none;
		color: black;
	}
	
	.pagination li.active a{
		color: red;
	}
</style>
<script>
	var page = 1;
	$(function(){
		$("#newReplyBtn").click(function(){
			var bno = $("#bno").val();
			var replyer = $("#replyer").val();
			var replytext = $("#replytext").val();
			
			var sendDate = {bno : bno, replyer : replyer, replytext : replytext};
			
			$.ajax({
				url: "/ex02/replies/",
				type: "post",
				headers : {"Content-Type" : "application/json"}, //@RequestBody를 사용하기 때문에 Json이라는 형식을 지정해줘야함
				dataType : "text",
				data : JSON.stringify(sendDate), // json 객체를 json string으로 변경해줌
				success : function(result){
					console.log(result);
					alert(result);
				}
				
			})
		})
		
		$(document).on("click", ".modifyBtn", function(){
			var rno = $(this).prev().prev().val();
			var replytext = $(this).prev().val();
						
			var sendDate = {replytext : replytext};
			
			$.ajax({
				url : "/ex02/replies/" + rno,
				type : "put",
				dataType : "text",
				data : JSON.stringify(sendDate),
				headers : {"Content-Type" : "application/json"},
				success : function(result){
					console.log(result);
					alert(result);
				}
			})
		})
		
		$("#listBtn").click(function(){
			var bno = $("#bno").val();
			getList(bno, page);
			
		})
		
		
		$(document).on("click", ".deleteBtn", function(){
			var rno = $(this).val();
			var bno = $("#bno").val();
						
			$.ajax({
				url : "/ex02/replies/" + rno,
				type : "delete",
				dataType : "text",
				success : function(result){
					getList(bno);
				}
				
			})
		})
		
		// .pagination은 동적으로 추가되는 부분이 아니기 때문에 해당 클래스 내 새로 동적으로 추가되는 태그에 이벤트를 달아주면 됨
		$(".pagination").on("click", "li a", function(e){
			e.preventDefault();
			var bno = $("#bno").val();
			page = $(this).attr("href");
			getList(bno, page);
		})
	})
	
	function getList(bno, page){
		$.ajax({
			url : "/ex02/replies/" + bno + "/" + page,
			type : "get",
			dataType : "json",
			success : function(data){
				$("#list").empty();
				
				console.log(data);
				var source = $("#temp").html();
				var fn = Handlebars.compile(source);
				$("#list").html(fn(data));
				printPaging(data.pageMaker);
			}
		})
	}
	
	function printPaging(pageMaker){
		var str = "";
		if(pageMaker.prev){
			str += "<li><a href='" + pageMaker.startPage -1 + "'> << </a></li>"
		}
		
		for(var i = pageMaker.startPage; i <= pageMaker.endPage; i++){
			if(pageMaker.cri.page == i){
				str += "<li class='active'><a href='" + i + "'>"+ i +"</a></li>"
			}else{
				str += "<li><a href='" + i + "'>"+ i +"</a></li>"
			}
		}
				
		if(pageMaker.next){
			str += "<li><a href='" + pageMaker.endPage + 1 + "'> >> </a></li>"
		}
		
		$(".pagination").html(str);
	}
</script>
<script id="temp" type="text/x-handlebars-template">
{{#list}}	
<li'>댓글번호 : <input type='text' value='{{rno}}'> 댓글내용: <input type='text' value='{{replytext}}'> <button value='{{rno}}' class='modifyBtn'>수정</button><button value='{{rno}}' class='deleteBtn'>삭제</button></li><br>
{{/list}}
</script>
</head>
<body>
	<h1>ajax Test Page</h1>
	<div>
		<div>
			게시글 번호
			<input type="text" name="btn" id="bno">
		</div>
		<div>
			댓글 번호
			<input type="text" name="rno" id="rno">
		</div>
		<div>
			Replyer
			<input type="text" name="replyer" id="replyer">
		</div>
		<div>
			Reply Text
			<input type="text" name="replytext" id="replytext">
		</div>
		<button id="newReplyBtn">Add Reply</button>
		<button id="listBtn">List Reply</button>
	</div>
	<ul id="list">
	</ul>
	<ul class="pagination">
		
	</ul>
</body>
</html>