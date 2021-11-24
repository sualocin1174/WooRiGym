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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<%@include file = "/WEB-INF/joinError.jsp" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
/* reset */
        * {
            margin: 0;
            padding: 0;
        }
        body{
        font-family: 'Noto Sans KR', sans-serif;
        }
#head {
	text-align: center;
	margin-bottom: 15px;
}
/* 회원가입 테이블 */
#joinform table{
	margin: auto;
}
#joinform th{
text-align: left;
padding: 20px;
}
input,
.btn {
  padding: 12px;
  border-radius: 4px;
  margin: 8px 0;
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
/* 중복확인, 우편번호 찾기 버튼 */
.button {
 border-color: #2196F3;
 background: white;
  color: dodgerblue;
  cursor: pointer;
}

.button:hover{
background: #2196F3;
  color: white;
}
  /* 체크박스 */
        .container {
	  position: relative;
	  padding-left: 35px;
	  margin-bottom: 12px;
	    margin-right: 8px;
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
	/* Create a custom radio button */
	.checkmark {
	  position: absolute;
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
                            <th id="title">아이디</th>       
                            <td>       
                                <input type="text" id="user_id" name="user_id" placeholder="아이디" maxlength="20">        
                                <input type="button" value="중복확인" class="button" id="checkId">
                                <span id="id_check"></span>            
                            </td>        
                        </tr>                                        
        
                        <tr>        
                            <th id="title">비밀번호</th>       
                            <td>       
                                <input type="password" id = "user_pwd" name= user_pwd placeholder="비밀번호" maxlength="15">
                                <div class = "user_pwd regex"></div>        
                            </td>        
                        </tr>
                                      
                        <tr>       
                            <th id="title">비밀번호 확인</th>      
                            <td>        
                                <input type="password" id = "user_pwdtest" name="user_pwdtest" placeholder="비밀번호 확인" maxlength="15">
                                <div class = "user_pwdtest regex"></div>        
                            </td>       
                        </tr>
                                            
                        <tr>        
                            <th id="title">이름</th>        
                            <td>        
                                <input type="text" id = "name" name="user_name" placeholder="이름"  maxlength="40">
                                <div class="name regex"></div>       
                            </td>        
                        </tr>
                                            
                        <tr>       
                            <th id="title">연락처</th>       
                            <td>        
                                <input type="text" id = "phone01" name="phone01" placeholder="010" maxlength="3" size = "3"> -
                                <input type="text" id = "phone02" name="phone02" placeholder="0000" maxlength="4" size = "4"> -
                                <input type="text" id = "phone03" name="phone03" placeholder="0000" maxlength="4" size = "4">
                                <input type="hidden" id = "phone" value=""> 
                                <div class = "phone01 regex"></div>        
                            </td>        
                        </tr>
                         
                        <tr>       
                            <th id="title">주민등록번호</th>        
                            <td>       
                                <input type="text" id = "identity_number" name="identity_number" placeholder="뒷자리 7자리" maxlength="7">
                                <div class="identity_number regex"></div>        
                            </td>        
                        </tr>
                         
                        <tr>        
                            <th id="title">성별</th>       
                            <td>       
                                <label for="male"><input type="radio" id = "male" class="gender" name="genderStr" value= 1 >남<span class="checkmark"></span></label>
                                <label for="female"><input type="radio" id = "female" class="gender" name="genderStr" value= 0 >여<span class="checkmark"></span></label>
                                <div class="genderT regex"></div>       
                            </td>       
                        </tr>
                                           
                        <tr>       
                            <th id="title">생년월일</th>        
                            <td>        
                                <input type="text" id = "birthday_yy" name="birthday_yy" maxlength="4" placeholder="년(4자)" size="6" >       
                                <select id = "birthday_mm" name= "birthday_mm">        
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
                                <input type="text" id = "birthday_dd" name="birthday_dd" maxlength="2" placeholder="일" size="4" >       
                            </td>       
                        </tr>
                                            
                        <tr>        
                            <th id="title">이메일</th>       
                            <td>       
                                <input type="text" id = "email_1" name="email_1" maxlength="30">@       
                                <select id = "email_2" name="email_2">       
                                    <option>naver.com</option>       
                                    <option>daum.net</option>       
                                    <option>gmail.com</option>       
                                    <option>nate.com</option>                             
                                </select>        
                            </td>        
                        </tr>
                                        
                        <tr>        
                            <th id="title">이메일 수신동의</th>        
                            <td>       
                                <label for="email_yes"><input type="radio" class="emailyn" id = "email_yes" name="email_ynStr" value= "1" >동의<span class="checkmark"></span></label>        
                                <label for="email_no"><input type="radio" class="emailyn" id = "email_no" name="email_ynStr" value= "0" >거부<span class="checkmark"></span></label>
                                <div class="emailynT regex"></div>         
                            </td>        
                        </tr>
                        <tr>
                        <th id="title">배송지</th>
                        <td>
                        <input type="text" id="sample6_postcode" name = "postcode" placeholder="우편번호">
						<input type="button" onclick="sample6_execDaumPostcode()" class="button" value="우편번호 찾기"><br>
						<input type="text" name = "basic_address" id="sample6_address" placeholder="주소"><br>
						<input type="text" name = "detail_address" id="sample6_detailAddress" placeholder="상세주소" value=" ">
						<input type="text" id="sample6_extraAddress" placeholder="참고항목">
                        </td>
                        </tr>                                          
                    </table>        
                    <br> 
            <div id="btnJoin">
                    <input class="joinbtn" id = "joinbtn" type="button" value="회원가입">  
                    <input class="btn" type="button" onclick="history.back();" value="취소">
			</div>
</form>
</div>

<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</body>
</html>