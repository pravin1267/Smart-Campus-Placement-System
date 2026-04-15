package com.campusplacement.service;

import com.campusplacement.model.Student;
import com.campusplacement.model.Job;

import java.util.HashSet;
import java.util.Set;

public class EligibilityService {

    
     // Main method to check if student is eligible for a job
    
    public boolean isEligible(Student student, Job job) {

        if (student == null || job == null) {
            return false;
        }

        // Step 1: Check CGPA
        if (!isCgpaEligible(student, job)) {
            return false;
        }

        // Step 2: Check skills
        if (!isSkillEligible(student, job)) {
            return false;
        }

        return true;
    }

    
     // Checks CGPA eligibility
     
    private boolean isCgpaEligible(Student student, Job job) {
        return student.getCgpa() >= job.getMinCgpa();
    }

    /**
     * Checks skill eligibility
     * Assumes skills stored as comma-separated values
     */
    private boolean isSkillEligible(Student student, Job job) {

        String studentSkillsStr = student.getSkills();
        String jobSkillsStr = job.getRequiredSkills();

        if (studentSkillsStr == null || jobSkillsStr == null) {
            return false;
        }

        Set<String> studentSkills = convertToSet(studentSkillsStr);
        Set<String> jobSkills = convertToSet(jobSkillsStr);

        // Student must have all required skills
        return studentSkills.containsAll(jobSkills);
    }

    
     //Utility method: converts comma-separated skills to lowercase set
     
    private Set<String> convertToSet(String skills) {

        Set<String> skillSet = new HashSet<>();

        String[] arr = skills.toLowerCase().split(",");

        for (String skill : arr) {
            skillSet.add(skill.trim());
        }

        return skillSet;
    }
}









/*

 
*/