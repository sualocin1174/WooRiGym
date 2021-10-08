<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <!-- 헤더 CSS -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="woorigym.product.model.vo.ProductTable"%>
<%@page import="java.util.ArrayList"%>
  <%
  String user_name = (String)request.getAttribute("user_name");
  %>
<%
	ArrayList<ProductTable> volist = (ArrayList<ProductTable>)request.getAttribute("productvolist");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>우리짐 검색페이지</title>
    <!-- 부트스트랩 CDN -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        /* 폰트 */
        /* @import url('https://fonts.googleapis.com/css2?family=Gothic+A1:wght@200&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100&display=swap'); */
        /* @import url('https://fonts.googleapis.com/css2?family=Gothic+A1:wght@200&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100&display=swap'); */
    </style>
    <style>
        /* reset */
        * {
            margin: 0;
            padding: 0;
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
    <style> /* 2021.10.08 1차 추가시작 */
        /* content */
        section {
            width: 900px;
            padding: 30px 0 30px 0;
            position: relative;
            bottom: 170px;
            left: 300px;
        }
        aside {
            padding: 30px 0 0 30px;
        }
		
		div#searchmenubar > div {
			padding: 30px 0 0 30px;
			float: left;
		}
		
		#catalog {
			border: 1px solid gray;
		}
		
		h2#productlist {
			/* padding-top: 250px; */
			text-align: center;
		}
		
		/* section > div {
			padding-top : 250px;
			text-align: center;
		} */
        
    </style> <!-- 2021.10.08 1차 추가완료 -->
    </head>
<body>
	<%@ include file="template_header.jsp"%> <!-- 2021-10-08 1차 추가시작 및 완료 -->
    <aside>
		<form>
			<div id="searchmenubar">
				<div class="searchmenu"> <!-- 2021.10.08 1 추가시작 -->
					<span id="catalog">카테고리별 검색</span>
					<select name="category" id="category">
						<option value="">선택목록</option>
						<option value="근력기구">근력기구</option>
						<option value="어시스트">어시스트</option>
						<option value="웨이트리프팅">웨이트리프팅</option>
						<option value="유산소기구">유산소기구</option>
						<option value="전시상품">전시상품</option>
					</select>
				</div>
				<div class="searchmenu">
					<span id="catalog">순위별 검색</span>
					<select name="rank" id="rank">
						<option value="">선택목록</option>
						<option value="인기순">인기순</option>
						<option value="평점순">평점순</option>
					</select>
				</div> <!-- 2021.10.08 1차 추가완료 -->
				<div class = "searchmenu"> <!-- 2021.10.07 추가시작 -->
					<input type="text" class="text" name = "minprice[]" placeholder="최소금액">
					<span> ~ </span>
					<input type="text" class="text" name = "maxprice[]" placeholder="최대금액">
					<span>원</span>
				</div>
				<div class="searchmenu">
					<input type = "text" name = "keyword" class = "keyword_input" id = "keyword_input" placeholder="상품명입력">
					<input type = "button" class = "searchBtn" id = "searchBtn" value = "검색"> <!-- 2021.10.07 추가 -->
				</div> <!-- 2021.10.07 추가완료 -->
			</div>
		</form>
		<!-- <button type="submit" class="btn_search">검색</button>  2021.10.07 삭제-->
    </aside>
    <section>
    	<h2 id="productlist">상품목록</h2> <!-- 2021.10.08 1차 내용추가 및 추가완료 -->
    </section>
    <footer>
    </footer>
    <script>
    /* 2021-10-07 수정 */
    	$("#searchBtn").click( function () {
			if($("#keyword_input").val() == "") {
				alert("상품명을 검색창에 입력 후 검색버튼을 눌러주세요");
				return;
			}
			$.ajax({
				type:"post",
				url:"<%=request.getContextPath()%>/slist.ajax",
				data: {
					productName : "육각아령",
					parentCategory: "", 
					childCategory: "",
					minPrice: 1000,
					maxPrice: 6000
					// TODO: 순위, 인기... 
				},
				success: function(data){
					console.log(data);
					alert("aaa");
				},
				error : function(request,status,error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+
					"\n"+"error:"+error);
					}
			});
		});
    	/* 2021-10-07 수정완료 */
    </script>
</body>
</html>