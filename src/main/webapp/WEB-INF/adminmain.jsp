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
		<div id = "titleImg">
			<p align = "center">상품 대표 사진</p>
			<img id = "titleImg" src="./css/alt.JPG"><input type="file" name="upLoadTitleImg" id="upLoadTitleImg" class="hiddenInput" accept="image/jpeg, image/jpg, image/png" required="required">
		</div>
		<div id="content">
		<br><label>상품 번호</label>
		<input type="text" name="productNo" id="productNo" required="required" placeholder="상품 번호를 입력해주세요."><br><br>
		<div id="productOption">
		<label>상품명</label>
		<input type="text" name="productName" id="productName" required="required" placeholder="상품명을 입력해주세요."><br><br>
		<label>상품 가격</label>
		<input type="text" name="price" id="price" required="required" placeholder="상품 가격을 입력해주세요."><br><br>
		</div>
		<a href ='#' id='btn_txtAdd'><i class='fas fa-plus-circle'></i></a><br><br>
		</div>
		<label>상위 카테고리</label><select id="upCategory" name="upCategory">
		<option value="1">근력기구</option>
		<option value="2">유산소기구</option>
		<option value="3">웨이트리프팅</option>
		<option value="4">어시스트</option>
		<option value="5">전시상품</option>
		</select><br><br>
		<label>하위 카테고리</label><select id="downCategory" name="downCategory">
		
		
		
		</select>
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
	</script>
    <footer></footer>
</body>
</html>