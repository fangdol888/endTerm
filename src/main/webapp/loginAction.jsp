<%@page import="org.apache.tomcat.util.http.parser.Authorization"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.baek.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%request.setCharacterEncoding("utf-8"); %>
 
<jsp:useBean id="user" class="com.baek.model.User" scope="page" />
<jsp:setProperty name="user" property="id"/>
<jsp:setProperty name="user" property="password" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>

<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
	if(userID != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어 있습니다')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}

	String sub = request.getParameter("submit");
	if(sub.equals("회원가입")) response.sendRedirect("register.jsp");
	
		UserDao userDAO = new UserDao();
		int result = userDAO.login(user.getId(), user.getPassword());
		if(result == 1){
			session.setAttribute("userID", user.getId());
			session.setAttribute("auth", userDAO.getAuth(user.getId()));
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다')");
			script.println("history.back()");
			script.println("</script>");
		}else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다')");
			script.println("history.back()");
			script.println("</script>");
		}else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류입니다')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>