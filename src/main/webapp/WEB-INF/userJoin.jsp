   <!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file = "/WEB-INF/joinError.jsp" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
#head {
	text-align: center;
	margin-bottom: 15px;
}
table{
	margin: auto;
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
input{
border: 2px solid #e7e7e7;
}

input:hover,
.btn:hover {
  opacity: 1;
}

/* 라디오 버튼 */
input[radio]{
padding: 5px;
}
select{
  padding: 12px;
  border-radius: 4px;
  margin: 5px 0;
  opacity: 0.85;
  display: inline-block;
  font-size: 17px;
  line-height: 20px;
  text-decoration: none; /* remove underline from anchors */
}
/* 중복확인 버튼 */
#checkId{
 border-color: #2196F3;
 background: white;
  color: dodgerblue;
  cursor: pointer;
}

#checkId:hover{
background: #2196F3;
  color: white;
}

/* 회원가입, 취소 버튼 */
#btnJoin{
text-align: center;
}

#btnJoin>input{
        padding: 6px 32px;
        margin: 10px 2px;
        background-color: white;
        color: black;
        border: 2px solid #555555;
        cursor: pointer;
        }
#btnJoin>input:hover {
        background-color: #555555;
        color: white;
        }
</style>
</head>
<body>
	<!-- 공통헤더 템플릿 -->
	<%@ include file="template_header.jsp"%>
		<div id="wrap">   
           <h2 id= "head">회원가입</h2>
            <br><br>
                <form id = "joinform" action="join" method="post">        
                    <table>        
                        <tr>        
                            <td id="title">아이디</td>       
                            <td>       
                                <input type="text" id="user_id" name="user_id" placeholder="아이디" maxlength="20">        
                                <input type="button" value="중복확인" id="checkId">
                                <span id="id_check"></span>            
                            </td>        
                        </tr>                                        
        
                        <tr>        
                            <td id="title">비밀번호</td>       
                            <td>       
                                <input type="password" id = "user_pwd" name= user_pwd placeholder="비밀번호" maxlength="15">
                                <div class = "user_pwd regex"></div>        
                            </td>        
                        </tr>
                                      
                        <tr>       
                            <td id="title">비밀번호 확인</td>      
                            <td>        
                                <input type="password" id = "user_pwdTest" name="user_pwdtest" placeholder="비밀번호 확인" maxlength="15">
                                <div class = "user_pwdTest"></div>        
                            </td>       
                        </tr>
                                            
                        <tr>        
                            <td id="title">이름</td>        
                            <td>        
                                <input type="text" id = "name" name="user_name" placeholder="이름"  maxlength="40">
                                <div class="name"></div>       
                            </td>        
                        </tr>
                                            
                        <tr>       
                            <td id="title">연락처</td>       
                            <td>        
                                <input type="text" name="phone01" placeholder="010" maxlength="3" size = "3"> -
                                <input type="text" name="phone02" placeholder="0000" maxlength="4" size = "4"> -
                                <input type="text" name="phone03" placeholder="0000" maxlength="4" size = "4">       
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
                                <input type="radio" name="genderStr" value= 1 >남        
                                <input type="radio" name="genderStr" value= 0 >여       
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
                                <input type="radio" name="email_ynStr" value= "1" >동의        
                                <input type="radio" name="email_ynStr" value= "0" >거부        
                            </td>        
                        </tr>                                           
                    </table>        
                    <br> 
            <div id="btnJoin">
                    <input class="joinbtn" id = "joinbtn" type="button" value="회원가입">  
                    <input class="btn" type="button" onclick="history.back()" value="취소">
			</div>
</form>
</div>

<script type="text/javascript">
//아이디 유효성 검사(1 = 중복 / 0 != 중복)


	



</script>
</body>
</html>