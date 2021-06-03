<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리페이지</title>
<%@ page import="java.io.*" %>
</head>
<body>
 <%
 	int auth = -1;
 	if(session.getAttribute("auth") != null){
 		auth = Integer.parseInt(String.valueOf(session.getAttribute("auth")));
 	}
	
	if(auth == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다')");
		script.println("history.back()");
		script.println("</script>");
	}
	
	switch(auth){
	case 1: //관리자
	case 2: //대리 권한
		response.sendRedirect("adminPage.jsp");
		break;
	case 0: //일반
		response.sendRedirect("memberInfo.jsp");
		break;
	}
 %>
</body>
</html>