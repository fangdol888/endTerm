<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String userID =null;
if(session.getAttribute("userID") != null){
	userID = (String)session.getAttribute("userID");
}
%>    
    
<nav class="navbar navbar-expand-lg navbar-dark bg-dark"> <!-- 네비게이션 -->
	<div class="container-fluid">
		<!-- 상단 바에 제목이 나타나고 클릭하면 main 페이지로 이동한다 -->
		<a class="navbar-brand" href="/Assignment/main.jsp">겜방</a>
		 <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
    		  <span class="navbar-toggler-icon"></span>
   		 </button>
		<!-- 게시판 제목 이름 옆에 나타나는 메뉴 영역 -->
		<div class="collapse navbar-collapse" id="navbarColor02">
			<ul class="nav navbar-nav me-auto">
				<li class="nav-item"><a class="nav-link active" href="/Assignment/gamePlay.jsp">게임플레이</a></li>
				<li class="nav-item"><a class="nav-link" href="/Assignment/bbs.jsp">자유게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="/Assignment/ranking.jsp">랭킹</a></li>
				<li class="nav-item"><a class="nav-link" href="/Assignment/management.jsp">관리페이지</a></li>
			</ul>
			<!-- 헤더 우측에 나타나는 드랍다운 영역 -->
			<% if(userID == null){ %>
				<ul class="navbar-nav navbar-right">
					<li class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">접속하기</a>
						<!-- 드랍다운 아이템 영역 -->	
						<div class="dropdown-menu">
							<a class="dropdown-item" href="/Assignment/login.jsp">로그인</a>
							<a class="dropdown-item" href="/Assignment/register.jsp">회원가입</a>
						</div>
					</li>
				</ul>
			<%} else{ %>
				<ul class="nav navbar-nav navbar-right">
						<li class="nav-item"><a class="nav-link" href="/Assignment/logoutAction.jsp">로그아웃</a></li>
				</ul>
			<%} %>
		</div>
	</div>
</nav>