     <!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/orderpage.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_footer.css"/>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import = "java.util.ArrayList"%>
<%@page import = "woorigym.admin.model.vo.NoticeTable" %>
<%
	ArrayList<NoticeTable> noticelist = (ArrayList<NoticeTable>)request.getAttribute("noticelist");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 게시판</title>
<style>
        /* reset */
        * {
            margin:0; 
            padding:0;
        }
        body {
        font-family: 'Noto Sans KR', sans-serif;
		}
        /* content */
        section {
            width: 1200px;
            padding: 30px 0 30px 0;
        }
        
        td{
        	text-align:center;
        }
		
		.paging {
			padding: 50px, 20px;
			text-align:center;	
		}
		
		#noticeBoard{
			padding: 50px, 20px;
			text-align:center;
		}
</style>
</head>
<body>
	<%@ include file="template_header.jsp"%>
	<% 
   		int startPage = (int)request.getAttribute("startPage");
   		int endPage = (int)request.getAttribute("endPage");
   		int pageCount = (int)request.getAttribute("pageCount");
	%>
	
	<div id="noticeBoard" class="noticeBaord">
         <table border='1' class="board_list">
            	<thead>
            		<tr>
            			<th>공지사항 번호</th>
                 	 	<th>제목</th>
                 	 	<th>내용</th>
                 	 	<th>작성일</th>
               		</tr>
            	</thead>
            	
            	<tbody>
            		<tr>
            			<%
                			if (noticelist != null) {
                			for(NoticeTable vo : noticelist) {
               			 %>
                		<td><%=vo.getNotice_no()%></td>
                		<td><%=vo.getN_title() %></td>
                		<td><%=vo.getN_content() %></td>
                		<td><%=vo.getN_date() %></td>
               		</tr>
               			<%
                  				}
               				}
               			%>
            	</tbody>
        </table>
        </div>
		<div class="paging">
        	<!-- <a href="#" class="bt">첫 페이지</a> --> 
            <!-- <a href="#" class="bt">이전 페이지</a>  -->
            <%
               if (startPage > 1) {
            %>
            <a href="NoticeBoarderServlet?pagenum=<%=startPage - 1%>" class="num">이전</a>
            <%
               }
            %>
            <%
               for (int i = startPage; i <= endPage; i++) {
            %>
            <a href="NoticeBoarderServlet?pagenum=<%=i%>" class="num"><%=i%></a>
            <%
               }
            %>
            <%
               if (endPage < pageCount) {
            %>
            <a href="NoticeBoarderServlet?pagenum=<%=endPage + 1%>" class="num">다음</a>
            <%
               }
            %>
            <!-- <a href="#" class="bt">다음 페이지</a> <a href="#" class="bt">마지막 페이지</a> -->
         </div>
	
	<%@ include file="template_footer.jsp"%>
</body>
<script>
	
</script>
</html>