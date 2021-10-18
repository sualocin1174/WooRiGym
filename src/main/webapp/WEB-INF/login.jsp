<!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="woorigym.user.model.vo.UserTable"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
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
/* 10/18 추가 */
/* style inputs and link buttons */
input,
.btn {
  padding: 12px;
  border: none;
  border-radius: 4px;
  margin: 5px 0;
  opacity: 0.85;
  display: inline-block;
  font-size: 17px;
  line-height: 20px;
  text-decoration: none; /* remove underline from anchors */
}

input{
border: 2px solid #e7e7e7;
}

input:hover,
.btn:hover {
  opacity: 1;
}
/* add appropriate colors to fb, twitter and google buttons */
.fb {
  background-color: #3B5998;
  color: white;
}

.twitter {
  background-color: #55ACEE;
  color: white;
}

.google {
  background-color: #dd4b39;
  color: white;
}
#login {
        padding: 6px 32px;
        margin: 10px 2px;
        background-color: white;
        color: black;
        border: 2px solid #555555;
        cursor: pointer;
        }
#login:hover {
        background-color: #555555;
        color: white;
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
                            <form id= "log-box" method="post" action="login">
                                <h2 id="head">로그인</h2>

                                <div class="form-group">
                                    <input type="text" placeholder="아이디" name="user_id" maxlength="20"><br>
                                </div>
                                <div class="form-group">
                                    <input type="password" placeholder="비밀번호" name="user_pwd" maxlength="20"><br>
                                </div>
                                <div class="form-group">
                                <input type="submit" value="로그인" id="login">
                                <!-- 10/18 추가: 소셜로그인 -->
                                <div class="col">
                                    <a href="#" class="fb btn">
                                      <i class="fa fa-facebook fa-fw"></i> Login with Facebook
                                     </a>
                                    <a href="#" class="twitter btn">
                                      <i class="fa fa-twitter fa-fw"></i> Login with Twitter
                                    </a>
                                    <a href="#" class="google btn"><i class="fa fa-google fa-fw">
                                      </i> Login with Google+
                                    </a>
                                  </div>
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