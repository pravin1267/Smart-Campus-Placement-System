package com.campusplacement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.campusplacement.model.Application;


public class ApplicationDAO {
    public boolean applyForJob(int studentId, int jobId) {
    	
    	  String sql = "INSERT INTO applications (student_id, job_id, apply_date, status)\r\n"
    	  		+ "VALUES (?, ?, CURDATE(), 'APPLIED')";
    	  try(Connection con = DBConnection.getConnection();
    			  PreparedStatement ps = con.prepareStatement(sql);){
    		   ps.setInt(1, studentId);
    		   ps.setInt(2, jobId);
    		   return ps.executeUpdate() > 0;
    	  }
    	  catch(Exception e) {
    		  e.printStackTrace();
    	  }
    	
    	return false;
    }
    
    public List<Application> getApplicatonsByStudent(int studentId){
    	  List<Application> list = new ArrayList<>();
    	  String sql = "SELECT a.app_id, a.apply_date, a.status, j.description, r.company_name\r\n"
    	  		+ "FROM applications a JOIN jobs j ON a.job_id = j.job_id\r\n"
    	  		+ "JOIN recruiters r ON j.recruiter_id = r.recruiter_id WHERE a.student_id = ?;";
    	  try(Connection con = DBConnection.getConnection();
    			  PreparedStatement ps = con.prepareStatement(sql);){
    		  ps.setInt(1, studentId);
    		  ResultSet rs = ps.executeQuery();
    		  while(rs.next()) {
    			  Application app = new Application();
    			  
    			  app.setAppId(rs.getInt("app_id"));
    			  app.setApplyDate(rs.getString("apply_date"));
    			  app.setStatus(rs.getString("status"));

    			  app.setCompanyName(rs.getString("company_name"));
    			  app.setJobDescription(rs.getString("description"));
    			  
    			  list.add(app); 
    		  }
    	  } 
    	  catch(Exception e) {
    		  e.printStackTrace();
    	  }
    	  
    	  return list;
    }
    
    public boolean updateStatus (int appId , String status) {
    	 String sql = "UPDATE applications SET status = ? WHERE app_id = ?";
    	 
    	 try(Connection con = DBConnection.getConnection();
    			 PreparedStatement ps = con.prepareStatement(sql)){
    		 ps.setString(1, status);
    		 ps.setInt(2, appId);
    		 
    		 return ps.executeUpdate() > 0;
    	 }
    	 catch(Exception e) {
    		 e.printStackTrace();
    	 }
    	return false;
    }
    
    public int applicationCount(int student_id) {
    	   int count = 0;
    	   String sql = "SELECT COUNT(*) AS count\r\n"
    	   		+ "FROM applications a\r\n"
    	   		+ "JOIN jobs j ON a.job_id = j.job_id\r\n"
    	   		+ "JOIN recruiters r ON j.recruiter_id = r.recruiter_id\r\n"
    	   		+ "WHERE a.student_id = ?;";
    	   
    	    try(Connection con = DBConnection.getConnection();
    	    		PreparedStatement ps = con.prepareStatement(sql);){
    	    	    
    	    	    ps.setInt(1, student_id);
    	    	    ResultSet rs= ps.executeQuery();
    	    	    if(rs.next()) count = rs.getInt("count");
    	    }
    	    catch(Exception e) {
    	    	e.printStackTrace();
    	    }
    	   return count;
    }
    
    
 // ADD THIS METHOD (don't remove existing code)

    public List<Application> getApplicantsByRecruiter(int recruiterId) {
        List<Application> list = new ArrayList<>();

        String sql = "SELECT a.app_id, a.status, j.description, r.company_name "
                   + "FROM applications a "
                   + "JOIN jobs j ON a.job_id = j.job_id "
                   + "JOIN recruiters r ON j.recruiter_id = r.recruiter_id "
                   + "WHERE j.recruiter_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, recruiterId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Application app = new Application();

                app.setAppId(rs.getInt("app_id"));
                app.setStatus(rs.getString("status"));
                app.setCompanyName(rs.getString("company_name"));
                app.setJobDescription(rs.getString("description"));

                list.add(app);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    public int getApplicationCount() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM applications";

        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                count = rs.getInt(1);
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        return count;
    }
}
