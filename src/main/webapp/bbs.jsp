<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
<%@ page import="com.baek.dao.*" %>
<%@ page import="com.baek.model.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width , initial-scale=1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="https://bootswatch.com/4/cyborg/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/cyborg.css" type="text/css">

<style type="text/css">
 a , a:hover{
 color: #ffffff;
 text_decoration: none;
}
</style>
</head>
<body>

<%
String userID =null;
if(session.getAttribute("userID") != null){
	userID = (String)session.getAttribute("userID");
}

int pageNumber = 1; //기본은 1 페이지를 할당
// 만약 파라미터로 넘어온 오브젝트 타입 'pageNumber'가 존재한다면
// 'int'타입으로 캐스팅을 해주고 그 값을 'pageNumber'변수에 저장한다
if(request.getParameter("pageNumber") != null){
	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
}
%>
	<jsp:include page="menu.jsp"/>
	<!-- 부트스트랩 참조 영역 -->
	<script src="https://bootswatch.com/_vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://bootswatch.com/_vendor/jquery/dist/jquery.min.js"></script>
	
	
<div class="container mt-4" id="wrap">
    	<h2>자유게시판</h2>
    	<div class="row">
    	<table class="table table-striped mt-4" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr class="table-secondary">
						<th style="text-align: center;">번호</th>
						<th style="text-align: center;">제목</th>
						<th style="text-align: center;">작성자</th>
						<th style="text-align: center;">작성일</th>
						<th style="text-align: center;">조회수</th>
					</tr>
				</thead>
				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO(); // 인스턴스 생성
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for(int i = 0; i < list.size(); i++){
					%>
					<tr>
						<td><%= list.get(i).getBbsID() %></td>
						<!-- 게시글 제목을 누르면 해당 글을 볼 수 있도록 링크를 걸어둔다 -->
						<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>">
							<%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;")
									.replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"
							+ list.get(i).getBbsDate().substring(14, 16) + "분" %></td>
							<td><%= list.get(i).getViews() %></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<!-- 페이징 처리 영역 -->
			
			<div class="container">
    			<div class="row">
        			<div class="col-sm-2">
        			<%
					if(pageNumber != 1){
					%>
					<a href="bbs.jsp?pageNumber=<%=pageNumber - 1 %>"
					class="btn btn-success btn-arraw-left">이전</a><%}%>
					</div>
        			<div class="col-sm-2">
        			<%
						if(bbsDAO.nextPage(pageNumber + 1)){
					%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber + 1 %>"
					class="btn btn-success btn-arraw-left">다음</a><%}%>
					</div>
       			 	<div class="col-sm-2 ml-auto"><a class="btn btn-primary" href="write.jsp">글 작성하기</a></div>
   		 		</div>

    			
    		</div>
    	</div>
    </div>

</body>
</html>