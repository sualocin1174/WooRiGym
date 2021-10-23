<!-- 웹폰트: Noto Sans Korean -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
   <!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<style>
 /* reset */
 * {
            margin: 0;
            padding: 0;
}
body{
        font-family: 'Noto Sans KR', sans-serif;
    }
/* 회원정보 수정 */
.head {
	text-align: center;
	margin-bottom: 30px;
}
/* 테이블 */
table{
	margin: auto;
	border-collapse: collapse;
	border: 1px solid black;
}
/* 글씨크기 */
#userModify td{
	font-size: 1.2rem;
}
/* TODO: 이메일 수신동의 밑에 줄 없애기 */
#userModify tr:nth-of-type(5)>td:last-child{
      	border-top: 1px solid white;
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
  text-decoration: none;
}
input{
border: 2px solid #e7e7e7;
}

input:hover,
.btn:hover {
  opacity: 1;
}
/* 휴대폰 번호 변경 버튼 */
   .button{
        padding: 4px 8px;
        text-align: center;
        text-decoration: none;
        font-size: 1rem;
        margin: 25px 10px;
        transition-duration: 0.2s;
        cursor: pointer;
        background-color: white;
        color: dodgerblue;
        border: 2px solid dodgerblue;
        border-radius: 5px;
  }
    .button:hover {
        background-color: dodgerblue;
        color: white;
  }
/* 수정 , 취소 버튼 */
#modybtn{
margin-top: 20px;
text-align: center;
}

#modybtn>input{
        padding: 6px 32px;
        margin: 10px 2px;
        background-color: white;
        color: black;
        border: 2px solid #555555;
        cursor: pointer;
        }
#modybtn>input:hover {
        background-color: #555555;
        color: white;
        }
td{
	padding: 15px;
	text-align: left;
	}
#phone-text{
	display: none;
}
/* 체크박스 */
        .container {
	  position: relative;
	  padding-left: 30px;
	  cursor: pointer;
	  font-size: 1rem;
	  -webkit-user-select: none;
	  -moz-user-select: none;
	  -ms-user-select: none;
	  user-select: none;
	}
	/* Hide the browser's default radio button */
	.container input {
	  position: absolute;
	  opacity: 0;
	  cursor: pointer;
	}
	/* 새로 만든 라디오 버튼 */
	.checkmark {
	margin-left:2px;
	position: absolute;
	top: 2px;
	left: 0;
	  height: 20px;
	  width: 20px;
	  background-color: #eee;
	  border-radius: 50%;
	}
	/* On mouse-over, add a grey background color */
	.container:hover input ~ .checkmark {
	  background-color: #ccc;
	}
	/* When the radio button is checked, add a blue background */
	.container input:checked ~ .checkmark {
	  background-color: dodgerblue;
	}
	/* Create the indicator (the dot/circle - hidden when not checked) */
	.checkmark:after {
	  content: "";
	  position: absolute;
	  display: none;
	}
	/* Show the indicator (dot/circle) when checked */
	.container input:checked ~ .checkmark:after {
	  display: block;
	}
	/* Style the indicator (dot/circle) */
	.container .checkmark:after {
	 	top: 6px;
		left: 6px;
		width: 8px;
		height: 8px;
		border-radius: 50%;
		background: white;
	}
</style>
</head>
<body>
	<!-- 공통헤더 템플릿 -->
	<%@ include file="template_header.jsp"%>
<section>
	<div>
           <h2 class="head">회원 정보 수정</h2>
               <form id="userModify" action="userModify" method="post">
                   <table border="1">
                       <tr>
                           <td>아이디</td>
                           <td>${loginSS.user_id}</td>
                       </tr>
                       <tr>
                           <td>이름</td>
                           <td>${loginSS.user_name}</td>
                       </tr>
                       <tr>
                           <td>연락처</td>
                           <td>
                           		${loginSS.phone}
                           		<button type="button" class="button btn phone">휴대폰 번호 변경</button>
                           		<div id = "phone-text">
	                               <input type="text" id = "phone01" name="phone01" placeholder="010" maxlength="3" size = "3"> -
	                               <input type="text" id = "phone02" name="phone02" placeholder="0000" maxlength="4" size = "4"> -
	                               <input type="text" id = "phone03" name="phone03" placeholder="0000" maxlength="4" size = "4">
                               </div>
                               
                           </td>
                       </tr>
                       <tr>
                           <td rowspan='2'>이메일</td>
                           <td>
                               <input type="text" id = "email" name="email" placeholder ="${loginSS.email}" maxlength="30"></td>      
                                   
                       </tr>
                       <tr>
                       		<td>이메일 수신동의      
                           <label class="container" for="email_yes"><input type="radio" class = "email_yn" id='email_yes' name="email_ynStr" value= "1" >동의<span class="checkmark"></span></label>       
                           <label class="container" for="email_no"><input type="radio" class = "email_yn" id='email_no' name="email_ynStr" value= "0" >거부<span class="checkmark"></span></label>                                
                           </td>
                       </tr>
                       <tr>
						<td>비밀번호 변경</td>
						<td>
                            <input type="password" id = "user_pwd" name= user_pwd placeholder="현재 비밀번호" maxlength="15"><br>
                            <input type="password" id = "new_user_pwd" name= new_user_pwd placeholder="새로운 비밀번호 입력" maxlength="15"><br>
                            <input type="password" id = "new_user_pwd" name= new_user_pwd placeholder="새로운 비밀번호 확인" maxlength="15">
                        </td>
                        </tr>
                   </table>
                    <div id="modybtn">
                       <input class="modybtn" id = "modybtn" type="submit" value="수정">  
                       <input class="btn gohome" type="button" onclick="location.href= 'main'" value="취소">
               		</div>
               </form>
	</div>
<script>
	$(".btn.phone").click(function (){
		$("#phone-text").css("display", "block");
	});
</script>
</section>
</body>
</html>