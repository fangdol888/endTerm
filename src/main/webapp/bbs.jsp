<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.css">

</head>
<body>

<%
String userID =null;
if(session.getAttribute("userID") != null){
	userID = (String)session.getAttribute("userID");
}
%>

<nav class="navbar navbar-default"> <!-- 네비게이션 -->
		<div class="navbar-header"> 	<!-- 네비게이션 상단 부분 -->
			<!-- 네비게이션 상단 박스 영역 -->
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<!-- 이 삼줄 버튼은 화면이 좁아지면 우측에 나타난다 -->
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<!-- 상단 바에 제목이 나타나고 클릭하면 main 페이지로 이동한다 -->
			<a class="navbar-brand" href="main.jsp">겜방</a>
		</div>
		<!-- 게시판 제목 이름 옆에 나타나는 메뉴 영역 -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li ><a href="gamePlay.jsp">게임플레이</a></li>
				<li class="active"><a href="bbs.jsp">자유게시판</a></li>
				<li><a href="ranking.jsp">랭킹</a></li>
				<li><a href="management.jsp">관리페이지</a></li>
			</ul>
			<!-- 헤더 우측에 나타나는 드랍다운 영역 -->
			<% if(userID == null){ %>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<!-- 드랍다운 아이템 영역 -->	
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>
						<li><a href="register.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<%} else{ %>
				<ul class="nav navbar-nav navbar-right">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
			<%} %>
		</div>
	</nav>
	<!-- 부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
<div class="container" id="wrap">
    	<h2>자유게시판</h2>
    	<div class="row">
    	<table class="table table-striped">
    		
    		<tr>
    			<th>글번호</th>
    			<th>글제목</th>
    			<th>작성자</th>
    			<th>작성날짜</th>
    			<th>조회수</th>
    		</tr>
    		<tr>
						<!-- 테스트 코드 -->
						<td>1</td>
						<td>안녕하세요</td>
						<td>홍길동</td>
						<td>2020-07-13</td>
						<td>1</td>
			</tr>
			<c:forEach var="posting" items="${list}">
				<tr>
					<td>${posting.num }</td>
					<td>${posting.title }</td>
					<td>${posting.name }</td>
					<td>${posting.writeDate }</td>
					<td>${posting.readCount }</td>
				</tr>
			</c:forEach>
			
			<tr>
    			<td colspan="5" style="border:white;text-align:right;">
    			<a class="btn btn-primary pull-right" href="write.jsp">글 작성하기</a></td>
    		</tr>
    	</table>
    	</div>
    </div>

</body>
</html>