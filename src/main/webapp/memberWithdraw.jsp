<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ page import="com.baek.dao.*" %>
<%@ page import="com.baek.model.*" %>

<title>unregister</title>
</head>
<body>
	<%
		try{
		UserDao dao = new UserDao();
		User user = dao.getUserById((String)session.getAttribute("userID"));
		dao.deleteUser(user);
		session.invalidate();
		%>
		<script>
			alert("탈퇴가 완료되었습니다");
			location.href ="main.jsp";
		</script>
		<%
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	
</body>
</html>