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
<title>회원 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width , initial-scale=1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="https://bootswatch.com/4/cyborg/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/cyborg.css" type="text/css">
<script>
	var focus = "";

	function showInfo(userID){
		var tr = document.getElementById("tr-"+userID);
		
		var id_in = document.getElementById("id");
		var pass_in = document.getElementById("password");
		var name_in = document.getElementById("name");
		var gender_in = document.getElementsByName("gender");
		var email_in = document.getElementById("email");
		
		var pass = document.getElementById(userID+"_password");
		var name = document.getElementById(userID+"_name");
		var gender = document.getElementById(userID+"_gender");
		var email = document.getElementById(userID+"_email");
		
		id_in.value = userID;
		pass_in.value = pass.value;
		name_in.value = name.value;
		email_in.value = email.value;
		if(gender.value == "남자") gender_in[0].checked = true;
		else gender_in[1].checked = true;
		
		
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
		var id = document.getElementById("id").value;
		
		if(id == "admin"){
			alert("관리자 계정은 탈퇴할 수 없습니다.");
			return;
		}
		
	    message ="정말 "+message+" 시키겠습니까?";
		var ok = confirm(message);
		if(ok){
			location.href = "memberBan.jsp?id="+id;
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
		<center><h4>회원 관리</h4></center>
	</div>
	 <div class="row">
        <div class="col-sm-5 ml-auto">
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
						for(int i = 1; i < users.size(); i++){
							String user = users.get(i).getId();
					%>
					<tr class="default" id="tr-<%=user%>" onclick="showInfo('<%=user%>')">
						<td><%= user %></td>
						<!-- 유저를 누르면 해당 유저의 권한을 볼 수 있도록 링크를 걸어둔다 -->
						<td><%= users.get(i).getName() %></td>
						
						<input type="hidden" id="<%=user%>_password" value="<%=users.get(i).getPassword() %>">
						<input type="hidden" id="<%=user%>_name" value="<%=users.get(i).getName() %>">
						<input type="hidden" id="<%=user%>_gender" value="<%=users.get(i).getGender() %>">
						<input type="hidden" id="<%=user%>_email" value="<%=users.get(i).getEmail() %>">
					</tr>
					<%
						}
					%>
  		</tbody>
		</table>
        </div>
        
       		

		<div class="col-sm-5 mr-auto">	<!-- 영역 크기 -->
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
						<input type="text" class="form-control" placeholder="비밀번호" name="password" id="password" maxlength="20">
					</div>
					<div class="form-group">
						<label class="control-label" for="name">이름</label>
						<input type="text" class="form-control" placeholder="이름 " name="name" id="name" maxlength="20">
					</div>
					<div class="form-group" style="text-align: center;" >
						<div class="btn-group" data-toggle="buttons">
							
							<label class="btn btn-primary active">
								<input type="radio" name="gender" autocomplete="off" value="남자" checked>남자
							</label>
							<label class="btn btn-primary">
								<input type="radio" name="gender" autocomplete="off" value="여자">여자
							</label>
		
						</div>
					</div>
					<div class="form-group">
						<label class="control-label" for="email">이메일</label>
						<input type="email" class="form-control" placeholder="이메일" name="email" id="email" maxlength="20">
					</div>
					<div class="form-group">
					<input type="submit" class="btn btn-primary form-control" name="submit" value="수정하기">
					</div>
					<div class="form-group">
					
					<input type="button" class="btn btn-danger float-right" name="submit" value="탈퇴" onclick="isOk('탈퇴')">
				
					</div>
				</form>
			</div>
		</div>	
       </div>
</div>
	
	
</body>
</html>