package com.campusplacement.controller;

import java.io.IOException;

import com.campusplacement.dao.RecruiterDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/DeleteRecruiterServlet", "/Delete_Recruiters" })
public class DeleteRecruiterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int recruiterId = Integer.parseInt(request.getParameter("id"));

        RecruiterDAO dao = new RecruiterDAO();
        dao.deleteRecruiter(recruiterId);

        response.sendRedirect("manageRecruiters.jsp");
    }

}
