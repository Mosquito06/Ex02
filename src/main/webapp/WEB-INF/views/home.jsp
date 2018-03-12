<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
		$(function(){
			$("#btn1").click(function(){
				$.ajax({
					url: "/ex02/json/map",
					dataType: "json",
					type: "get",
					success : function(data){
						console.log(data);
					}
					
				})
			})
			
			$("#btn2").click(function(){
				$.ajax({
					url: "/ex02/json/sendList",
					dataType: "json",
					type: "get",
					success : function(data){
						console.log(data);
					}
					
				})
			})
			
			$("#btn3").click(function(){
				$.ajax({
					url: "/ex02/json/sendMapAuth",
					dataType: "json",
					data : {"test": "동환", "test2" : 11},
					type: "get",
					success : function(data){
						console.log(data);
					}
					
				})
			})
			
			
		})
	
	</script>
</head>
<body>
	<button id="btn1">map test</button>
	<button id="btn2">list test</button>
	<button id="btn3">response test</button>
</body>
</html>
