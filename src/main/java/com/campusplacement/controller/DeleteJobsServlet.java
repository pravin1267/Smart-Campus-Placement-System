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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JobDAO jobDAO = new JobDAO();
		
	}

}
