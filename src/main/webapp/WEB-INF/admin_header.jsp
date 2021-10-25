<!-- 웹폰트: Noto Sans Korean -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<% String ctxPath = request.getContextPath(); %>
<style>
.header{
	padding: 30 30 0 30;
}
</style>
<header id = "header">
	<div id="logo">
            <a href="<%=ctxPath %>/amain"> 
                <img src='./images/logo_simple_w 200x109.png' alt="로고"/><br>
            </a>
        </div>
        <c:if test="${admin_id == null}">
        <span id="main_tnb1" class="tnb">
        <ul>
        	<li><a href="<%=ctxPath %>/login" id = "bunLogin">로그인</a></li>
        	<li><a href="#">최근본상품</a></li>
            </ul>
        </span>
        </c:if>
         <c:if test="${admin_id != null}">
        <div id="main_tnb2" class="tnb"> 
        <ul>
            <li>${admin_id}님</li> 
            <li><a href="<%=ctxPath %>/logout">로그아웃</a></li>
        </ul>
    </div> 
    </c:if>
    
</header>