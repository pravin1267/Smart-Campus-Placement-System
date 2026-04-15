package com.campusplacement.model;

public class Application {

    private int appId;
    private int studentId;
    private int jobId;
    private String applyDate;
    private String status;
    private String companyName;
    private String jobDescription;
    
    public Application() {
    }

    public Application(int appId, int studentId, int jobId, String applyDate, String status) {
        this.appId = appId;
        this.studentId = studentId;
        this.jobId = jobId;
        this.applyDate = applyDate;
        this.status = status;
    }

    public int getAppId() {
        return appId;
    }

    public void setAppId(int appId) {
        this.appId = appId;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public String getApplyDate() {
        return applyDate;
    }

    public void setApplyDate(String applyDate) {
        this.applyDate = applyDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getJobDescription() {
		return jobDescription;
	}

	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}
    
    
}
