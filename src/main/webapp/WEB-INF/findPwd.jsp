
<!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style>
#head {
	text-align: center;
	margin-bottom: 15px;
}

#login-btn {
	text-emphasis-color: gray;
	background-color: black;
}

#login-menu {
	text-align: center;
	margin-top: 10px;
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
input{
border: 2px solid #e7e7e7;
}
input,
.btn {
  padding: 12px;
  border-radius: 4px;
  margin: 5px 0;
  opacity: 0.85;
  display: inline-block;
  font-size: 17px;
  line-height: 20px;
  text-decoration: none; /* remove underline from anchors */
}
input:hover,
.btn:hover {
  opacity: 1;
}

#findPwd {
padding: 6px 32px;
        margin: 10px 2px;
        background-color: white;
        color: black;
        border: 2px solid #555555;
        cursor: pointer;
}

#findPwd:hover {
background-color: #555555;
        color: white;
}
</style>
</head>
<body>
<!-- 공통헤더 템플릿 -->
    <%@ include file="template_header.jsp" %>

        <div class="container">
            <form id="log-box" method="post" action="findPwd">
                <h3 id="head">비밀번호 찾기</h3>
                <div class="form-group">
                    <input type="text" placeholder="아이디" name="user_id"><br>
                </div>
                <div class="form-group">
                    <input type="text" placeholder="이메일@xxx.com" name="email" maxlength="30"><br>
                </div>
                <div class="form-group">
                    <input type="submit" value="비밀번호 찾기" id="findPwd">
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
</body>

 </html>