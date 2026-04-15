package com.campusplacement.service;

import java.util.List;

import com.campusplacement.dao.ApplicationDAO;
import com.campusplacement.dao.JobDAO;
import com.campusplacement.dao.StudentDAO;
import com.campusplacement.model.Application;
import com.campusplacement.model.Job;
import com.campusplacement.model.Student;

public class ShortlistService {

    private ApplicationDAO applicationDAO = new ApplicationDAO();
    private StudentDAO studentDAO = new StudentDAO();
    private JobDAO jobDAO = new JobDAO();
    private EligibilityService eligibilityService = new EligibilityService();

    /**
     * Shortlist a student's application based on eligibility
     */
    public boolean shortlistApplication(int studentId, int jobId, int appId) {

        // 1️⃣ Basic validation
        if (studentId <= 0 || jobId <= 0 || appId <= 0) {
            return false;
        }

        // 2️⃣ Fetch required data
        Student student = studentDAO.getStudentByUserId(studentId);
        Job job = getJobById(jobId); // helper method below

        if (student == null || job == null) {
            return false;
        }

        // 3️⃣ Check eligibility using service layer
        boolean eligible = eligibilityService.isEligible(student, job);

        // 4️⃣ Update application status accordingly
        if (eligible) {
            return applicationDAO.updateStatus(appId, "SHORTLISTED");
        } else {
            return applicationDAO.updateStatus(appId, "REJECTED");
        }
    }

    /**
     * Helper method to fetch job by id
     * (since your JobDAO currently has getAllJobs)
     */
    private Job getJobById(int jobId) {

        List<Job> jobs = jobDAO.getAllJobs();

        for (Job job : jobs) {
            if (job.getJobId() == jobId) {
                return job;
            }
        }

        return null;
    }
}