     <!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/orderpage.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_footer.css"/>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
#ordersection{
	margin : auto;
	width : 1000px;
}
</style>
</head>
<body>
	<%@ include file="template_header.jsp"%>
	<%-- <%@ include file="template_footer.jsp"%> --%>
	<section>
		<div id="noticeList"></div>
	</section>
</body>
<script>
	ajaxF1();

	function ajaxF1(){
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/apulist.ajax",
			data:{
				notice_no:0,
				n_title:"",
				n_content:"",
				n_date:""
			},
			dataType:"json",
			success:function(data){
				resultHtml1(data);
			},
			error:function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
		$("#noticeList").show();
	}

	function resultHtml1(data){
		var html="<table border='1' id='tsearch'>";
		html += "<tr>";
		html += "<th>공지사항번호</th>";
		html += "<th>제목</th>";
		html += "<th>내용</th>";
		html += "<th>작성일</th>";
		html += "</tr>";
	
		$.each(data, function(key, value){
			html += "<tr>";
			html += "<td>" + value.notice_no + "</td>";
			html += "<td>" + value.n_title + "</td>";
			html += "<td>" + value.n_content + "</td>";
			html += "<td>" + value.n_date + "</td>";
			html += "</tr>";
		});
	
		html += "</table>";
		$("#noticeList").empty(); 
		$("#noticeList").append(html);
	}
</script>
</html>