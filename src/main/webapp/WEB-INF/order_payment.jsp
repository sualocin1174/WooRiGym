<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <style>
    
    	#paymentinfo{
  	 	 width: 900px;
           padding: 30px 0 30px 0;
           margin: auto;
           bottom: 170px;
           left: 300px;
           
  	}
    </style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript">
  
  $(document).ready(function(){
	  //쿠폰불러오기
	  $.ajax({ // JQuery 를 통한 ajax 호출 방식 사용
			type : "post",
			url : "ordercoupon",
			data : {user_id : "<%=u.getUser_id() %>"},
     		dataType : "json", // 전달받을 객체는 JSON 이다.
			success : function(data) {
				console.log("쿠폰 정보 호출 성공");
				var couponinfo = data;
				// console.log(couponinfo[0].c_discount);
				var p =0;
				for(p in couponinfo){
					var selcoun = " <option id='c_name"+p+"'>"+couponinfo[p].c_name + " </option>";
					var selcoup = " <span id='c_name"+p+"dis' stlye='display: none'>"+couponinfo[p].c_discount + " </span>";
					$("#couponselect").append(selcoun);
					$("#paymentinfo").append(selcoup);
					
					p++;
				 }
				
				
				
				}
      });
  }); //ready
  
  
  function chageacouSelect(){
		if($("#couponselect option:selected")){
			if($("#couponselect option:selected").val() != "쿠폰 선택"){
				var couid = $("#couponselect option:selected").attr("id");
				var coudis = "#"+couid+"dis";
				console.log($(coudis).text());
				$("#coudiscount").val($(coudis).text());
			}
    	
    } ;
		
	}
 
  </script>


    

<div id="paymentinfo">
- 결제정보 <br>
총 상품 가격 : <span id="totalprice"></span><br>
적립금 사용 : <span id="usemile">사용할 금액 : <input type="text" placeholder="0" id="insertmile"> 현재 금액 : <input type="text" id="availmile"></span><br>
쿠폰 사용 : <span id="usecoupon"><select id="couponselect" onchange="chageacouSelect()"><option>쿠폰 선택</option></select>적용 금액 : <input id="coudiscount"></span><br>
배송비 : <span id="shippingfee"></span><br>
총결제금액 : <span id="lastprice"></span>
결제 수단 : <span id="paymethod"></span><br>

</div>