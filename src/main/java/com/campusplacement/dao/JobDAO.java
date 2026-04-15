package com.campusplacement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.campusplacement.model.Job;

public class JobDAO {
    public boolean addJobs(Job job) {
    	 String sql = "INSERT INTO jobs (recruiter_id,description,min_cgpa,required_skills,last_date,role) VALUES(?,?,?,?,?,?)";
    	 
    	 try(Connection con = DBConnection.getConnection();
    			 PreparedStatement ps = con.prepareStatement(sql)){
    		     ps.setInt(1, job.getRecruiterId());
    		     ps.setString(2,job.getDescription());
    		     ps.setDouble(3, job.getMinCgpa());
    		     ps.setString(4, job.getRequiredSkills());
    		     ps.setString(5, job.getLastDate());
    		     ps.setString(6, job.getJobRole());    		    
    		     
    		     return ps.executeUpdate() > 0 ;
    		     
    	 }
    	 catch(Exception e) {
    		 e.printStackTrace();
    	 }
    	return false;
    }
    public List<Job> getAllJobs(){
 
    	  List<Job> list = new ArrayList<>();
    	  String sql = "SELECT r.company_name, j.* FROM jobs j " +
    	             "JOIN recruiters r ON j.recruiter_id = r.recruiter_id " +
    	             "WHERE j.last_date >= CURRENT_DATE()";
    	  String countQry = "SELECT COUNT(*) as count FROM jobs";
    	  
    	  try(Connection con = DBConnection.getConnection();
    			  PreparedStatement ps = con.prepareStatement(sql);
    			  PreparedStatement ps1 = con.prepareStatement(countQry);){
    		  
    		  ResultSet rs = ps.executeQuery();
    		  ResultSet countRs = ps1.executeQuery();

    		  if(countRs.next()){
    		      int count = countRs.getInt("count");
    		  }
    		  new Job().setJobCount(countRs.getInt("count"));
    		  while(rs.next()) {
    			  
    			  Job job = new Job();
    			  
    			  job.setJobId(rs.getInt("job_id"));
    			  job.setRecruiterId(rs.getInt("recruiter_id"));
    			  job.setMinCgpa(rs.getDouble("min_cgpa"));
    			  job.setLastDate(rs.getString("last_date"));
    			  job.setDescription(rs.getString("description"));
    			  job.setRequiredSkills(rs.getString("required_skills"));
    			  job.setCompanyName(rs.getString("company_name"));
    			  job.setJobRole(rs.getString("role"));
    			  list.add(job);
    		  }
    	  }
    	  catch(Exception e) {
    		  e.printStackTrace();
    	  }
    	  
    	  return list;
    }
    
    public int getJobCount(){
          
    	String sql = "SELECT count(*) count from jobs;"; 
        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)){
            
            ResultSet rs = ps.executeQuery();

            if(rs.next()){
            	
                return rs.getInt("count");
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return 0;
    }
    
    public Job getJobById(int jobId) {
    	String sql = "SELECT j.job_id,j.role,j.description,j.min_cgpa,j.required_skills,r.company_name FROM jobs j JOIN recruiters r ON j.recruiter_id = r.recruiter_id WHERE j.job_id = ?";
       
    	Job job = null;
    	
    	try(Connection con = DBConnection.getConnection();
    		PreparedStatement ps = con.prepareStatement(sql);){
    		ps.setInt(1, jobId);
    		ResultSet rs = ps.executeQuery();
    		
    		while(rs.next()) {
    			job= new Job();
    		    job.setCompanyName(rs.getString("company_name"));
    		    job.setJobRole(rs.getString("role"));
    		    job.setDescription(rs.getString("description"));
    		    job.setMinCgpa(rs.getDouble("min_cgpa"));
    		    job.setRequiredSkills(rs.getString("required_skills"));
    		    job.setJobId(rs.getInt("job_id"));
    		}
    	}
    	catch(SQLException se) {
    		se.printStackTrace();
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	return job;
    }
    
    public List<Job> getJobsByRecruiter(int recruiterId) {

	    List<Job> list = new ArrayList<>();

	    String sql = "SELECT * FROM jobs WHERE recruiter_id = ?";

	    try (Connection con = DBConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {

	        ps.setInt(1, recruiterId);

	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {

	            Job job = new Job();

	            job.setJobId(rs.getInt("job_id"));
	            job.setRecruiterId(rs.getInt("recruiter_id"));
	            job.setDescription(rs.getString("description"));
	            job.setRequiredSkills(rs.getString("required_skills"));
	            job.setMinCgpa(rs.getDouble("min_cgpa"));
	            job.setLastDate(rs.getString("last_date"));

	            list.add(job);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}

    
    
    public void deleteExpiredJobs() {
        String sql = "DELETE FROM jobs WHERE last_date < CURRENT_DATE()";
        
        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)){

            ps.executeUpdate();

        } catch(Exception e){
            e.printStackTrace();
        }
    }
    
    
    public void deleteJobs(int recruitersId) {
    	String sql = "SELECT job_id FROM jobs WHERE recruiters_id = ?;";
        String sql1 = "DELETE FROM applications WHERE job_id = ?;";
        String sql2 = "DELETE FROM jobs WHERE job_id = ?;";
        int job_id=-1;
        
        try(Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)){
                ps.setInt(1, recruitersId );
               ResultSet rs =  ps.executeQuery();
               if(rs.next()) job_id = rs.getInt("job_id");

            } catch(Exception e){
                e.printStackTrace();
            }
            
        
        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql1)){
            ps.setInt(1, job_id);
            ps.executeUpdate();

        } catch(Exception e){
            e.printStackTrace();
        }
        
        try(Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql2)){
                ps.setInt(1, job_id);
                ps.executeUpdate();

            } catch(Exception e){
                e.printStackTrace();
            }
    }
    
    public boolean deleteJob(int jobId) {

        String sql = "DELETE FROM jobs WHERE job_id = ?";

        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, jobId);
            return ps.executeUpdate() > 0;

        } catch(Exception e){
            e.printStackTrace();
        }

        return false;
    }
}
