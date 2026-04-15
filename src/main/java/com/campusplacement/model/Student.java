package com.campusplacement.model;

public class Student {
	private int studentId;
    private int userId;
    private String fullName;
    private String branch;
    private double cgpa;
    private String skills;
    private String email;
    private String phone;
    private String resumePath;
    private String profileImage;
    
    public Student(int studentId, int userId, String fullName, String branch, double cgpa, String skills, String email,
			String phone, String resumePath) {
		super();
		this.studentId = studentId;
		this.userId = userId;
		this.fullName = fullName;
		this.branch = branch;
		this.cgpa = cgpa;
		this.skills = skills;
		this.email = email;
		this.phone = phone;
		this.resumePath = resumePath;
	}
    
	public Student() {
		
	}

	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getFullName() {
		return fullName;
	}
	
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public double getCgpa() {
		return cgpa;
	}
	public void setCgpa(double cgpa) {
		this.cgpa = cgpa;
	}
	public String getSkills() {
		return skills;
	}
	public void setSkills(String skills) {
		this.skills = skills;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getResumePath() {
		return resumePath;
	}
	public void setResumePath(String resumePath) {
		this.resumePath = resumePath;
	}
    
	public String getProfileImage() {
	    return profileImage;
	}

	public void setProfileImage(String profileImage) {
	    this.profileImage = profileImage;
	}
}
