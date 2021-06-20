<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*" %>    
    <% request.setCharacterEncoding("utf-8"); %>
    <%@page import="com.baek.dao.UserDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify information</title>
</head>
<body>

<jsp:useBean id="user" class="com.baek.model.User"/>
<jsp:setProperty name="user" property="id" />
<jsp:setProperty name="user" property="password" />
<jsp:setProperty name="user" property="name" />
<jsp:setProperty name="user" property="gender" />
<jsp:setProperty name="user" property="email" />
    

<%
	String sub = request.getParameter("submit");
	
	if(sub.equals("수정")){
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
			int result = dao.updateUser(user);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('변경 실패')");
				script.println("history.back()");
				script.println("</script>");
			}else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원 정보가 변경되었습니다')");
				script.println("history.back()");
				script.println("</script>");
			}
			
		}
	}else if(sub.equals("수정하기")){
		if(user.getId() == null || user.getPassword() == null || user.getGender() == null || user.getEmail() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('모든 정보를 입력 해주십시오')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			UserDao dao = new UserDao();
			if(user.getId().equals("admin") && Integer.parseInt(String.valueOf(session.getAttribute("auth"))) != 1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('관리자계정은 본인 이외 수정할 수 없습니다')");
				script.println("history.back()");
				script.println("</script>");
				return;
			}
			int result = dao.updateUser(user);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('변경 실패')");
				script.println("history.back()");
				script.println("</script>");
			}else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원 정보가 변경되었습니다')");
				script.println("location.href ='memberManage.jsp'");
				script.println("</script>");
			}
			
		}
	}
	else{
		response.sendRedirect("main.jsp");
	}
	%>
</body>
</html>