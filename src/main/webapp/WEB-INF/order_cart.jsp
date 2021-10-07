<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "woorigym.user.model.vo.UserTable" %>
<%
 UserTable user = (UserTable)session.getAttribute("user_id");
%>
    
<%@page import = "woorigym.user.model.vo.UserTable" %>

<style>
	#buyproduct{
	 	 width: 900px;
         padding: 30px 0 30px 0;
         margin: auto;
         bottom: 170px;
         left: 300px;
         
	}
	#buyproduct span {
		width: 400px;
	}
	
	#buyproduct span table{
		width:400px;
	}
	
</style>
     <script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	var totalpro = "";
    $(document).ready(function(){
        	//해당하는 상품정보 불러오기
        $.ajax({ // JQuery 를 통한 ajax 호출 방식 사용
			type : "post",
			url : "orderproduct",
			data : {user_id : "<%=u.getUser_id() %>"},
       		dataType : "json", // 전달받을 객체는 JSON 이다.
			success : function(data) {
				var product = data;
				console.log(product);
				var ptext ="<tr><td>상품명</td><td>상품가격<td></tr>";
				var p = 0;
				 for(var i in product){
					 let pricecomma = comma(product[i].price);
					 console.log(pricecomma);
					 ptext += "<tr><td>"+product[i].productName+"</td><td id=product"+p+">"+pricecomma+"<td></tr>";
					 p++;
				 }
				 $("#productinfo").html(ptext);
				}
        });
        	//카트에서 상품 수량 가져오기
        $.ajax({ // JQuery 를 통한 ajax 호출 방식 사용
			type : "post",
			url : "order",
			data : {user_id : "<%=u.getUser_id() %>"},
       		dataType : "json", // 전달받을 객체는 JSON 이다.
			success : function(data) {
				var cart = data;
				console.log(cart);
				var ctext ="<tr><td>수량</td><td>총가격</td></tr>";
				
				var p = 0;
				var producttotal=0;
				 for(var i in cart){
					 let priceXquant = ((1*cart[i].cartQuantity)*(1*minusComma($('#product'+p).text())));
					 ctext += "<tr><td>"+cart[i].cartQuantity+"</td><td>"+comma(priceXquant)+"원"+"</td><td><button>삭제</button></td></tr>";
					 producttotal +=priceXquant;
					 p++;
				 }
				 $("#cartinfo").html(ctext);
				 $("#producttotal").text(comma(producttotal)+"원");
				 $("#totalprice").text(comma(producttotal)+"원");
				}
			//error : function(request,status,error) {
				//alert("code:"+request.status+"\n"+"message:"+request.responseText+
				//"\n"+"error:"+error);
				//}
		});
        
        

    }); // ready
    //콤마 제거
    function minusComma(value){
        value = value.replace(/[^\d]+/g, "");
        return value; 
    }
    
    //콤마 추가
    function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }

    </script>
    
    
    
   
 <div id="buyproduct">
            구매상품<br>
            <span style="float:left;">
                <table id="productinfo">
                  
                </table>
            </span>
            <span style="float:left;">
                <table id ="cartinfo">
                    
                </table>
            </span>
            <table style="width:800px;"> <tr>
                <td>총 상품금액</td>
                <td id="producttotal">원</td>
            </tr></table>
           
        </div>
       
        
        