package com.campusplacement.controller;

import java.io.IOException;

import com.campusplacement.dao.JobDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteJobServlet
 */
@WebServlet({ "/DeleteJobServlet", "/Delete_Jobs" })
public class DeleteJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int jobId = Integer.parseInt(request.getParameter("id"));

        JobDAO dao = new JobDAO();
        dao.deleteJob(jobId);

        response.sendRedirect("manageJobs.jsp");
    }

}
