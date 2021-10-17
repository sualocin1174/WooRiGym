   <!-- 헤더 CSS -->
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
    <title>우리짐 메인페이지</title>
       <!-- /* content */-->
        <style>
            section {
                width: 1200px;
                padding: 30px 0 30px 0;
            }
        
            #main_bnb {
                text-align: center;
            }
            
            #main_bnb>ul {
				list-style-type: none;
				position: relative;
			}
			        
            #main_bnb li {
                display: inline-block;
            }

        /* 신상품 | 인기상품 | 타임세일 */
            #main_bnb li::after{
                padding: 10px;
                content: "|";
            }
            #main_bnb li:last-child::after{
                padding: 15px;
                content: "";
            }

          #main_img {
              position: relative;
              left: 20px;
              box-sizing: content-box;
            }
            #main_img a{
                display: inline-block;
                padding: 15px;
                /* position: relative; */
                
            }
            #main_img img{
            /* vertical-align: middle; */
              /* display: inline-block; */
              width: 250px;
          }
            </style>
    </head>

<body>
    <input type="text" id="input" name="input" placeholder="상품번호를 입력해주세요.">
    <button type="button" id="btn_search" name="btn_search">검색</button>
    <button type="button" id="btn_insert" name="btn_insert">추가</button>
    <button type="button" id="btn_update" name="btn_update">수정</button>
    <button type="button" id="btn_delete" name="btn_delete">삭제</button>
	<div id="product">검색한 상품 출력하는 위치</div>
	<br><br>
	<form id="form1" name="form1" method="post" enctype="multipart/form-data">
		<div id = "header">
			<div id="titleImgContainer">
               <p align="center">상품 대표 사진</p>
               <img id="titleImg" src="./css/alt.JPG"> <input type="file"name="uploadTitleImg" id="uploadTitleImg" class="hidden_input" accept="image/jpeg, image/jpg, image/png" required="required">
               
            </div>
			<div id = "imgCollection">
				<div id = "imgCollection_1">
					<label>이미지 추가</label>
					<img src="./css/alt.jpg" name="stepImg_1" id="stepImg_1">
					<input type="file"name="uploadStepImg_1" required="required">
            		<input name="addButton" type="button" id="img_btn" value="추가">
				</div>
			</div>
			<input type="hidden" name="stepCount" id="stepCount" readonly value="1">
			<div id="content">
				<br><label>상품 번호</label>
				<input type="text" name="productNo" id="prodNo" required="required" placeholder="상품 번호를 입력해주세요."><br><br>
		
				<div id="productOption">
					<label>상품명</label>
					<input type="text" name="productName" id="productName" required="required" placeholder="상품명을 입력해주세요."><br><br>
					<label>상품 가격</label>
					<input type="text" name="price" id="price" required="required" placeholder="상품 가격을 입력해주세요."><br><br>
					<label>상품 수량</label>
					<input type="text" name="quantity" id="quantity" required="required" placeholder="상품 수량을 입력해주세요."><br><br>
					<label>상품 옵션</label>
					<input type="text" name="option" id="option" required="required" placeholder="상품 옵션을 입력해주세요."><br><br>
				</div>
			</div>
			<label>상위 카테고리</label>
			<select id="upCategory" name="upCategory">
				<option value="1">근력기구</option>
				<option value="2">유산소기구</option>
				<option value="3">웨이트리프팅</option>
				<option value="4">어시스트</option>
				<option value="5">전시상품</option>
			</select><br><br>
			<label>하위 카테고리</label>
			<select id="downCategory" name="downCategory">
				<option value="1">멀티랙</option>
				<option value="2">멀티짐</option>
				<option value="3">벤치</option>
				<option value="4">벤치프레스</option>
				<option value="5">스미스짐</option>
				<option value="6">클럽용머신</option>
				<option value="7">마사지</option>
				<option value="8">매트</option>
				<option value="9">스트랩과패드</option>
				<option value="10">튜빙밴드</option>
				<option value="11">트레이닝보조</option>
				<option value="12">거꾸리</option>
				<option value="13">케이블손잡이</option>
				<option value="14">부속품</option>
				<option value="15">덤벨</option>
				<option value="16">바벨</option>
				<option value="17">정리대</option>
				<option value="18">케틀벨</option>
				<option value="19">플레이트(원판)</option>
				<option value="20">런닝머신</option>
				<option value="21">사이클</option>
				<option value="22">로잉머신</option>
				<option value="23">일립티컬</option>
				<option value="24">샌드백</option>
			</select>
		</div>
		<div class="btn_collection"><br>
			<button type="submit" id="save">등록</button>
			<button type="button" id="cancle">취소</button>
		</div>
	</form>
	
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
		
	$("#img_btn").click(function(e){
		e.preventDefault();
	});
	
	var stepId= 1;
	var stepImgId = 1;
	
	
	$("#img_btn").on('click', function(){
		stepId++;
		stepImgId++;
		//$('#imgCollection').append('<div id="imgCollection_1"><img src="./css/alt.JPG" name="stepImg_'+stepId+'" id="stepImg_' + stepId + '"alt="상품 상세 정보 순서"'> <input type="file" name="uploadStepImg_'+stepId+'" required="required"></div>');
		$('#imgCollection').append('<div id="imgCollection_1"><img src="./css/alt.JPG" name="stepImg_'+stepId+'" id="stepImg_'+stepId+'"> <input type="file" name="uploadStepImg_'+stepId+'" required="required"></div>');
		$("#stepCount").val(stepId);
        console.log(stepId);
	});
	</script>
    <footer></footer>
</body>
</html>