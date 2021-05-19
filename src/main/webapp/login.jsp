<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ page import="java.io.*" %>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript"></script>
<%
	request.setCharacterEncoding("utf-8");
	String btn = request.getParameter("btn");
	
	if(btn.equals("login")){
		//db 검사
	}else if(btn.equals("register")){
		response.sendRedirect("resister.jsp");
	}
%>
</body>