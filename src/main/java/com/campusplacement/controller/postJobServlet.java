package com.campusplacement.controller;

import java.io.IOException;

import com.campusplacement.dao.JobDAO;
import com.campusplacement.model.Job;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/postJobServlet", "/postJob" })
public class postJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int recruiterId = Integer.parseInt(request.getParameter("recruiterId"));
		String jobRole = request.getParameter("role");
		String jobDescription = request.getParameter("description");
        double cgpa =Double.parseDouble(request.getParameter("minCgpa"));
        String requiredSkills = request.getParameter("skills"); 
        String lastDate = request.getParameter("lastDate");
        
        Job job = new Job();
        
        job.setRecruiterId(recruiterId);
        job.setJobRole(jobRole);
        job.setDescription(jobDescription);
        job.setMinCgpa(cgpa);
        job.setRequiredSkills(requiredSkills);
        job.setLastDate(lastDate);
        
        JobDAO jobDAO = new JobDAO();
        
       if(jobDAO.addJobs(job)) {
    	   System.out.println("Job added successfully !!!");
       }
       else {
    	   System.out.println("There is problem while adding the job");
       }
	}

}
