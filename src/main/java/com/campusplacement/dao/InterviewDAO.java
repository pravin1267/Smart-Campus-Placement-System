package com.campusplacement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.campusplacement.model.Interview;
import com.mysql.cj.protocol.Resultset;

public class InterviewDAO {
    public boolean scheculeInterview(Interview interview) {
    	 String sql = "INSERT INTO interviews (app_id, interview_date, interview_time, mode) values(?,?,?,?) ";  
    	 
    	 try(Connection con = DBConnection.getConnection();
    			 PreparedStatement ps = con.prepareStatement(sql);){
    		 ps.setInt(1, interview.getAppId());
    		 ps.setString(2,interview.getInterviewDate());
    		 ps.setString(3, interview.getInterviewTime());
    		 ps.setString(4, interview.getMode());
    		 
    		 return ps.executeUpdate() > 0;
    	 }
    	 catch(Exception e) {
    		 e.printStackTrace();
    	 }
    	return false;
    }
    
    public List<Interview> getInterviewByStudent(int studentId){
    	    List<Interview> list = new ArrayList<>();
    	    String sql = "SELECT r.company_name, j.description, i.interview_date, i.interview_time, i.mode, i.result "
    	            + "FROM recruiters r "
    	            + "JOIN jobs j ON r.recruiter_id = j.recruiter_id "
    	            + "JOIN applications a ON a.job_id = j.job_id "
    	            + "JOIN interviews i ON i.app_id = a.app_id "
    	            + "WHERE a.student_id = ? AND "
    	            +  "(i.interview_date > CURRENT_DATE() "
    	            + "OR (i.interview_date = CURRENT_DATE() "
    	            + "AND i.interview_time > CURRENT_TIME()))";
    	    
    	    try(Connection con = DBConnection.getConnection();
    	    		PreparedStatement ps = con.prepareStatement(sql);){
    	    	    ps.setInt(1, studentId);
    	    	    ResultSet rs = ps.executeQuery();
    	    	    
    	    	    while(rs.next()) {
    	    	    	Interview interview = new Interview();
    	    	    interview.setInterviewDate(rs.getString("interview_date"));
    	    	    interview.setInterviewTime(rs.getString("interview_time"));
    	    	    interview.setMode(rs.getString("mode"));
    	    	    interview.setCompanyName(rs.getString("company_name"));
    	    	    interview.setRole(rs.getString("description"));
    	    	    interview.setResult(rs.getString("result"));
    	    	    
    	    	    list.add(interview);
    	    	    }
    	    }
    	    catch(Exception e) {
    	    	e.printStackTrace();
    	    }
    	    
    	    return list;
    }
    
    public boolean updateResult(int interviewId, String result) {
    String sql = "UPDATE interviews SET result = ? WHERE interview_id = ?";
    
    try(Connection con = DBConnection.getConnection();
    		PreparedStatement ps = con.prepareStatement(sql);){
    	    
    	   ps.setString(1, result);
    	   ps.setInt(2, interviewId);
    	   
    	   return ps.executeUpdate() > 0 ;
    }
    catch(Exception e) {
    	e.printStackTrace();
    }
    	return false;
    }
    
    public int getInterviewCount(int studentId) {
    	int count = 0;
    	
    	String sql = "SELECT COUNT(*) count "
    	           + "FROM recruiters r "
    	           + "JOIN jobs j ON r.recruiter_id = j.recruiter_id "
    	           + "JOIN applications a ON a.job_id = j.job_id "
    	           + "JOIN interviews i ON i.app_id = a.app_id "
    	           + "WHERE a.student_id = ? AND "
    	           + "(i.interview_date > CURRENT_DATE() "
    	           + "OR (i.interview_date = CURRENT_DATE() AND i.interview_time > CURRENT_TIME()))";
    	      	      
   
    	try(Connection con = DBConnection.getConnection();
    	    PreparedStatement ps = con.prepareStatement(sql)){
    		ps.setInt(1, studentId);
    		ResultSet rs = ps.executeQuery();
    		if(rs.next()) {
    			count = rs.getInt("count");
    		}
    	}
    	catch(SQLException e) {
    		e.printStackTrace();
    	}
    	
    	
    	return count;
    }
    
    
    public List<Interview> getInterviewByRecruiter(int recruiterId) {

        List<Interview> list = new ArrayList<>();

        String sql = "SELECT i.interview_date, i.interview_time, i.mode, i.result, j.description, r.company_name "
                   + "FROM interviews i "
                   + "JOIN applications a ON i.app_id = a.app_id "
                   + "JOIN jobs j ON a.job_id = j.job_id "
                   + "JOIN recruiters r ON j.recruiter_id = r.recruiter_id "
                   + "WHERE r.recruiter_id = ?";

        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, recruiterId);
            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                Interview in = new Interview();

                in.setInterviewDate(rs.getString("interview_date"));
                in.setInterviewTime(rs.getString("interview_time"));
                in.setMode(rs.getString("mode"));
                in.setResult(rs.getString("result"));
                in.setCompanyName(rs.getString("company_name"));
                in.setRole(rs.getString("description"));

                list.add(in);
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }
}
