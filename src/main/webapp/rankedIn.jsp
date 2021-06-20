<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*" %>
    <%@ page import="com.baek.dao.*" %>
    <%@ page import="com.baek.model.*" %>
    <% request.setCharacterEncoding("utf-8"); %>
    <jsp:useBean id="rank" class="com.baek.model.Rank"/>
    <jsp:setProperty property="gameName" name="rank"/>
    <jsp:setProperty property="score" name="rank"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>랭크 등록</title>
</head>
<body>
<%

// 현재 세션 상태를 체크한다
String userID = null;
if(session.getAttribute("userID") != null){
	userID = (String)session.getAttribute("userID");
}
// 로그인을 한 사람만 글을 쓸 수 있도록 코드를 수정한다
if(userID == null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인을 하세요')");
	script.println("location.href='login.jsp'");
	script.println("</script>");
}else{
	RankDao rdao = new RankDao();
	int result = rdao.setRank(rank.getGameName(), String.valueOf(session.getAttribute("userID")), rank.getScore());
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('랭킹 등록 실패했습니다')");
		script.println("history.back()");
		script.println("</script>");
	// 글쓰기가 정상적으로 실행되면 알림창을 띄우고 게시판 메인으로 이동한다
	}else if(result == -2){ //갱신 실패
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이전 최고 기록보다 낮은 점수이므로 갱신되지 않았습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('랭킹에 등록되었습니다.')");
		//String loc = "location.href='game/"+rank.getGameName()+".jsp'";
		//script.println(loc);
		script.println("history.back()");
		script.println("</script>");
	}
}

%>
</body>
</html>