package com.campusplacement.controller;

import java.io.IOException;

import com.campusplacement.dao.ApplicationDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/ApplyJobServlet", "/applyJob" })
public class ApplyJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			int jobId = Integer.parseInt(request.getParameter("jobId"));
			int studentId = Integer.parseInt(request.getParameter("studentId"));

			ApplicationDAO applicationDAO = new ApplicationDAO();

			boolean applied = applicationDAO.applyForJob(studentId, jobId);

			if (applied) {

				response.sendRedirect("Student-Dashboard.jsp?msg=applied");

			} else {

				response.sendRedirect("Student-Dashboard.jsp?error=failed");

			}

		} catch (Exception e) {

			e.printStackTrace();
			response.sendRedirect("Student-Dashboard.jsp?error=exception");

		}
	}

}
