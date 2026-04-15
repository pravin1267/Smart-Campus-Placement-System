package com.campusplacement.controller;

import java.io.IOException;
import java.util.Random;

import com.campusplacement.dao.UserDAO;
import com.campusplacement.model.User;
import com.campusplacement.util.EmailUtil;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet({ "/ForgotPassword", "/forgot_password" })
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String email = request.getParameter("name");
		String msg= "";
		 UserDAO userDAO = new UserDAO();
	     System.out.println(email);
		 User user = userDAO.getUserByEmail(email);
	     if(user != null) System.out.println("true");
	     else System.err.println("false");
		
	     if(user != null) {
			
			Random random = new Random ();
			int otp = 100000 + random.nextInt(900000);
			
			HttpSession session = request.getSession();
			session.setAttribute("otp", otp);
			session.setAttribute("email", email);
			session.setAttribute("userId", user.getUserId());
			EmailUtil sendEmail = new EmailUtil();
			sendEmail.sendOTP(email, otp);
			System.out.println("Generated OTP is :"+otp);
			
			response.sendRedirect("verify-otp.jsp");
			
		}
		else {
			msg= "<div class=\"alert alert-danger\" role=\"alert\">\r\n"
					+ "  Email NOT found , Please enter valid email!\r\n"
					+ "</div>";
			request.setAttribute("messege", msg);
			RequestDispatcher rd = request.getRequestDispatcher("forgot-password.jsp");
			rd.forward(request, response);
		}
	}

}
