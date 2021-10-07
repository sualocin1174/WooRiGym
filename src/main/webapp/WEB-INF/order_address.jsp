<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <style>
    	#addressinfo{
  	 	 width: 900px;
           padding: 30px 0 30px 0;
           margin: auto;
           bottom: 170px;
           left: 300px;
  	}
    </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript">
  
  

 
  //TODO 주문자정보 불러오기
  $(document).ready(function(){
        	//해당하는 상품정보 불러오기
        $.ajax({ // JQuery 를 통한 ajax 호출 방식 사용
			type : "post",
			url : "orderaddress",
			data : {user_id : "<%=u.getUser_id() %>"},
       		dataType : "json", // 전달받을 객체는 JSON 이다.
			success : function(data) {
				console.log("주소지 정보 호출 성공");
				var addressinfo = data;
				console.log(addressinfo);
				$("#fixedaddress").html(addressinfo[0].postcode+" "+  addressinfo[0].basic_address + addressinfo[0].detail_address);
				var p = 1;
				for(p in addressinfo){
					 var seladdr = " <option>"+addressinfo[0].postcode+" "+addressinfo[p].basic_address +""+ addressinfo[p].detail_address + " </option>";
					 $("#selectaddress").append(seladdr);
					 p++;
				 }
				}
        });
        	
        

       
    }); // ready
    function chageaddrSelect(){
		if($("#selectaddress option:selected")){
			if($("#selectaddress option:selected").val() != "배송지 목록에서 선택"){
				$("#fixedaddress").html($("#selectaddress option:selected").val());
			}
        	
        } ;
		
	}
  
 </script>
 
 
 <div id="addressinfo">
 배송지 정보<br>
 <button>우편번호 찾기</button><br>
 <select id="selectaddress" onchange="chageaddrSelect()">
        <option>배송지 목록에서 선택</option>
</select>
<br>

주소 : <span id="fixedaddress"></span><br>
요청사항 : <textarea rows="5" cols="20"></textarea>

 </div>