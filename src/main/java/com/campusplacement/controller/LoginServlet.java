package com.campusplacement.controller;

import java.io.IOException;

import com.campusplacement.dao.UserDAO;
import com.campusplacement.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet({ "/LoginServlet", "/loginServlet" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		UserDAO userDAO = new UserDAO();
	    User user = userDAO.login(name, password);
        String msg = "";    
	        if (user == null) {
	           msg ="<div class=\"alert alert-danger\" role=\"alert\">\r\n"
	           		+ "  Invalid username or Password !\r\n"
	           		+ "</div>";
	           request.setAttribute("messege", msg);
	           RequestDispatcher rd =  request.getRequestDispatcher("login.jsp");
	           rd.forward(request, response);
	        } else {
	        	HttpSession session = request.getSession();

	        	session.setAttribute("userId", user.getUserId());
	        	session.setAttribute("role", user.getRole());

	        	if(user.getRole().equals("ADMIN")){
	        	    response.sendRedirect("admin-dashboard.jsp");
	        	}
	        	else if(user.getRole().equals("RECRUITER")){
	        	    response.sendRedirect("Recruiters-Dashboard.jsp");
	        	}
	        	else{
	        	    response.sendRedirect("Student-Dashboard.jsp");
	        	}
	        }
	}

}
