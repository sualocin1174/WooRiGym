   <!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import = "java.util.ArrayList"%>
<%@page import = "woorigym.product.model.vo.ProductTable" %>
<!--<a href = "${path}/shop/product/list.do">상품목록</a>-->
<!--<a href = "${path}/shop/product/write.do">상품등록</a>-->
<%
	ArrayList<ProductTable> productlist = (ArrayList<ProductTable>)request.getAttribute("productlist");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 메인페이지</title>
       <!-- /* content */-->
       <style>
            section {
                width: 900px;
                padding: 0 0 30px 0;
                position: relative;
		        bottom: 250px;
		        left: 260px;
            }
          /* 10/19 추가*/
         	input{
			border: 2px solid #e7e7e7;
			}
			input,
			.btn {
			  padding: 8px;
			  border-radius: 4px;
			  margin: 5px 0;
			  opacity: 0.85;
			  display: inline-block;
			  font-size: 17px;
			  line-height: 20px;
			  text-decoration: none;
			}
			input:hover,
			.btn:hover {
			  opacity: 1;
			}
			/*검색, 추가, 수정, 삭제 버튼*/
			.button{
	        padding: 5px;
	        text-align: center;
	        text-decoration: none;
	        font-size: 16px;
	        margin: 5px;
	        transition-duration: 0.3s;
	        cursor: pointer;
	        background-color: white;
	        color: black;
	        border: 2px solid #e7e7e7;
	        }

	        .button:hover {
	            background-color: #e7e7e7;
	        }
			/* 상품 테이블 */
			#product_table{
			width: 400px;
			}
			#product_table td {
			margin: 0 0 30px 0;
			}
			
			/* 이미지 추가 버튼 */
			#img_btn{
			 border-color: #2196F3;
			 background: white;
			  color: dodgerblue;
			  cursor: pointer;
			}
			
			#img_btn:hover{
			background: #2196F3;
			  color: white;
			}
			
			/*등록, 취소 버튼*/
			.btn_collection {
			text-align: center;
			}
			
			.btn_collection input, .btn_collection button {
			padding: 6px 32px;
	        margin: 10px 2px;
	        background-color: white;
	        color: black;
	        border: 2px solid #555555;
	        cursor: pointer;
			}
			
			.btn_collection input:hover, .btn_collection button:hover {
			background-color: #555555;
       		color: white;
			}
			/* 사이드바 */
			aside{
	        display: inline-block;
			 padding: 30px 0 0 30px;
			 }
		 	#side-menu>ul>li{
		        padding: 5px;
		        list-style-type: none;
		     }
		     /* 메인페이지 폰트 크게 */
		    #side-menu>ul>li:first-child{
		         font-size: 25px;
		    }
    </style>
</head>

<body>
	<!-- 공통헤더 템플릿 -->
 	<%@ include file="template_header.jsp"%>
 	<!-- 10/10 메인페이지 사이드바 추가: <aside>~</aside>
 	추후 template_admin_aside.jsp로 따로 생성하고 include해서 쓰시는걸 추천합니다  -->
 	<aside>
 <div id="side-menu">
     <ul>
         <li>메인페이지</li>
         <li><a href="#">상품관리</a></li>
         <li><a href="apupage">팝업공지</a></li>
         <li><a href="#">매출관리</a></li>
         <li><a href="#">주문내역 확인</a></li>
         <li><a href="#">배송현황 관리</a></li>
         <li><a href="#">교환/반품/환불 승인</a></li>
         <li><a href="#">Q&A 문답관리</a></li>
     </ul>
 </div>
</aside>
 <section>
    <input type="text" id="input" name="input" placeholder="상품번호를 입력해주세요.">
    <button type="button" id="btn_search" class="button" name="btn_search">검색</button>
    <button type="button" id="btn_insert" class="button" name="btn_insert">추가</button>
    <button type="button" id="btn_update" class="button" name="btn_update">수정</button>
    <button type="button" id="btn_delete" class="button" name="btn_delete">삭제</button>
	<div id="product">검색한 상품 출력하는 위치</div>
	<br><br>
	<form id="form1" name="form1" action="apadd" method="post" enctype="multipart/form-data">
		<div id = "header">
			<div id = "imgCollection">
				<div id = "imgCollection_1">
					<label>이미지 추가</label>
					<img name="stepImg_1" id="stepImg_1">
					<input type="file"name="productInfoUrl" required="required">
            		<input name="addButton" type="button" id="img_btn" value="추가">
				</div>
			</div>
			<input type="hidden" name="stepCount" id="stepCount" readonly value="1">
			<div id="content">
				<br><label>상품 번호</label>
				<input type="text" name="productNo" id="prodNo" required="required" placeholder="상품 번호를 입력해주세요."><br><br>
		
	<div id="productOption">
		<table id="product_table">
			<tr>
                <td>상품명</td>
                <td><input type="text" name="productName" id="productName" required="required" placeholder="상품명을 입력해주세요."></td>
            </tr>
            <tr>
                <td>상품 가격</td>
                <td><input type="text" name="price" id="price" required="required" placeholder="상품 가격을 입력해주세요."></td>
            </tr>
            <tr>
                <td>상품 옵션</td>
                <td><input type="text" name="productOption" id="option" required="required" placeholder="상품 옵션을 입력해주세요."></td>
            </tr>
            <tr>
                <td>상품 수량</td>
                <td><input type="text" name="quantity" id="quantity" required="required" placeholder="상품 수량을 입력해주세요."></td>
            </tr>
            <tr>
                <td>상위 카테고리</td>
                <td><select id="upCategory" name="parentCategory">
				<option value="근력기구">근력기구</option>
				<option value="유산소기구">유산소기구</option>
				<option value="웨이트리프팅">웨이트리프팅</option>
				<option value="어시스트">어시스트</option>
				<option value="전시상품">전시상품</option>
			</select></td>
            </tr>
            <tr>
                <td>하위 카테고리</td>
                <td><select id="downCategory" name="childCategory">
				<option value="멀티랙">멀티랙</option>
				<option value="멀티짐">멀티짐</option>
				<option value="벤치">벤치</option>
				<option value="벤치프레스">벤치프레스</option>
				<option value="스미스짐">스미스짐</option>
				<option value="클럼용머신">클럽용머신</option>
				<option value="마사지">마사지</option>
				<option value="매트">매트</option>
				<option value="스트랩과패드">스트랩과패드</option>
				<option value="튜빙밴드">튜빙밴드</option>
				<option value="트레이닝보조">트레이닝보조</option>
				<option value="거꾸리">거꾸리</option>
				<option value="케이블손잡이">케이블손잡이</option>
				<option value="부속품">부속품</option>
				<option value="덤벨">덤벨</option>
				<option value="바벨">바벨</option>
				<option value="정리대">정리대</option>
				<option value="케틀벨">케틀벨</option>
				<option value="플레이트">플레이트(원판)</option>
				<option value="런닝머신">런닝머신</option>
				<option value="사이클">사이클</option>
				<option value="로잉머신">로잉머신</option>
				<option value="일립티컬">일립티컬</option>
				<option value="샌드백">샌드백</option>
			</select></td>
            </tr>
		</table>
	</div>
			</div>
		</div>
		<div class="btn_collection"><br>
			<input type="submit" id="save" value="등록">
			<button type="reset" id="cancle">취소</button>
		</div>
	</form>
</section>
	<script>
	$("#btn_search").click(searchF1);
	 
	function searchF1(){
		/* if(("#input").val()==""){
			alert("값을 입력해주세요.");
			return;
		} */
		ajaxF1();
	}
		
		function ajaxF1(){
				$.ajax({
					type:"post",
					url:"<%=request.getContextPath()%>/plist.ajax",
					data: {
						productNo:$("#input").val(),
						productName:"",
						parentCategory:"",
						childCategory:"",
						quantity:0,
						price:0,
						productInfoUrl:"",
						productOption:""
					},
					dataType:"json",
					success: function(data){
						//[{"productNo":"a","productName":"b","parentCategory":"c","childCategory":"d","quantity":1,"price":2,"productInfoUrl":"e","productOption":"f","minPrice":0,"maxPrice":0}]
						resultHtml(data);
					},
					error: function(request, status, error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
		}
		
		function resultHtml(data){
			var html="<table border='1' id='tsearch'>";
			html += "<tr>";
			html += "<th>상품번호</th>";
			html += "<th>상품이름</th>";
			html += "<th>부모카테고리</th>";
			html += "<th>자식카테고리</th>";
			html += "<th>수량</th>";
			html += "<th>가격</th>";
			html += "<th>상품이미지URL</th>";
			html += "<th>상품 옵션</th>";
			html += "</tr>";
			
			$.each(data, function(key, value){
				html += "<tr>";
				html += "<td>" + value.productNo + "</td>";
				html += "<td>" + value.productName + "</td>";
				html += "<td>" + value.parentCategory + "</td>";
				html += "<td>" + value.childCategory + "</td>";
				html += "<td>" + value.quantity + "</td>";
				html += "<td>" + value.price + "</td>";
				html += "<td>" + value.productInfoUrl + "</td>";
				html += "<td>" + value.productOption + "</td>";
				html += "</tr>";
			});
			
		html += "</table>";
		$("#product").empty(); 
		$("#product").append(html);
	}
	
	var stepId= 1;
	var stepImgId = 1;
	
	$("#img_btn").on('click', function(){
		stepId++;
		stepImgId++;
		$('#imgCollection').append('<div id="imgCollection_1"><img name="stepImg_'+stepId+'" id="stepImg_'+stepId+'"> <input type="file" name="uploadStepImg_'+stepId+'" required="required"></div>');
		$("#stepCount").val(stepId);
        console.log(stepId);
	});
	</script>
    <footer></footer>
</body>
</html>