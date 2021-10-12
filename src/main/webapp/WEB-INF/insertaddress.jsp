<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "woorigym.user.model.vo.UserTable" %>
<%
   UserTable user = (UserTable)session.getAttribute("LoginInfo");
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
                   }
               });
           }
       

</script>
<body>

<section>
	<button onclick="findAddr()">우편번호 찾기</button><br>
	우편번호 : <input type="text" id="postcode" name="postcode"> <br>
	기본주소 : <input type="text" id="basicaddr" name="basicaddr"> <br>
	상세주소 : <input type="text" id="detailaddr" name="detailaddr"> <br>
	<p><input type="submit" value="추가" onclick="closeWindow()"></p>
	
</section>


</body>
</html>