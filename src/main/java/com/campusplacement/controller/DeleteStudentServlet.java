package com.campusplacement.controller;

import java.io.IOException;

import com.campusplacement.dao.StudentDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/DeleteStudentServlet", "/Delete_Student" })
public class DeleteStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	 protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        int studentId = Integer.parseInt(request.getParameter("id"));

	        StudentDAO dao = new StudentDAO();
	        dao.deleteStudent(studentId);

	        response.sendRedirect("manageStudents.jsp");
	    }

}
