<!-- 웹폰트: Noto Sans Korean -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "woorigym.user.model.vo.UserTable" %>
<%
   UserTable user = (UserTable)session.getAttribute("loginSS");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
<script>
       function findAddr(){
           new daum.Postcode({
               oncomplete: function(data) {
                    
                   console.log(data);
                    
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var jibunAddr = data.jibunAddress; // 지번 주소 변수
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('postcode').value = data.zonecode;
                    if(roadAddr !== ''){
                        document.getElementById("basicaddr").value = roadAddr;
                    } 
                    else if(jibunAddr !== ''){
                        document.getElementById("basicaddr").value = jibunAddr;
                    }
                }
            }).open();
        }
       function closeWindow(){
    	   if($("#postcode").val()==""){
    		   alert("우편번호를 입력해주세요.");
    	   } else if($("#basicaddr").val()==""){
    		   alert("기본주소를 입력해주세요.");
    	   } else if($("#detailaddr").val()==""){
    		   alert("상세주소를 입력해주세요.");
    	   } else{
    		   $.ajax({ // JQuery 를 통한 ajax 호출 방식 사용
                   type: "get",
                   url: "orderinsertaddress",
                   data: { user_id: "<%=user.getUser_id() %>",
                		   postcode : $("#postcode").val(),
                		   basicaddr : $("#basicaddr").val(),
                		   detailaddr : $("#detailaddr").val()
                   },
                   success: function (data) {
                	  opener.location.reload();
                      window.close();
                       },
                       error : function(request,status,error) {
                           alert("code:"+request.status+"\n"+"message:"+request.responseText+
                           "\n"+"error:"+error+"주소지 추가 실패");
                           }
                   });
    		   
    	   }
    	  
           }
       

</script>
<style>
 body{
        font-family: 'Noto Sans KR', sans-serif;
        }
	button{
	border: 1px solid #ce4869;
	background-color:rgba(0,0,0,0);
	color: #ce4869;
	padding :  5px;
	border-radius: 5px;
	font-size:15px;
	}
	button:hover{
	background-color:#ce4869;
	color: white;
	padding :  5px;
	border-radius: 5px;
	cursor : pointer;
	font-size:15px;
	}
	#insert{
	border: 1px solid #ce4869;
	background-color:rgba(0,0,0,0);
	color: #ce4869;
	padding :  5px;
	border-radius: 5px;
	font-size:15px;
	}
	#insert:hover{
	background-color:#ce4869;
	color: white;
	padding :  5px;
	border-radius: 5px;
	cursor : pointer;
	font-size:15px;
	}
	.infos{
	width : 200px;
	height : 35px;
	margin : 5px 5px;
	}
	
</style>
<body>

<section>
	<button onclick="findAddr()">우편번호 찾기</button><br>
	<br>
	우편번호 : <input type="text" id="postcode" name="postcode" class="infos"> <br>
	기본주소 : <input type="text" id="basicaddr" name="basicaddr" class="infos"> <br>
	상세주소 : <input type="text" id="detailaddr" name="detailaddr" class="infos"> <br>
	<p><input type="submit" id="insert" value="추가" onclick="closeWindow()"></p>
	
</section>


</body>
</html>