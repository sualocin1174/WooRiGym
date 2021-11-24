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
<%@page import = "woorigym.admin.model.vo.ProductOptionTable" %>
<%@page import = "woorigym.admin.model.vo.ProductImgTable" %>
<!--<a href = "${path}/shop/product/list.do">상품목록</a>-->
<!--<a href = "${path}/shop/product/write.do">상품등록</a>-->
<%
	ArrayList<ProductTable> productlist = (ArrayList<ProductTable>)request.getAttribute("productlist");
	ArrayList<ProductOptionTable> productOption = (ArrayList<ProductOptionTable>)request.getAttribute("productOption");
	ArrayList<ProductImgTable> productImg = (ArrayList<ProductImgTable>)request.getAttribute("productImg");
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
 	<%@ include file="admin_header.jsp"%>
 	<!-- 10/10 메인페이지 사이드바 추가: <aside>~</aside>
 	추후 template_admin_aside.jsp로 따로 생성하고 include해서 쓰시는걸 추천합니다  -->
	<aside>
		<div id="side-menu">
     	<ul>
        	<li>메인페이지</li>
         	<li><a href="amain">상품관리</a></li>
         	<li><a href="apupage">공지사항 관리</a></li>
         	<li><a href="asales">매출관리</a></li>
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
    <button type="button" id="btn_delete" class="button" name="btn_delete">삭제</button><br><br>
	<div id="productList" style="display:none" class="content"></div>
	<br><br>
	<div id = "productInsert" style="display:none" class="content">
		<form id="form1" name="form1" action="apadd" method="post" enctype="multipart/form-data">
			<div id = "imgCollection">
				<div id = "stepImgContainer">
					<label>이미지 추가</label>
					<img src="./alt.JPS" name="stepImg_1" id="stepImg_1">
					<input type="file"name="uploadStepImg_1" required="required">
            		<!-- <input name="addButton" type="button" id="img_btn" value="추가"><br><br> -->
				</div>
			</div>
			<input type="hidden" name="optionCount" id="optionCount" readonly value="1">
			<input type="hidden" name="stepCount" id="stepCount" readonly value="1">
	
			<div id="productOption" >
				<label>상품 번호</label>
				<input type="text" name="productNo" id="productNo1" required="required" placeholder="상품 번호를 입력해주세요."><br><br>
		
        		<label>상품명</label>
        		<input type="text" name="productName" id="productName" required="required" placeholder="상품명을 입력해주세요."><br><br>
        	    
        		<label>상품 가격</label>
        		<input type="text" name="price" id="price" required="required" placeholder="상품 가격을 입력해주세요."><br><br>
	
    	    	<label>상품 옵션</label>
    	    	<input type="text" name="productOption2" id="option" required="required" placeholder="상품 옵션을 입력해주세요.">
    	    	<a href='#' id='btn_txtAdd'><i class='fas fa-plus-circle'></i></a><br><br>

    	    	<label>상품 수량</label>
       			<input type="text" name="quantity" id="quantity" required="required" placeholder="상품 수량을 입력해주세요."><br><br>

        		<label>상위 카테고리</label>
        		<select id="upCategory" name="parentCategory">
					<option value="근력기구">근력기구</option>
					<option value="유산소기구">유산소기구</option>
					<option value="웨이트리프팅">웨이트리프팅</option>
					<option value="어시스트">어시스트</option>
					<option value="전시상품">전시상품</option>
				</select><br><br>

        		<label>하위 카테고리</label>
        		<select id="downCategory" name="childCategory">
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
				</select><br><br>
			</div>
			<div class="btn_collection"><br>
				<input type="submit" id="save" value="등록">
				<button type="reset" id="cancle">취소</button>
			</div>
		</form>
	</div>
</section>

<section>
	<div id="productDelete" style="display:none" class="content">
		<form id="formDelete" name="formDelete" method="post" action="apdelete">
			<table id="pdelete" class="ptable">
				<tr>
					<td>상품 번호</td>
					<td><input type="text" name="productNo1" id="productNo1" class="input" required="required" placeholder="번호를 입력해주세요."><br><br></td>
					<td><input type="submit" id="delete" value="삭제"></td>			
			</table>
		</form>
	</div>
</section>

<section>
	
</section>
<script>
	$("#btn_search").click(searchF1);
	 
	function searchF1(){
		ajaxF1();
		$("#productInsert").hide();
		$("#productDelete").hide();
		$("#productUpdate").hide();
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
					resultHtml(data);
				},
				error: function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
			$("#productList").show();
	}
		
	function resultHtml(data){
		var html="<table border='1' id='productList'>";
		
		$.each(data, function(key, value){
			html += "<tr>";
			html += "<th>상품번호</th>";
			html += "<td>" + value.productNo + "</td>";
			html += "</tr>";
			html += "<tr>";
			html += "<th>상품이름</th>";
			html += "<td>" + value.productName + "</td>";
			html += "</tr>";
			html += "<tr>";
			html += "<th>상위카테고리</th>";
			html += "<td>" + value.parentCategory + "</td>";
			html += "</tr>";
			html += "<tr>";
			html += "<th>하위카테고리</th>";
			html += "<td>" + value.childCategory + "</td>";
			html += "</tr>";
			html += "<tr>";
			html += "<th>수량</th>";
			html += "<td>" + value.quantity + "</td>";
			html += "</tr>";
			html += "<tr>";
			html += "<th>가격</th>";
			html += "<td>" + value.price + "</td>";
			html += "</tr>";
			html += "<tr>";
			html += "<th>상품이미지URL</th>";
			html += "<td>" + value.productInfoUrl + "</td>";
			html += "</tr>";
			html += "<tr>";
			html += "<th>상품 옵션</th>";
			html += "<td>" + value.productOption + "</td>";
			html += "</tr>";
		});
		
		html += "</table>";
		$("#productList").empty(); 
		$("#productList").append(html);
	}
	
	var proOptNameId = 1;
	var proOptPriceId = 1;
	
	$("#btn_txtAdd").on('click', function(){
		proOptNameId++;
		proOptPriceId++;
		$("productContainer").append("")
		
	});
	
	var stepId= 1;
	var stepImgId = 1;
	
	$("#img_btn").on('click', function(){
		stepId++;
		stepImgId++;
		$('#imgCollection').append('<div id="imgCollection_1"><img name="productInfoUrl_'+stepId+'" id="productInfoUrl_'+stepId+'"> <input type="file" name="uploadStepImg_'+stepId+'" required="required"></div>');
		$("#stepCount").val(stepId);
        console.log(stepId);
	});
	
	$("#btn_insert").click(InsertShow);
	function InsertShow(){
		$("#productInsert").show();
		$("#productList").hide();
		$("#noticeDelete").hide();
		$("#noticeUpdate").hide();
	}
	
	$("#btn_delete").click(DeleteShow);
	function DeleteShow(){
		$("#productDelete").show();
		$("#productList").hide();
		$("#productInsert").hide();
		$("#noticeUpdate").hide();
	}
</script>
<footer></footer>
</body>
</html>