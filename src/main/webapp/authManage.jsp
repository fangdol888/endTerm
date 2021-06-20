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
<title>권한 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width , initial-scale=1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="https://bootswatch.com/4/cyborg/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/cyborg.css" type="text/css">

<script>
	var focus = "";

	function showAuth(userID){
		var auth = document.getElementById("auth-"+userID).value;
		var tr = document.getElementById("tr-"+userID);
		var id_td = document.getElementById("userID");
		var auth_td = document.getElementById("Auth");
		
		id_td.innerText = userID;
		
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
		
		if(auth == "true"){
			if(userID == "admin") auth_td.disabled=true;
			else auth_td.disabled = false;
			auth_td.checked=true;
		}else {
			auth_td.disabled=false;
			auth_td.checked=false;
		}
	}
	function submitModify(){
		var res = confirm('권한을 적용하시겠습니까?');
		if(!res) return;
		
		var url = "modifyAuth.jsp?";
		var id = document.getElementById("userID");
		var auth = document.getElementById("Auth");
		url += "userId="+id.innerText;
		url +="&auth="+auth.checked;
		location.href = url;
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
		<center><h4>권한 관리</h4></center>
	</div>
	 <div class="row">
        <div class="col-sm-4 ml-auto">
        <table class="table table-hover">
		<thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">이름</th>
    </tr>
  </thead>
  <tbody>
  	 <%
  	 					UserDao dao = new UserDao();
						List<User> users = dao.getAllUsers();
						for(int i = 0; i < users.size(); i++){
							String user = users.get(i).getId();
					%>
					<tr class="default" id="tr-<%=user%>" onclick="showAuth('<%=user%>')">
						<td><%= user %></td>
						<!-- 유저를 누르면 해당 유저의 권한을 볼 수 있도록 링크를 걸어둔다 -->
						<td><%= users.get(i).getName() %></td>
						<input type="hidden" id="auth-<%=user%>" value="<%=dao.isAdmin(user)%>">
					</tr>
					<%
						}
					%>
  </tbody>
	</table>
        </div>
        <div class="col-sm-4 mr-auto">
       		<table class="table table-hover">
		<thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">관리자 권한</th>
    </tr>
  </thead>
  <tbody>
  	 <tr>
      <th width="100" id="userID" scope="row">아이디표시</th>
      <td><input type="checkbox" id="Auth"></td>
    </tr>
  </tbody>
	</table> 
		<a class="btn btn-primary ml-auto mr-auto"  onclick="submitModify()">권한 적용</a>
        </div>
    </div>
	
	</div>
	
</body>
</html>