<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width , initial-scale=1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="https://bootswatch.com/4/cyborg/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/cyborg.css" type="text/css">
<title>2048</title>

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
	<div id="game" class="container mt-4">
		<iframe frameborder="0" scrolling="no" style="overflow-x:hidden; overflow:auto; width:100%; min-height:500px;" class="ml-auto mr-auto" src="2048/2048.html"></iframe>
		
	</div>
	
	<div class="card col-sm-4 mr-auto ml-auto mt-4">
  <div class="card-body">
    <h4 class="card-title">2048</h4>
    <h6 class="card-subtitle mb-2 text-muted">게임 설명</h6>
    <p class="card-text">게임 방법: 같은 숫자를 합치면서 2048를 만드는것이 목표입니다.<br>
    	오래 살아남을 수록 점수가 높아집니다!</p>
    <p class="card-text">
    	조작키: ← ↑ → ↓ (상하좌우 = 방향키)
    </p>
  </div>
  <br>
  <div class="row"></div>
</body>
</html>