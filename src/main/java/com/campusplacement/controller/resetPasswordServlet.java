package com.campusplacement.controller;

import java.io.IOException;

import com.campusplacement.dao.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet({ "/resetPasswordServlet", "/resetPassword" })
public class resetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String newPassword = request.getParameter("newPassword");
		String password = request.getParameter("password");
		System.out.println("i am in the resetpassword Servelet");
		System.out.println("The new passward is : "+newPassword);
        System.out.println("The old passwod is : "+password);
		if(password.equals(newPassword)) {
             System.out.println("Both password are equal");
		    HttpSession session = request.getSession(false);

		    if(session == null){
		        response.sendRedirect("login.jsp");
		        return;
		    }

		    Integer userId = (Integer) session.getAttribute("userId");

		    if(userId == null){
		    	   
		        response.sendRedirect("login.jsp");
		        return;
		    }

		    UserDAO userDAO = new UserDAO();

		    if(userDAO.updatePassword(userId, newPassword)){
		        session.invalidate();   // destroy session after reset
		        response.sendRedirect("login.jsp?msg=success");
		    }
		}
		else {
			System.out.println("password is not equal");
			response.sendRedirect("login.jsp?msg=error");
		}
	}

}
