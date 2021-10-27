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
       /* 나의 상품문의(Q&A) */
      section > h2 {
          margin: 20px;
          text-align: center;
      }
       /* 상품문의(Q&A)내역 테이블 */
      	#qnalist {
		  width: 850px;
          text-align: center;
          margin: 25px 0 25px 0;
          border-top: 1.5px solid black;
          border-bottom: 1px solid #BDBDBD;
          padding-bottom: 12px;
        }
        #qnalist th {
      	padding: 10px;
      	}
        #qnalist td {
      	padding: 8px;
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
<script>
console.log("<%=session.getAttribute("myQnA")%>");
</script>
</head>
<body>
<!-- 공통헤더 템플릿 -->
 	<%@ include file="template_header.jsp"%>
	<!--마이페이지 공통사이드 템플릿 -->
 	<%@ include file="template_mypage_aside.jsp"%>
<section>
<h2>나의 상품문의(Q&A)</h2>
<c:if test="${myQnA != null || ''}">
<table id="qnalist">
<tr>
<th>번호<th> 
<th>카테고리<th>
<th>제목<th>
<th>문의 내용<th>
</tr>
<!--ArrayList니까 for문 돌리기!! -->
<c:forEach items="${myQnA}" var = "qna">
<tr>
<td>${qna.q_no}<td>
<td>${qna.q_category}<td>
<td>${qna.q_title}<td>
<td>${qna.q_content}<td>
</c:forEach>
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