<!-- 웹폰트: Noto Sans Korean -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
   <!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 마이페이지 사이드 CSS -->
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_mypage_aside.css" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 푸터 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_footer.css"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 후기 작성</title>
<style>
  /* reset */
        * {
            margin: 0;
            padding: 0;
        }
  body{
        font-family: 'Noto Sans KR', sans-serif;
        }
     section {
         width: 900px;
         padding: 0 0 30px 0;
         position: relative;
         bottom: 170px;
         left: 260px;
     }
</style>
</head>
<body>
<!-- 공통헤더 템플릿 -->
 	<%@ include file="template_header.jsp"%>
	<!--마이페이지 공통사이드 템플릿 -->
 	<%@ include file="template_mypage_aside.jsp"%>
<section>
<form action="<%=request.getContextPath()%>/rwrite" method="post" enctype="multipart/form-data">
<table>
<tr>
<th>후기 내용</th>
<td><input type="text" name="r_content"></td>
<td><select name="score">
<option value="1">★☆☆☆☆</option>
<option value="2">★★☆☆☆</option>
<option value="3">★★★☆☆</option>
<option value="4">★★★★☆</option>
<option value="5" selected>★★★★★</option>
</select></td>
<td><input type="file" name="review_img"></td>
<td><input type="submit" value="등록"></td>
<input type="text" name= "order_no" value="${order_no}">
<th></th>
</tr>

</table>
</form>
</section>
<!-- 공통푸터 템플릿 -->
<%@ include file="template_footer.jsp"%>
</body>
</html>