package com.campusplacement.model;

public class Interview {

    private int interviewId;
    private int appId;
    private String interviewDate;
    private String interviewTime;
    private String mode;
    private String result;
    private String companyName;
    private String Role;
    
    

    public Interview() {
    }

    public Interview(int interviewId, int appId, String interviewDate, String interviewTime, String mode, String result) {
        this.interviewId = interviewId;
        this.appId = appId;
        this.interviewDate = interviewDate;
        this.interviewTime = interviewTime;
        this.mode = mode;
        this.result = result;
        
    }

    public int getInterviewId() {
        return interviewId;
    }

    public void setInterviewId(int interviewId) {
        this.interviewId = interviewId;
    }

    public int getAppId() {
        return appId;
    }

    public void setAppId(int appId) {
        this.appId = appId;
    }

    public String getInterviewDate() {
        return interviewDate;
    }

    public void setInterviewDate(String interviewDate) {
        this.interviewDate = interviewDate;
    }

    public String getInterviewTime() {
        return interviewTime;
    }

    public void setInterviewTime(String interviewTime) {
        this.interviewTime = interviewTime;
    }

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String company_name) {
		this.companyName = company_name;
	}

	public String getRole() {
		return Role;
	}

	public void setRole(String role) {
		Role = role;
	}
    
    
}
