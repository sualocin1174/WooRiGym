
<!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/template_header.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="woorigym.user.model.vo.UserTable"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login page</title>
<style>
#head {
	text-align: center;
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
	text-align:center;
}

</style>
</head>
<body>
<script>
	var result = "${result}";
	console.log(result);
	if(result == "로그인실패") {
		alert("아이디와 패스워드가 일치하지 않습니다. 다시 확인하고 로그인해주세요");
	}
</script>
            <!-- 공통헤더 템플릿 -->
            <%@ include file="template_header.jsp" %>

                <div class="container">
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                        </ol>

                        <div class="container">
                            <form id= "log-box" method="post" action="login">
                                <h4 id="head">로그인</h4>

                                <div class="form-group">
                                    <input type="text" placeholder="아이디" name="user_id" maxlength="20"><br>
                                </div>
                                <div class="form-group">
                                    <input type="password" placeholder="비밀번호" name="user_pwd" maxlength="20"><br>
                                </div>
                                <div class="form-group">
                                <input type="submit" value="로그인">
                                </div>
                            </form>
                                <div id="login-menu">
                                    <ul>
                                        <li><a href="findId">아이디 찾기</a></li>
                                        <li><a href="findPwd">비밀번호 찾기</a></li>
                                        <li><a href="join">회원가입</a></li>
                                    </ul>
                                </div>

                        </div>
                    </div>
                </div>
        </body>

        </html>