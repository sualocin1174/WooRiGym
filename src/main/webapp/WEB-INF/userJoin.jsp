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
			
			 <div id="wrap">

                <br><br>
                <h2 align = "center">회원가입</h2>
                <br><br>
                      
                <form action="join" method="post">        
                    <table id = "">        
                        <tr>        
                            <td id="title">아이디</td>       
                            <td>       
                                <input type="text" id="user_id" name="user_id" placeholder="아이디" maxlength="20">        
                                <input type="button" value="중복확인" >            
                            </td>        
                        </tr>                                        
        
                        <tr>        
                            <td id="title">비밀번호</td>       
                            <td>       
                                <input type="password" name= user_pwd placeholder="비밀번호" maxlength="15">        
                            </td>        
                        </tr>
                                      
                        <tr>       
                            <td id="title">비밀번호 확인</td>      
                            <td>        
                                <input type="password" name="user_pwdtest" placeholder="비밀번호 확인" maxlength="15">       
                            </td>       
                        </tr>
                                            
                        <tr>        
                            <td id="title">이름</td>        
                            <td>        
                                <input type="text" name="user_name" placeholder="이름"  maxlength="40">       
                            </td>        
                        </tr>
                                            
                        <tr>       
                            <td id="title">연락처</td>       
                            <td>        
                                <input type="text" name="phone" placeholder="ex)010-1111-2222" maxlength="40">        
                            </td>        
                        </tr>
                         
                        <tr>       
                            <td id="title">주민등록번호</td>        
                            <td>       
                                <input type="text" name="identity_number" placeholder="뒷자리 7자리" maxlength="20">        
                            </td>        
                        </tr>
                         
                        <tr>        
                            <td id="title">성별</td>       
                            <td>       
                                <input type="radio" name="genderStr" value= 1 checked>남        
                                <input type="radio" name="genderStr" value= 0 checked>여       
                            </td>       
                        </tr>
                                           
                        <tr>       
                            <td id="title">생년월일</td>        
                            <td>        
                                <input type="text" name="birthday_yy" maxlength="4" placeholder="년(4자)" size="6" >       
                                <select name= "birthday_mm">        
                                    <option value="">월</option>        
                                    <option value="01" >1</option>        
                                    <option value="02" >2</option>       
                                    <option value="03" >3</option>       
                                    <option value="04" >4</option>       
                                    <option value="05" >5</option>        
                                    <option value="06" >6</option>       
                                    <option value="07" >7</option>        
                                    <option value="08" >8</option>        
                                    <option value="09" >9</option>        
                                    <option value="10" >10</option>        
                                    <option value="11" >11</option>        
                                    <option value="12" >12</option>        
                                </select>        
                                <input type="text" name="birthday_dd" maxlength="2" placeholder="일" size="4" >       
                            </td>       
                        </tr>
                                            
                        <tr>        
                            <td id="title">이메일</td>       
                            <td>       
                                <input type="text" name="email_1" maxlength="30">@       
                                <select name="email_2">       
                                    <option>naver.com</option>       
                                    <option>daum.net</option>       
                                    <option>gmail.com</option>       
                                    <option>nate.com</option>                             
                                </select>        
                            </td>        
                        </tr>
                                        
                        <tr>        
                            <td id="title">이메일 수신동의</td>        
                            <td>       
                                <input type="radio" name="email_ynStr" value= "0" checked>거부        
                                
                                <input type="radio" name="email_ynStr" value= "1" checked>동의        
                            </td>        
                        </tr>                                           
                    </table>        
                    <br>        
                    <input class="btn" type="submit" value="회원가입"/>  
                    <input class="btn" type="button" onclick="history.back()" value="취소">
                </form>
        
            </div>
</body>

</html>