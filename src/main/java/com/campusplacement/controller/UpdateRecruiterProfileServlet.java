package com.campusplacement.controller;

import java.io.IOException;

import com.campusplacement.dao.RecruiterDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateRecruiterProfileServlet")
public class UpdateRecruiterProfileServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int recruiterId = Integer.parseInt(request.getParameter("recruiterId"));
			String hrName = request.getParameter("hrName");
			String companyName = request.getParameter("companyName");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");

			RecruiterDAO dao = new RecruiterDAO();
			boolean updated = dao.updateRecruiterProfile(recruiterId, hrName, companyName, email, phone);

			if (updated) {
				request.getSession().setAttribute("successMsg", "Profile updated successfully!");
			} else {
				request.getSession().setAttribute("errorMsg", "Failed to update profile. Please try again.");
			}
		} catch (Exception e) {
			request.getSession().setAttribute("errorMsg", "An error occurred while updating the profile.");
			e.printStackTrace();
		}

		response.sendRedirect("Recruiters-Dashboard.jsp");
	}

}
