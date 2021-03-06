<%@page import="com.baek.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="java.io.PrintWriter" %>
    <% request.setCharacterEncoding("utf-8"); %>
    <jsp:useBean id="user" class="com.baek.model.User" scope="page"/>
    <jsp:setProperty name="user" property="id" />
<jsp:setProperty name="user" property="password" />
<jsp:setProperty name="user" property="name" />
<jsp:setProperty name="user" property="gender" />
<jsp:setProperty name="user" property="email" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
</head>
<body>
	<%
		if(user.getId() == null || user.getPassword() == null || user.getGender() == null || user.getEmail() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('모든 정보를 입력 해주십시오')");
			script.println("history.back()");
			script.println("</script>");
		}else if(!user.getPassword().equals(request.getParameter("confirm_password"))){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호를 다시 확인해주십시오')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			UserDao dao = new UserDao();
			int result = dao.register(user);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다')");
				script.println("history.back()");
				script.println("</script>");
			}else {
				PrintWriter script = response.getWriter();
				dao.authorization(user, 0);
				session.setAttribute("userID", user.getId());
				session.setAttribute("auth", dao.getAuth(user.getId()));
				script.println("<script>");
				script.println("alert('회원가입 성공')");
				script.println("location.href='main.jsp'");
				script.println("</script>");
			}
			
		}
		
	%>
</body>
</html>