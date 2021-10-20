<!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 
   <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import = "java.util.ArrayList"%>
<%@page import = "woorigym.admin.model.vo.NoticeTable" %>
<%
	ArrayList<NoticeTable> volist = (ArrayList<NoticeTable>)request.getAttribute("noticelist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 페이지</title>
</head>
<body>
	<input type="text" id="input" name="input" placeholder="공지사항번호를 입력해주세요.">
	<button type="button" id="btn_list" name="btn_list">리스트</button>
	<button type="button" id="btn_insert" name="btn_insert">추가</button>
	<button type="button" id="btn_delete" name="btn_delete">삭제</button>
	<div id="notice">출력하는 위치</div>
	<script>
	$("#btn_list").click(listF1);
	function listF1(){
		ajaxF1();
	}
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
				resultHtml(data);
			},
			error:function(request, status, error){
 				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 			}
		});
	}
	
	function resultHtml(data){
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
		$("#notice").empty(); 
		$("#notice").append(html);
	}
	</script>
</body>
</html>