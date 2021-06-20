package com.baek.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.*;
import com.baek.dao.*;
import com.baek.model.*;
/**
 * Servlet implementation class RankingController
 */
@WebServlet("/RankingController")
public class RankingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RankingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = "";
		HttpSession session = request.getSession(false);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
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
				return;
		}
		if(request.getParameter("type") != null) {
			type = request.getParameter("type");
		}
		
		if(type.equals("delete")) {
			doDeleteRank(request, response);
		}else if(type.equals("set")) {
			doSetRank(request, response);
		}
		else {
			doUpdateRank(request,response);
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void doUpdateRank(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//랭킹 수정
		String id = request.getParameter("id");
		int score = Integer.parseInt(request.getParameter("score"));
		String time = request.getParameter("time");
		String gameName = request.getParameter("gameName");
		RankDao dao = new RankDao();
		dao.updateRank(gameName, id, score, time);
		request.getRequestDispatcher("rankManage.jsp").forward(request,response);
	}
	
	protected void doDeleteRank(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//랭킹 기록 삭제
		String gameName = request.getParameter("gameName");
		String id = request.getParameter("id");
		RankDao dao = new RankDao();
		dao.deleteRank(gameName,id);
		request.getRequestDispatcher("rankManage.jsp").forward(request,response);
	}	
	
	protected void doSetRank(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//랭킹 추가
		String id = request.getParameter("id");
		int score =0;
		String gameName = request.getParameter("gameName");

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		RankDao dao = new RankDao();
		int result = dao.setRank(gameName, id, score);
		
		if(result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터 베이스 오류')");
			script.println("history.back()");
			script.println("</script>");
			return;
		}
		else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('기록이 이미 존재합니다.')");
			script.println("history.back()");
			script.println("</script>");
			return;
		}
		request.getRequestDispatcher("rankManage.jsp").forward(request,response);
	}
}
