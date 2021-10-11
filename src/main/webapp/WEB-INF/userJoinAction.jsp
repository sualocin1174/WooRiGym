<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="woorigym.user.model.service.UserService" %>
    <%@ page import="java.io.PrintWriter" %>
    <% request.setCharacterEncoding("UTF-8"); %>
   	<jsp:useBean id="user" class="woorigym.user.model.vo.UserTable" scope="page"/>
   	<jsp:setProperty name="user" property="user_id"/>
   	<jsp:setProperty name="user" property="user_pwd"/>
   	<jsp:setProperty name="user" property="user_name"/>
   	<jsp:setProperty name="user" property="email"/>
   	<jsp:setProperty name="user" property="email_yn"/>
   	<jsp:setProperty name="user" property="mileage"/>
   	<jsp:setProperty name="user" property="birthday"/>
   	<jsp:setProperty name="user" property="identity_number"/>
   	<jsp:setProperty name="user" property="gender"/>
   	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>log</title>
</head>
<body>
	<%
		
		if(user.getUser_id() == null || user.getUser_pwd() == null || user.getUser_name() == null
		|| user.getEmail() == null || user.getEmail_yn() == 0 ) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'login.jsp'");
			script.println("<script>");
		}
		UserService userdao = new UserService();
		int result = userdao.userInsert(user);
		
		
			
	%>
</body>
</html>