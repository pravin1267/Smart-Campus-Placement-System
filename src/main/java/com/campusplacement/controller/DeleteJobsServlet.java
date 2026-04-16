package com.campusplacement.controller;

import java.io.IOException;

import com.campusplacement.dao.JobDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/DeleteJobsServlet", "/deleteJobs" })
public class DeleteJobsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JobDAO jobDAO = new JobDAO();
		try {
			int jobId = Integer.parseInt(request.getParameter("jobId"));
			jobDAO.deleteJob(jobId);
			request.getSession().setAttribute("successMsg", "Job deleted successfully.");
		} catch (Exception e) {
			request.getSession().setAttribute("errorMsg", "Failed to delete job. Please try again.");
			e.printStackTrace();
		}
		response.sendRedirect("Recruiters-Dashboard.jsp");
	}

}
