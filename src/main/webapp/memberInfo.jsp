<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width , initial-scale=1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="https://bootswatch.com/4/cyborg/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/cyborg.css" type="text/css">
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

function isOk(message){
	var pw = document.getElementById('password').value;
	var confirmPW = document.getElementById('confirm_password').value;
	var userpw = "<%=user.getPassword()%>";
	
	if(pw==""||pw==null ||confirmPW==""||confirmPW==null){
		alert("비밀번호와 재확인 입력란을 모두 입력해주십시오");
		return;
	}else if(pw!=confirmPW || pw != userpw){
		alert("비밀번호를 확인해주세요");
		return;
	}
    message ="정말 "+message+" 하시겠습니까?";
	var ok = confirm(message);
	if(ok){
		location.href = "memberWithdraw.jsp";
	}else{
		return;
	}
}
</script>

</head>
<body>
	<jsp:include page="menu.jsp"/>
	<!-- 부트스트랩 참조 영역 -->
	<script src="https://bootswatch.com/_vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://bootswatch.com/_vendor/jquery/dist/jquery.min.js"></script>
	
	<div class="container">		<!-- 하나의 영역 생성 -->
		<div class="col-lg-5 ml-md-auto mr-md-auto mt-4">	<!-- 영역 크기 -->
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
					<div class="form-group">
					<input type="submit" class="btn btn-primary form-control" name="submit" value="수정">
					</div>
					<div class="form-group">
					<input type="submit" class="btn float-right" name="submit" value="취소">
					<% if(!userID.equals("admin")) {%>
					<input type="button" class="btn btn-danger float-right" name="submit" value="탈퇴" onclick="isOk('탈퇴')">
					<% }%>
					</div>
				</form>
			</div>
		</div>	
	</div>

</body>
</html>