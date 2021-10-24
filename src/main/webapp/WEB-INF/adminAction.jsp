<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		if(result == "관리자 로그인 성공"){
			alert("관리자 로그인화면입니다.");
			location.href = "amain";
		}
	</script>
</body>
</html>