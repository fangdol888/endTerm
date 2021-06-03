<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.css">
<meta charset="UTF-8">
<title>회원 정보</title>

<%@ page import="com.baek.dao.*" %>
<%@ page import="com.baek.model.*" %>

<%
String userID =null;
UserDao dao = new UserDao();
User user =null;
if(session.getAttribute("userID") != null){
	userID = (String)session.getAttribute("userID");
	user = dao.getUserById(userID);
}
%>
 <script type="text/javascript">
 
function isSame() {
    var pw = document.getElementById('password').value;
    var confirmPW = document.getElementById('confirm_password').value;
    var same = document.getElementById('same');
    
    if(pw == '' || confirmPW == ''){
    	same.style.display = "none";
    	same.innerHTML='';
    	return;
    }
    
    if (pw.length < 6 || pw.length > 20) {
        window.alert('비밀번호는 6글자 이상, 20글자 이하만 이용 가능합니다.');
        document.getElementById('password').value=document.getElementById('confirm_password').value='';
        same.innerHTML='';
    }
    
    if(document.getElementById('password').value!='' && document.getElementById('confirm_password').value!='') {
        if(document.getElementById('password').value==document.getElementById('confirm_password').value) {
            same.innerHTML='비밀번호가 일치합니다.';
            same.style.display = "block";
            same.className = "alert alert-success";
        }
        else {
        
            document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
            same.style.display = "block";
            same.className = "alert alert-danger";
        }
    }else{
    	same.style.display = "none";
    }
}
</script>

</head>
<body onload="init()">
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
				<li><a href="gamePlay.jsp">게임플레이</a></li>
				<li><a href="bbs.jsp">자유게시판</a></li>
				<li><a href="ranking.jsp">랭킹</a></li>
				<li class="active"><a href="management.jsp">관리페이지</a></li>
			</ul>
			<!-- 헤더 우측에 나타나는 드랍다운 영역 -->
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
	
	<div class="container">		<!-- 하나의 영역 생성 -->
		<div class="col-lg-offset-4 col-lg-4">	<!-- 영역 크기 -->
			<!-- 점보트론은 특정 컨텐츠, 정보를 두드러지게 하기 위한 큰 박스 -->
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="modifyInfo.jsp">
					<h3 style="text-align: center;">회원 정보</h3>
					<div class="form-group">
						 <label class="control-label" for="id">ID</label>
						<input type="text" class="form-control" placeholder="아이디" name="id" id="id" maxlength="20" value="<%= userID %>" readonly="readonly">
					</div>
					 <div class="form-group">
					 	<label class="control-label" for="password">비밀번호</label>
						<input type="password" class="form-control" placeholder="비밀번호" name="password" id="password" maxlength="20" onchange="isSame()">
					</div>
					<div class="form-group">
					 	<label class="control-label" for="id">비밀번호 재확인</label>
						<input type="password" class="form-control" placeholder="비밀번호 재확인" name="confirm_password" id="confirm_password" maxlength="20" onchange="isSame()">
					</div>
					<div class="form-group" style="text-align: center;">
						<div id="same" class='invalid-feedback' style="display: none;"></div>
					</div>
					<div class="form-group">
						<label class="control-label" for="name">이름</label>
						<input type="text" class="form-control" placeholder="이름 " name="name" id="name" maxlength="20" value="<%=user.getName()%>">
					</div>
					<div class="form-group" style="text-align: center;" >
						<div class="btn-group" data-toggle="buttons">
							<% if(user.getGender().equals("남자")) {%>
							<label class="btn btn-primary active">
								<input type="radio" name="gender" autocomplete="off" value="남자" checked>남자
							</label>
							<label class="btn btn-primary">
								<input type="radio" name="gender" autocomplete="off" value="여자">여자
							</label>
							<%}else { %>
							<label class="btn btn-primary">
								<input type="radio" name="gender" autocomplete="off" value="남자" >남자
							</label>
							<label class="btn btn-primary active">
								<input type="radio" name="gender" autocomplete="off" value="여자" checked>여자
							</label>
							<%} %>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label" for="email">이메일</label>
						<input type="email" class="form-control" placeholder="이메일" name="email" id="email" maxlength="20" value="<%=user.getEmail()%>">
					</div>
					
					<input type="submit" class="btn btn-primary form-control" name="submit" value="수정">
					<input type="submit" class="btn btn-secondary btn-block" name="submit" value="취소">
				</form>
			</div>
		</div>	
	</div>

</body>
</html>