package com.campusplacement.service;

import java.util.List;

import com.campusplacement.dao.ApplicationDAO;
import com.campusplacement.dao.InterviewDAO;
import com.campusplacement.model.Interview;

public class InterviewService {

    private InterviewDAO interviewDAO = new InterviewDAO();
    private ApplicationDAO applicationDAO = new ApplicationDAO();

    /**
     * Schedule interview for shortlisted application
     */
    public boolean scheduleInterview(Interview interview) {

        // 1. Basic null check
        if (interview == null) {
            return false;
        }

        int appId = interview.getAppId();

        // 2. Validate application exists
        // (Simple assumption: if application status update works, app exists)
        // In advanced version you may fetch application object

        // 3. Optional business check — interview date not null
        if (interview.getInterviewDate() == null ||
            interview.getInterviewTime() == null) {
            return false;
        }

        // 4. Call DAO
        return interviewDAO.scheculeInterview(interview);
    }

    /**
     * Get interviews for a student
     */
    public List<Interview> getInterviewsByStudent(int studentId) {

        if (studentId <= 0) {
            return null;
        }

        return interviewDAO.getInterviewByStudent(studentId);
    }

    /**
     * Update interview result
     */
    public boolean updateInterviewResult(int interviewId, String result) {

        // 1. Validate input
        if (interviewId <= 0 || result == null) {
            return false;
        }

        // 2. Normalize result
        result = result.toUpperCase();

        // 3. Allow only valid values
        if (!result.equals("SELECTED") && !result.equals("REJECTED")) {
            return false;
        }

        // 4. Call DAO
        return interviewDAO.updateResult(interviewId, result);
    }
}