package com.baek.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.baek.dao.RankDao;
import com.baek.model.Rank;
import java.util.List;

/**
 * Servlet implementation class ShowRacking
 */
@WebServlet("/ShowRanking")
public class ShowRanking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShowRanking() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String submit = "";
    	if(request.getParameter("submit") != null) {
			submit = request.getParameter("submit");
		}
    	if(submit.equals("loading")) {
    		doManageRanking(request, response);
    	}else {
    		doShowRanking(request, response);
    	}
    	
	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String submit = "";
    	if(request.getParameter("submit") != null) {
			submit = request.getParameter("submit");
		}
    	if(submit.equals("loading")) {
    		doManageRanking(request, response);
    	}else {
    		doShowRanking(request, response);
    	}
	}
	protected void doShowRanking(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		RankDao dao = new RankDao();
		List<Rank> board;
		request.setCharacterEncoding("utf-8");
		
		if(request.getParameter("gameName") == null) {
			board = dao.getList("지렁이");
		}
		else{ 
			board = dao.getList(request.getParameter("gameName"));
		}
		request.setAttribute("ranking", board);
		request.getRequestDispatcher("ranking.jsp").forward(request,response);
	}
	
	protected void doManageRanking(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//관리 페이지에서 요청

		RankDao dao = new RankDao();
		List<Rank> board;
		request.setCharacterEncoding("utf-8");
		
		if(request.getParameter("gameName") == null) {
			board = dao.getList("지렁이");
		}
		else{ 
			board = dao.getList(request.getParameter("gameName"));
		}
		request.setAttribute("ranking", board);
		request.getRequestDispatcher("rankManage.jsp").forward(request,response);
	}
}
