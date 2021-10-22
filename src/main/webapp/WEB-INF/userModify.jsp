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
<title>Insert title here</title>
<style>
.head {
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
/* 변경 버튼*/


/* 수정 , 취소 버튼 */
#modybtn{
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
span{
	font-size: 20;
}
</style>
</head>
<body>
	<!-- 공통헤더 템플릿 -->
	<%@ include file="template_header.jsp"%>
	<div>
           <h2 class = "head">개인 정보 수정</h2>
           <br><br>
               <form id="userModify" action="userModify" method="post">
                   <table border="1">
                       <tr>
                           <td><span>아이디</span></td>
                           <td><span>${loginSS.user_id}</span></td>
                       </tr>
                       <tr>
                           <td><span>이름</span></td>
                           <td><span>${loginSS.user_name}</span></td>
                       </tr>
                       <tr>
                           <td><span>연락처</span></td>
                           <td>
                           		<span>${loginSS.phone}</span>
                           		<button type="button" class="btn phone">휴대폰 번호 변경하기</button>
                           		<div id = "phone-text">
	                               <input type="text" id = "phone01" name="phone01" placeholder="010" maxlength="3" size = "3"> -
	                               <input type="text" id = "phone02" name="phone02" placeholder="0000" maxlength="4" size = "4"> -
	                               <input type="text" id = "phone03" name="phone03" placeholder="0000" maxlength="4" size = "4">
                               </div>
                               
                           </td>
                       </tr>
                       <tr>
                           <td><span>이메일</span></td>
                           <td>
                               <input type="text" id = "email" name="email" placeholder ="${loginSS.email}" maxlength="30">      
                                   <span>이메일 수신동의</span>       
                                   <input type="radio" class = "email_yn" name="email_ynStr" value= "1" ><span>동의</span>        
                                   <input type="radio" class = "email_yn" name="email_ynStr" value= "0" ><span>거부</span>                                     
                           </td>
                       </tr>
                       <tr>
						<td><span>비밀번호 변경</span></td>
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
</body>
</html>