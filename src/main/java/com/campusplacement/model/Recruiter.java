package com.campusplacement.model;

public class Recruiter {
	    private int recruiterId;
	    private int userId;
	    private String companyName;
	    private String hrName;
	    private String email;
	    private String phone;
		public Recruiter(int recruiterId, int userId, String companyName, String hrName, String email, String phone) {
			super();
			this.recruiterId = recruiterId;
			this.userId = userId;
			this.companyName = companyName;
			this.hrName = hrName;
			this.email = email;
			this.phone = phone;
		}
		public Recruiter() {
			// TODO Auto-generated constructor stub
		}
		public int getRecruiterId() {
			return recruiterId;
		}
		public void setRecruiterId(int recruiterId) {
			this.recruiterId = recruiterId;
		}
		public int getUserId() {
			return userId;
		}
		public void setUserId(int userId) {
			this.userId = userId;
		}
		public String getCompanyName() {
			return companyName;
		}
		public void setCompanyName(String companyName) {
			this.companyName = companyName;
		}
		public String getHrName() {
			return hrName;
		}
		public void setHrName(String hrName) {
			this.hrName = hrName;
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
	    
	    
	    
}
