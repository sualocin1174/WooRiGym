<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<title>회원만 접근허용</title>
<script>
	alert("로그인 후 볼 수 있는 페이지 입니다.\n로그인 페이지로 이동합니다.");
	//history.go(-1); //뒤로가기
	location.href = "login";
</script>