<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ page import="woorigym.user.model.service.UserService" %> --%>
<%--     <%@ page import="java.io.PrintWriter" %> --%>
<%--    	<jsp:useBean id="user" class="woorigym.user.model.vo.UserTable" scope="page"/>
   	<jsp:setProperty name="user" property="user_id"/>
   	<jsp:setProperty name="user" property="user_pwd"/> --%>
   	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<script>
		var result = "${result}";
		console.log(result);
		var msg = "";
		if("${user_id}" != "") {
			msg += "${user_id}님, ";
		}
		msg +="로그인 하셨습니다.";
		alert(msg);
		location.href = "main";
	</script>
</body>
</html>