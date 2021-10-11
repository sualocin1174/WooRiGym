<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css" />

<%@page import = "woorigym.product.model.vo.ProductTable" %>
<%@page import = "java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<ProductTable> volist = (ArrayList<ProductTable>)request.getAttribute("productlist");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>관리자 메인 페이지</title>
	<!-- 부트스트랩 CDN -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <!-- 헤더 CSS -->
    <link rel="stylesheet" type="text/css" href="css/template_header.css"/>
	<style>
        /* reset */
        * {
            margin:0; 
            padding:0;
        }
         /* 공통헤더에 있던 부분인데 css로 따로 빼면 적용이 안되서 reset에 포함 */
        #main_tnb2 {
            position: absolute;
            top: 10px;
            bottom: 10px;
            right: 30px;
            margin: 10px;
            overflow: hidden;
            width: 500px;
            height: 100px;
        }
		
        #main_tnb2>ul>li {
            display: inline-block;
            padding: 5px;
        }
        /* 로그인 전: 로그인 | 최근본상품 */
        /* 로그인 후: OOO님 | 로그아웃 | 마이페이지 | 장바구니 | 최근본상품 */
        #main_tnb2 li::after {
            padding-left: 10px;
            content: "|";
        }
        #main_tnb2 li:last-child::after {
            padding-left: 10px;
            content: "";
        }
         /* 공통헤더~reset에 포함  끝*/
        </style>
        <style>
            /* content */
            section {
                width: 1200px;
                padding: 30px 0 30px 0;
            }
        
            #main_bnb {
                text-align: center;
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
            <style>
            	table{
            	border: 1px solid black;
            	}
            </style>
</head>
<body>
<%--
	//String s = request.getParameter("#search");
	//String s1;
--%>
	<input type="text" id="search" name="search" placeholder="상품번호를 입력해주세요.">
	<button type="button" id="btn_search" name="btn_search">검색</button>
	<div id="product"> 출력하는 위치</div>
	 <script>
	 	$(function() {
	 		//$("#search").val("");
	 		//ajaxF1();
	 	});
		$("#btn_search").click(searchF2);
		function searchF2(){
			if($("#search").val() == ""){
				alert("상품 번호를 입력해주세요.");
				return;
			}
			ajaxF1();
		}
		function ajaxF1(){

			 {
				$.ajax({
					type:"post",
					url:"<%=request.getContextPath()%>/plist.ajax",
					data: {
						productNo:$("#search").val(),
						productName:"",
						parentCategory:"",
						childCategory:"",
						quantity:5,//$("#quantity").val(),
						price:2000,
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
		}
		
		function resultHtml(data){
			var html="<table border='1'>";
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
				console.log(value);
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
</body>
</html>