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
<%@ page import = "woorigym.admin.model.vo.QnaTable" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 상품문의(Q&A)</title>
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
     #btngroup{
          text-align: center;
          margin-bottom: 20px;
      }
     .button{
        padding: 5px 25px;
        text-align: center;
        text-decoration: none;
        font-size: 16px;
        margin: 25px 10px;
        transition-duration: 0.3s;
        cursor: pointer;
        background-color: white;
        color: black;
        border: 2px solid #DFE0DF;
        border-radius: 5px;
        }

        .button:hover {
            background-color: #DFE0DF;
        }
		/* 문의글 작성 버튼 */
        #qna_btn {
        padding: 6px 32px;
        margin: 4px 2px;
        background-color: white;
        color: black;
        border: 2px solid #555555;
        }
        #qna_btn:hover {
        background-color: #555555;
        color: white;
        }
</style>
</head>
<body>
<!-- 공통헤더 템플릿 -->
 	<%@ include file="template_header.jsp"%>
	<!--마이페이지 공통사이드 템플릿 -->
 	<%@ include file="template_mypage_aside.jsp"%>
<section>
<h2>나의 상품문의(Q&A)</h2>
<c:if test="${myQnA != null || ''}">
<table>
<tr>
<th>번호<th>
<td>${myQnA} <td>
</tr>
<tr>
<th>카테고리<th>
</tr>
<tr>
<th>제목<th>
<th>문의 내용<th>
</tr>
</table>
</c:if>
<div id="btngroup">
<a href="<%=request.getContextPath()%>/qna_write"><input type="submit" class="button" value="문의글 작성" id="qna_btn"></a>
</div>
</section>
<!-- 공통푸터 템플릿 -->
<%@ include file="template_footer.jsp"%>
</body>
</html>