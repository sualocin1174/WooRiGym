<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<script>
		var result = "${result}";
		console.log(result);
		var msg = "";
		if(result == "관리자 로그인 성공"){
			alert("관리자 로그인화면입니다.");
			location.href = "amain";
		} else{
			if("${loginSS}" != "") {
				msg += "${loginSS.user_id}님, ";
			}
			msg +="로그인 하셨습니다.";
			alert(msg);
			location.href = "main";
		}
		
	</script>
</body>
</html>