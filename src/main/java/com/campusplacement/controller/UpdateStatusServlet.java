package com.campusplacement.controller;

import java.io.IOException;

import com.campusplacement.dao.ApplicationDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateStatusServlet")
public class UpdateStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	 protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        int appId = Integer.parseInt(request.getParameter("appId"));
	        String status = request.getParameter("status");

	        ApplicationDAO dao = new ApplicationDAO();
	        dao.updateStatus(appId, status);

	        response.sendRedirect("viewApplicants.jsp");
	    }

}
