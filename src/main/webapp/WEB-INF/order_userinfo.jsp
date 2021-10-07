<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import = "woorigym.user.model.vo.UserTable" %>
 
  <style>
  	#userinfo{
  	 	 width: 900px;
           padding: 30px 0 30px 0;
           margin: auto;
           bottom: 170px;
           left: 300px;
           
  	}
  	#userinfo span {
  		width: 400px;
  	}
  	
  	#userinfo span table{
  		width:400px;
  	}
  	
  </style>
 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript">

 
  //TODO 주문자정보 불러오기
  $(document).ready(function(){
        	//해당하는 상품정보 불러오기
        $.ajax({ // JQuery 를 통한 ajax 호출 방식 사용
			type : "post",
			url : "orderuserinfo",
			data : {user_id : "<%=u.getUser_id() %>"},
       		dataType : "json", // 전달받을 객체는 JSON 이다.
			success : function(data) {
				console.log("주문자 정보 호출 성공");
				var userinfo = data[0];
				console.log(userinfo);
				 $("#uname").text(userinfo.user_name);
				 $("#uphone").text(userinfo.phone.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3"));
				 $("#availmile").val(userinfo.mileage);
				 $("#insertmile").on("propertychange change keyup paste input", function() {
					 $("#availmile").val(userinfo.mileage - (1*$("#insertmile").val()));
				 });
				 
				 
			}
        });
       
        
        

    }); // ready
  
 
 
 
 </script>

 <div id="userinfo">
<p>주문자 정보</p>
이름 : <span id="uname"></span><br>
핸드폰 번호 : <span id="uphone"></span>
 
 </div>