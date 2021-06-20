<%@page import="com.baek.model.RankingBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width , initial-scale=1">

<title>랭킹</title>

<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/cyborg.css">
<link rel="stylesheet" href="https://bootswatch.com/4/cyborg/bootstrap.min.css" type="text/css">

</head>
<body>

<%
String userID =null;
if(session.getAttribute("userID") != null){
	userID = (String)session.getAttribute("userID");
}

String gameName = "지렁이";
if(request.getParameter("gameName")!=null){
	gameName = request.getParameter("gameName");
}
%>

	<jsp:include page="menu.jsp"/>
	<!-- 부트스트랩 참조 영역 -->
	<script src="https://bootswatch.com/_vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://bootswatch.com/_vendor/jquery/dist/jquery.min.js"></script>

	<div class="container mt-4">
	<div class="row"><center><h4>랭킹 Top100</h4></center></div>
	<div class="row ml-auto"> 
		<form action="ShowRanking" method="get">
			<select name="gameName">
				<option value="지렁이" <%if(gameName.equals("지렁이")){%> selected="selected" <%} %>> 지렁이</option>
				<option value="2048"  <%if(gameName.equals("2048")){%> selected="selected" <%} %>>2048</option>
			</select>
				<button class="btn btn-primary" type="submit" name="submit" value="lookup">조회</button>		
			</form>
		
	</div>
		<jsp:useBean id="ranking" class="com.baek.model.RankingBoard" />
		
    	<%@page import="com.baek.dao.*" %>
	<div class="row">
		<table class="table table-hover mt-4">
		<thead>
		<tr class="table-primary">
			<th>등수</th>
			<th>아이디</th>
			<th>점수</th>
			<th>달성시간</th>
		</tr>
		</thead>
		
			<%
				RankDao dao = new RankDao();
			
				ranking.setBoard(dao.getList(gameName));
				for(int i=0;i< ranking.getBoard().size();i++){
			%>
				<tr id="tr-<%=ranking.getBoard().get(i).getId()%>">
				<td><%=i+1%></td>
				<td><%=ranking.getBoard().get(i).getId()%></td>
				<td><%=ranking.getBoard().get(i).getScore()%></td>
				<td><%=ranking.getBoard().get(i).getTime()%></td>
				</tr>
			<%
				}
			%>
		</table>
	</div>
		
	</div>
</body>
</html>