<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ page import="java.io.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="com.baek.dao.*" %>
    <%@ page import="com.baek.model.*" %>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴</title>
</head>
<body>
<%
String userID =null;
if(session.getAttribute("userID") != null){
	userID = (String)session.getAttribute("userID");
}
int auth = -1;
if(session.getAttribute("auth") !=null){
	auth = Integer.parseInt(String.valueOf(session.getAttribute("auth")));
}

if(auth <= 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
}

	try{
	String id =request.getParameter("id");
	if(id.equals("admin")){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('관리자계정은 삭제할 수 없습니다')");
		script.println("history.back()");
		script.println("</script>");
	}
	UserDao dao = new UserDao();
	User user = dao.getUserById(id);
	dao.deleteUser(user);
	%>
	<script>
		alert("탈퇴가 완료되었습니다");
		location.href = "memberManage.jsp";
	</script>
	<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</body>
</html>