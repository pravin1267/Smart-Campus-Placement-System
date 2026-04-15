package com.campusplacement.model;

public class Job {

    private int jobId;
    private int recruiterId;
    private String description;
    private double minCgpa;
    private String requiredSkills;
    private String lastDate;
    private String companyName;
    private int jobCount;
    private String jobRole;
    
    
    public int getJobCount() {
		return jobCount;
	}

	public void setJobCount(int jobCount) {
		this.jobCount = jobCount;
	}

	public Job() {
    }

    public Job(int jobId, int recruiterId, String description, double minCgpa, String requiredSkills, String lastDate) {
        this.jobId = jobId;
        this.recruiterId = recruiterId;
        this.description = description;
        this.minCgpa = minCgpa;
        this.requiredSkills = requiredSkills;
        this.lastDate = lastDate;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public int getRecruiterId() {
        return recruiterId;
    }

    public void setRecruiterId(int recruiterId) {
        this.recruiterId = recruiterId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getMinCgpa() {
        return minCgpa;
    }

    public void setMinCgpa(double minCgpa) {
        this.minCgpa = minCgpa;
    }

    public String getRequiredSkills() {
        return requiredSkills;
    }

    public void setRequiredSkills(String requiredSkills) {
        this.requiredSkills = requiredSkills;
    }

    public String getLastDate() {
        return lastDate;
    }

    public void setLastDate(String lastDate) {
        this.lastDate = lastDate;
    }

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getJobRole() {
		return jobRole;
	}

	public void setJobRole(String jobRole) {
		this.jobRole = jobRole;
	}
    
}
