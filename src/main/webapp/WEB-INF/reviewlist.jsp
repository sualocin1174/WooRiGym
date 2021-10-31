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
<title>상품 후기 내역</title>
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
       /* 나의 상품후기 */
      section > h2 {
          margin: 20px;
          text-align: center;
      }
       /* 상품후기 내역 테이블 */
      	#review_list {
		  width: 850px;
          text-align: center;
          margin: 25px 0 25px 0;
          border-top: 1.5px solid black;
          border-bottom: 1px solid #BDBDBD;
          padding-bottom: 12px;
        }
        #review_list th {
      	padding: 10px;
      	}
        #review_list td {
      	padding: 8px;
      	}
</style>
</head>
<body>
<!-- 공통헤더 템플릿 -->
 	<%@ include file="template_header.jsp"%>
	<!--마이페이지 공통사이드 템플릿 -->
 	<%@ include file="template_mypage_aside.jsp"%>
<section>
<h2>나의 상품후기</h2>
<c:if test="${myReview != null || ''}">
<table id="review_list">
<tr>
<th>번호</th> 
<th colspan="2">상품명</th>
<th>후기</th>
<th>평점</th>
<th>작성일</th>
</tr>
<!--ArrayList니까 for문 돌리기!! -->
<c:forEach items="${myReview}" var = "review">
<tr>
<td>${review.rNo}</td>
<td><img src="${review.rImg}"></td>
<td>${review.product_name}</td>
<td>${review.rContent}</td>
<c:if test="${review.score==1}">
<td>★☆☆☆☆</td>
</c:if>
<c:if test="${review.score==2}">
<td>★★☆☆☆</td>
</c:if>
<c:if test="${review.score==3}">
<td>★★★☆☆</td>
</c:if>
<c:if test="${review.score==4}">
<td>★★★★☆</td>
</c:if>
<c:if test="${review.score==5}">
<td>★★★★★</td>
</c:if>
<td>${review.rWritedate}</td>
</tr>
</c:forEach>
</table>
</c:if>
</section>
<!-- 공통푸터 템플릿 -->
<%@ include file="template_footer.jsp"%>
</body>
</html>