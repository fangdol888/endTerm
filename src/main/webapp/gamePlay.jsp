<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임플레이</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width , initial-scale=1">
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
else{
	response.sendRedirect("login.jsp");
}

%>
	<jsp:include page="menu.jsp"/>
	
	<!-- 부트스트랩 참조 영역 -->
	<script src="https://bootswatch.com/_vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></sciprt>
	<script src="https://bootswatch.com/_vendor/jquery/dist/jquery.min.js"></script>
	

	<div class="container mt-4">
    <div class="jumbotron">
    	<div class="contianer">
  	  		<header class="jumbotron my-2">
  		    	<h2 class="display-5">간단한 게임을 즐겨보세요!</h2>
  		 	</header>
	      	<p class="lead">
	 	 	- 자유롭게 플레이 하세요!<br>
	  		- 자유롭게 정보를 공유해보세요!<br>
	  		- 경쟁을 통해 점수를 올리세요!<br>
	  		</p>
    	</div>
    </div>
    
    <!-- Page Features -->
    <div class="row text-center">

	<div class="col-md-4">
	<div class="card border-primary mb-3" style="max-width: 20rem;">
 	 <div class="card-header">Javascript</div>
 	 <div class="card-body">
  	  <h4 class="card-title">지렁이 게임</h4>
  	  <p class="card-text"> 먹이를 먹고, 지렁이를 길게 늘려서 점수를 높이세요!</p>
  	    <div class="card-footer">
            <a href="game/snake.jsp" class="btn btn-primary">게임하러가기!</a>
          </div>
 	 </div>
 	 </div>
 	</div>
	<div class="col-md-4">
	<div class="card border-primary mb-3" style="max-width: 20rem;">
 	 <div class="card-header">Javascript</div>
 	 <div class="card-body">
  	  <h4 class="card-title">2048</h4>
  	  <p class="card-text"> 같은 숫자를 합쳐 최대한 오래 버텨서 점수를 높이세요!</p>
  	    <div class="card-footer">
            <a href="game/2048.jsp" class="btn btn-primary">게임하러가기!</a>
          </div>
 	 </div>
	</div>
    </div> 
    
    <!-- /.row -->
    </div>
</body>
</html>