<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		var pw1 = $("#pw1").value();
		var pw2 = $("#pw2").value();
		console.log(pw1);
		console.log(pw2);
		if(pw1 != pw2){
			alert("동일하게 입력해주세요");
			return false;
		} 
		var regExp = /^[A-Z][A-za-z0-9_!]{7,15}$/;
		if(!regExp.test(pw1)){
			alert("영어 대소문자  + 숫자 + 특수문자(_#) 조건에 맞게 입력해주세요.");
			return false;
		}
		
		var name = $("#name")
		</script>
</body>
</html>