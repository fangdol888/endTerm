<%@page import="org.apache.tomcat.util.http.parser.Authorization"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.baek.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.baek.dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권한 적용</title>
</head>
<body>
<%
		// 현재 세션 상태를 체크한다
		String userID =null;
		int auth = -1;
		
		String targetID = request.getParameter("userId");
		String Auth = request.getParameter("auth");
		UserDao dao = new UserDao();

		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		
		if(session.getAttribute("auth") !=null){
			auth = Integer.parseInt(String.valueOf(session.getAttribute("auth")));
		}

		if(auth <= 0 || targetID.equals("admin")){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('권한이 없습니다')");
				script.println("history.back()'");
				script.println("</script>");
		}
		else{
			int rs;
			
			if(Auth.equals("true")){
				rs = dao.updateAuth(targetID, 2);
			}else{
				rs = dao.updateAuth(targetID, 0);
			}
			
			if(rs == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('변경 실패 했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('권한이 변경되었습니다.')");
				script.println("location.href=document.referrer");
				script.println("</script>");
			}
		}
		
		
	%>
</body>
</html>