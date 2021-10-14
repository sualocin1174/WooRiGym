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
		<table>
			<tr>
			<td>상품명</td>
			<td><input type="text" id="product_name" name="product_name" required="required" placeholder="상품명을 입력해주세요."></td>
			</tr>
			<tr>
			<td>상위 카테고리</td>
			<td><input id="parent_category" name="parent_category"></td>
			</tr>
			<tr>
			<td>하위 카테고리</td>
			<td><input id="child_category" name="child_category"></td>
			</tr>
			<tr>
			<td>수량</td>
			<td><input id="quantity" name="quantity"></td>
			</tr>
			<tr>
			<td>가격</td>
			<td><input id="price" name="price"></td>
			</tr>
			<tr>
			<td>상품이미지</td>
			<td><input id="product_info_url" name="product_info_url"></td>
			</tr>
			<tr>
			<td>상품옵션</td>
			<td><input id="product_option" name="product_option"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><button type="button" id="check">등록</button></td>
			</tr>
		</table>
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