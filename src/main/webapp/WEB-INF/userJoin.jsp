   <!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<h4 id="head">회원가입</h4>
			<form action="join" method="post">
				
				<div class="form-group">
					아이디<input type="text" placeholder="아이디" name="user_id" maxlength="20">
					<br>
				</div>
				<div class="form-group">
					비밀번호<input type="password" placeholder="비밀번호" name="user_pwd" maxlength="20"><br>
				</div>
				<div class="form-group">
					비밀번호 확인<input type="password" placeholder="비밀번호 확인" name="user_pwdtest" maxlength="20"><br>
				</div>
				<div class="form-group">
					이름<input type="text" placeholder="이름" name="user_name" maxlength="20">
					<br>
				</div>
				<div class="form-group">
					이메일<input type="text" placeholder="이메일" name="email" maxlength="20"><br>
				</div>
				<div class="form-group">
					연락처<input type="text" placeholder="ex)010-1111-2222" name="phone" maxlength="20"><br>
				</div>
				<div class="form-group">
					생년월일<input type="text" placeholder="ex)1997/03/30" name="birthday" maxlength="20"><br>
				</div>
				<div class="form-group">
					주민등록번호<input type="text" placeholder="뒷자리 7자리" name="identity_number" maxlength="20"><br>
				</div>
				
				<div class="form-group">
				<input type="submit" value="회원가입">
				</div>



<div id="login-menu">				
					<ul>
					<li><a href="findId">아이디</a></li>
					<li><a href="findPwd">비밀번호 찾기</a></li>
					</ul>
				</div>
        </form>
    </div>
</body>

</html>