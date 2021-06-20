<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width , initial-scale=1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/cyborg.css">
<link rel="stylesheet" href="https://bootswatch.com/4/cyborg/bootstrap.min.css" type="text/css">
<style>
table, tr, td, th, h4{
	text-align: center;
}
</style>

</head>
<body>
<%
String userID =null;
if(session.getAttribute("userID") != null){
	userID = (String)session.getAttribute("userID");
}
%>
	<jsp:include page="menu.jsp"/>

	<!-- 부트스트랩 참조 영역 -->
	<script src="https://bootswatch.com/_vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://bootswatch.com/_vendor/jquery/dist/jquery.min.js"></script>
	

<div class="container">
<h4>관리자 메뉴</h4>
<center>
<table class="table table-hover col-lg-6 col-lg-2">
  <thead>
    <tr>
      <th scope="col">No.</th>
      <th scope="col">작업</th>
    </tr>
  </thead>
  <tbody>
  	<tr>
  		<td>1</td>
  		<td><a href="memberManage.jsp" style="color:#ffffff;text-decoration: none;">회원 관리</a></td>
  	</tr>
  	<tr>
  		<td>2</td>
  		<td><a href="rankManage.jsp"  style="color:#ffffff;text-decoration: none;">점수 관리</a></td>
  	</tr>
  	<tr>
  		<td>3</td>
  		<td><a href="authManage.jsp"  style="color:#ffffff;text-decoration: none;">권한 관리</a></td>
  	</tr>
  	<tr>
  		<td>4</td>
  		<td><a href="memberInfo.jsp"  style="color:#ffffff;text-decoration: none;">관리자 정보 수정</a></td>
  	</tr>
  </tbody>
</table>
</center>
</div>

</body>
</html>