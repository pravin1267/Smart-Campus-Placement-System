package com.campusplacement.controller;

import java.io.File;
import java.io.IOException;

import com.campusplacement.dao.StudentDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/UpdateProfileServlet")
@MultipartConfig
public class UpdateProfileServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int studentId = Integer.parseInt(request.getParameter("studentId"));
		String branch = request.getParameter("branch");
		double cgpa   = Double.parseDouble(request.getParameter("cgpa"));
		String skills = request.getParameter("skills");
		String email  = request.getParameter("email");
		String phone  = request.getParameter("phone");

		String oldResume = request.getParameter("oldResume");
		String oldPhoto  = request.getParameter("oldPhoto");

		// Get upload base path
		String uploadPath = getServletContext().getRealPath("");

		String resumePath = uploadPath + File.separator + "resumes";
		String photoPath  = uploadPath + File.separator + "profileImages";

		// Create directories if not exist
		new File(resumePath).mkdirs();
		new File(photoPath).mkdirs();

		// ── Resume ──────────────────────────────────────────
		String resumeFileName = oldResume; // default: keep old
		Part resumePart = request.getPart("resume");
		if (resumePart != null) {
			String submitted = resumePart.getSubmittedFileName();
			if (submitted != null && !submitted.isEmpty()) {
				resumeFileName = submitted;
				resumePart.write(resumePath + File.separator + resumeFileName);
			}
		}

		// ── Profile Photo ────────────────────────────────────
		String photoFileName = oldPhoto; // default: keep old
		Part photoPart = request.getPart("proPhoto");
		if (photoPart != null) {
			String submitted = photoPart.getSubmittedFileName();
			if (submitted != null && !submitted.isEmpty()) {
				photoFileName = submitted;
				photoPart.write(photoPath + File.separator + photoFileName);
			}
		}

		// ── Update Database ──────────────────────────────────
		StudentDAO studentDAO = new StudentDAO();
		studentDAO.updateStudentProfile(
				studentId,
				branch,
				cgpa,
				skills,
				email,
				phone,
				resumeFileName,
				photoFileName
		);

		// Redirect back to profile with success flag
		response.sendRedirect("Profile.jsp?success=true");
	}
}