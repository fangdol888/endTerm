<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width , initial-scale=1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/cyborg.css">
<link rel="stylesheet" href="https://bootswatch.com/4/cyborg/bootstrap.min.css" type="text/css">
<title>로그인</title>

</head>
<body>
	<jsp:include page="menu.jsp"/>
	<!-- 부트스트랩 참조 영역 -->
	<script src="https://bootswatch.com/_vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://bootswatch.com/_vendor/jquery/dist/jquery.min.js"></script>
	
	<div class="container">		<!-- 하나의 영역 생성 -->
	<center>
	<br>
		<div class="col-lg-offset-4 col-lg-4">	<!-- 영역 크기 -->
			<!-- 점보트론은 특정 컨텐츠, 정보를 두드러지게 하기 위한 큰 박스 -->
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="LoginAction">
					<h3 style="text-align: center;">로그인 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control mt-4" placeholder="아이디" name="id" id="id" maxlength="20">
					</div>
					 <div class="form-group">
						<input type="password" class="form-control mt-4" placeholder="비밀번호" name="password" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control mt-4" name="submit" value="로그인">
					<input type="submit" class="btn btn-secondary form-control mt-4" name="submit" value="회원가입">
				</form>
			</div>
		</div>	
	</div>
	</center>
</body>
</html>