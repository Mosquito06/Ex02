<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
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
		
		$("#modifyBtn").click(function(){
			var rno = $("#rno").val();
			var replytext = $("#replytext").val();
			
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
			getList(bno);
			
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
	})
	
	function getList(bno){
		$.ajax({
			url : "/ex02/replies/all/" + bno,
			type : "get",
			dataType : "json",
			success : function(data){
				$("#list").empty();
				
				console.log(data);
				$(data).each(function(i, reply){
					$("#list").append(
						"<li>" + "댓글번호 : " +reply.rno + " 댓글내용 : " + reply.replytext + "<button value='"+ reply.rno + "' class='deleteBtn'>삭제</button></li>"
					)
				})
			}
		})
	}
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
		<button id="modifyBtn">Modify Reply</button>
		<button id="listBtn">List Reply</button>
	</div>
	<ul id="list">
	</ul>
</body>
</html>