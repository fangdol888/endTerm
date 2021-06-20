<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>지렁이게임</title>
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="https://bootswatch.com/4/cyborg/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../css/cyborg.css" type="text/css">
<link rel="stylesheet" type="text/css" href="snake.css">
</head>
<body>

<%
String userID =null;
if(session.getAttribute("userID") != null){
	userID = (String)session.getAttribute("userID");
}

if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다')");
		script.println("location.href = '../login.jsp'");
		script.println("</script>");
}
%>

	<jsp:include page="../menu.jsp"/>

	<!-- 부트스트랩 참조 영역 -->
	<script src="https://bootswatch.com/_vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://bootswatch.com/_vendor/jquery/dist/jquery.min.js"></script>
	

<div class="container mt-4">
	<div id="game" class="container ml-auto mr-auto">
		<script type="text/javascript" src="snake.js"></script>
		<form id="frm" action="../rankedIn.jsp" method="post">
			<div id="score">지렁이</div>
			<input type="hidden" id="gameName" name="gameName" value="지렁이">
			<input type="hidden" id="scoreValue" name="score" value="0">
		</form>
    	<div id="plus"></div>
   	 	<div id="retry"></div>
    </div>
    
    <div class="card col-sm-4 mr-auto ml-auto mt-4">
  <div class="card-body">
    <h4 class="card-title">지렁이 게임</h4>
    <h6 class="card-subtitle mb-2 text-muted">게임 설명</h6>
    <p class="card-text">게임 방법: 빨간색을 움직여서 파란 먹이를 먹으면 길어집니다.<br>
    	오래 살아남을 수록 점수가 높아집니다!</p>
    <p class="card-text">
    	조작키: ← ↑ → ↓ (상하좌우 = 방향키)
    </p>
  </div>
</div>
</div>
    
</body>
</html>