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
<title>점수 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width , initial-scale=1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="https://bootswatch.com/4/cyborg/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/cyborg.css" type="text/css">
<% String gameName = "지렁이"; 
	if(request.getParameter("gameName")!=null){
		gameName = request.getParameter("gameName");
	}
				
	%>
<script>
	var focus = "";

	function showInfo(userID){
		var tr = document.getElementById("tr-"+userID);

		var score = document.getElementById("score-"+userID);
		var time = document.getElementById("time-"+userID);
		var gameName = document.getElementById("gameName-"+userID);
		
		var id_in = document.getElementById("id");
		var score_in = document.getElementById("score");
		var time_in = document.getElementById("time");
		var gameName_in = document.getElementById("gameName");
		
		id_in.value = userID;
		score_in.value = score.innerText;
		time_in.value = time.innerText;
		gameName_in.value = gameName.value;
		
		if(focus == null || focus==""){
			focus = userID;
			tr.className = "table-primary";
		}
		else if(focus != userID){
			var tr_prev = document.getElementById("tr-"+focus);
			tr_prev.className = "default";
			focus = userID;
			tr.className = "table-primary";
		}
		
	}

	function isOk(message){
		var id;
		var type = "";
		//var gameName; 
		type = message;
	    message ="정말 "+message+" 하겠습니까?";
		var ok = confirm(message);
		

		if(type == "추가")
		{
			type ="set";
			id = document.getElementById("new_id").value
		}else{
			type = "delete";
			id = document.getElementById("id").value;
		}
		//gameName = document.getElementById("gameName-"+id).value;
		if(ok){
			location.href = "RankingController?id="+id+"&gameName="+"<%=gameName%>"+"&type="+type;
		}else{
			return;
		}
	}
</script>
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
%>
	<jsp:include page="menu.jsp"/>

	<!-- 부트스트랩 참조 영역 -->
	<script src="https://bootswatch.com/_vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://bootswatch.com/_vendor/jquery/dist/jquery.min.js"></script>

<div class="container mt-4">
	<div class="row">
		<center><h4>랭킹 관리</h4></center>
	</div>
	<jsp:useBean id="ranking" class="com.baek.model.RankingBoard" />
		
    	<%@page import="com.baek.dao.*" %>
	 <div class="row">
        <div class="col-sm-5 ml-auto">
        <div class="row"> 
		<form action="ShowRanking" method="get">
			<select name="gameName">
				<option value="지렁이" <%if(gameName.equals("지렁이")){%> selected="selected" <%} %>> 지렁이</option>
				<option value="2048"  <%if(gameName.equals("2048")){%> selected="selected" <%} %>>2048</option>
			</select>
				<button class="btn btn-primary" type="submit" name="submit" value="loading">조회</button>		
			</form>
			
			
	</div>
       <table class="table table-hover mt-4">
		<thead>
		<tr class="table table-hover">
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
					String id = ranking.getBoard().get(i).getId();
			%>
		
				<tr id="tr-<%=id%>" onclick="showInfo('<%=id%>')">
				<td id="td-<%=i%>"><%=i+1%></td>
				<td id="id-<%=id%>"><%=id%></td>
				<td id="score-<%=id%>"><%=ranking.getBoard().get(i).getScore()%></td>
				<td id="time-<%=id%>"><%=ranking.getBoard().get(i).getTime()%></td>
				<input type="hidden" id="gameName-<%=id %>" value="<%=ranking.getBoard().get(i).getGameName()%>">
				</tr>
			<%
				}
			%>
		</table>
		<div class="form-group">
			<input type="text" id="new_id" name="new_id" placeholder="추가할 아이디">
			<input type="button" class="btn btn-success float-right" name="submit" value="추가" onclick="isOk('추가')">
		</div>
        </div>
        
       		

		<div class="col-sm-5 mr-auto">	<!-- 영역 크기 -->
			<!-- 점보트론은 특정 컨텐츠, 정보를 두드러지게 하기 위한 큰 박스 -->
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="RankingController">
					<h3 style="text-align: center;">랭킹 정보</h3>
					
					<div class="form-group">
						 <label class="control-label" for="id">ID</label>
						<input type="text" class="form-control" placeholder="아이디" name="id" id="id" maxlength="20" value="<%= userID %>" readonly="readonly">
					</div>
					<div class="form-group">
						<label class="control-label" for="gameName">게임이름</label>
						<input type="text" class="form-control" placeholder="게임이름 " name="gameName" id="gameName">
					</div>
					 <div class="form-group">
					 	<label class="control-label" for="score">점수</label>
						<input type="text" class="form-control" placeholder="점수" name="score" id="score" maxlength="20">
					</div>
					<div class="form-group">
						<label class="control-label" for="time">달성시간</label>
						<input type="datetime" class="form-control" placeholder="시간 " name="time" id="time">
					</div>
					
					<div class="form-group">
					<input type="submit" class="btn btn-primary form-control" name="submit" value="수정">
					</div>
					<div class="form-group">
					
					<input type="button" class="btn btn-danger float-right" name="submit" value="삭제" onclick="isOk('삭제')">
				
					</div>
				</form>
			</div>
		</div>	
       </div>
</div>
</body>
</html>