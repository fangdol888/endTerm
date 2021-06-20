<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>겜방</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width , initial-scale=1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="https://bootswatch.com/4/cyborg/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/cyborg.css" type="text/css">
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<!-- 부트스트랩 참조 영역 -->
	<script src="https://bootswatch.com/_vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://bootswatch.com/_vendor/jquery/dist/jquery.min.js"></script>
	
	<div class="container mt-4">
    <div class="jumbotron">
    	<div class="contianer">
  	  		<header class="jumbotron my-2">
  		    	<h2 class="display-5">안녕하세요!<br> 겜방에 오신것을 환영합니다!</h2>
  		 	</header>
	      	<p class="lead">
	 	 	- 자유롭게 플레이 하세요!<br>
	  		- 자유롭게 정보를 공유해보세요!<br>
	  		- 경쟁을 통해 점수를 올리세요!<br>
	  		</p>
    	</div>
    </div>
    
    <!-- Page Features -->
    <a class="btn btn-primary" href="gamePlay.jsp">게임하기</a> 
    <!-- /.row -->
    </div>
</body>
</html>