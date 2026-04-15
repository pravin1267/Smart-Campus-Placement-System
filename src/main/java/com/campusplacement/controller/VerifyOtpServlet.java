package com.campusplacement.controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet({ "/VerifyOtpServlet", "/verify" })
public class VerifyOtpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userOtp =Integer.parseInt(request.getParameter("otp")) ;
		
		HttpSession session = request.getSession();
		int originalOtp = (Integer) session.getAttribute("otp");
		
		if(userOtp == originalOtp) {
		    response.sendRedirect("./resetPassword.jsp");
		}
		else {
			String otpMessage = "<div class=\"alert alert-danger\" role=\"alert\">\r\n"
					+ "  Wrong OTP!! , Please enter Correct OTP!\r\n"
					+ "</div>";
			request.setAttribute("otpMessage", otpMessage);
			RequestDispatcher rd = request.getRequestDispatcher("verify-otp.jsp");
			rd.forward(request, response);
		}
	}

}
