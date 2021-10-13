   <!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <!-- 부트스트랩 CDN -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% response.setStatus(HttpServletResponse.SC_OK); %>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>login page</title>
<style>
#head {
	text-align: center;
	position: relative;
	top: 10px;
}

#login-btn {
	text-emphasis-color: gray;
	background-color: black;
}

#login-menu {
	text-align: center;
}

#login-menu>ul {
	list-style-type: none;
	position: relative;
}

#login-menu li {
	display: inline-block;
}

/* 아이디 | 비밀번호 찾기 | 회원가입 */
#login-menu li::after {
	padding: 10px;
	content: "|";
}

#login-menu li:last-child::after {
	padding: 15px;
	content: "";
}
.form-group{
	text-align: center;
	position: relative;
	top: 10px;
}
</style>
</head>
<body>
	<!-- 공통헤더 템플릿 -->
	<%@ include file="template_header.jsp"%>
	
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			
			<form action="join" method="post">
				<h4 id="head">회원가입</h4>
				<div class="form-group">
					아이디<input type="text" placeholder="아이디" name="user_id" maxlength="20">
					<input type="submit" value="아이디중복">
					<br>
				</div>
				<div class="form-group">
					비밀번호<input type="password" placeholder="비밀번호" name="user_pwd" maxlength="20"><br>
				</div>
				<div class="form-group">
					비밀번호 확인<input type="password" placeholder="비밀번호 확인" name="user_pwdtest" maxlength="20"><br>
				</div>
				<div class="form-group">
					연락처<input type="text" placeholder="ex)010-1111-2222" name="phone" maxlength="20"><br>
				</div>
				<div class="form-group">
					이메일<input type="text" placeholder="이메일" name="email" maxlength="20"><br>
				</div>
				<div class="form-group">
					주민등록번호<input type="text" placeholder=" 뒷자리 7자리" name="user_pwd" maxlength="20"><br>
				</div>
				<div class="form-group">
				<input type="submit" value="회원가입">
				</div>
				<div id="login-menu">
				
					<ul>
					<li><a href="#">아이디</a></li>
					<li><a href="#">비밀번호 찾기</a></li>
					</ul>
				</div>
			</form>
</body>

</html>