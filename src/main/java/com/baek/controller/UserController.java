package com.baek.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.baek.dao.UserDao;
import com.baek.model.User;


@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L; 
	 private UserDao userDao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserController() {
        super();
        this.userDao = new UserDao();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User user = new User(); 
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		user.setId(request.getParameter("id"));
		user.setGender(request.getParameter("gender"));
		user.setName(request.getParameter("name"));
		user.setEmail(request.getParameter("email"));
		UserDao ud = new UserDao();
		ud.register(user);
		request.getRequestDispatcher("registerAction.jsp").forward(request,response);

	}

}
