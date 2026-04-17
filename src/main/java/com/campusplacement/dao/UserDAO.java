package com.campusplacement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.campusplacement.model.User;



public class UserDAO {
   public User login(String username , String password) {
	   User user = null;
	   String sql = "SELECT * FROM users WHERE username = ? AND BINARY password = ? AND status = 'ACTIVE'";
	   try(Connection con = DBConnection.getConnection();
		   PreparedStatement ps =con.prepareStatement(sql);){
		   ps.setString(1, username);
		   ps.setString(2, password);
		   ResultSet rs = ps.executeQuery();
		   System.out.println("login successfull");
		   while(rs.next()) {
			   user = new User();
			   user.setUserId(rs.getInt(1));
			   user.setUsername(rs.getString(2));
			   user.setPassword(rs.getString(3));
			   user.setRole(rs.getString(4));
			   user.setStatus(rs.getString(5));
		   }
 	   }
       catch(Exception e) {
    	   e.printStackTrace();
       }
	   return user ;
   }
   
   public User getUserByEmail(String email) {
	   
	   
	   String qry = "SELECT * from users WHERE username = ?";
	   
	   try(Connection con = DBConnection.getConnection();
			   PreparedStatement ps = con.prepareStatement(qry);){
		       
		   ps.setString(1,email);
		   
		  ResultSet rs = ps.executeQuery();
		  
		  while(rs.next()) {
			  User user = new User();
			  user.setUserId(rs.getInt("user_id"));
			  user.setPassword(rs.getString("password"));
			  user.setRole(rs.getString("role"));
			  user.setStatus(rs.getString("status"));
			  user.setUsername(rs.getString("username"));
              
			  return user;
			  
		  }
	   }
	   catch(Exception e) {
		   e.printStackTrace();
	   }
	   
	   return null;
   }


   public boolean updatePassword(Integer userId, String newPassword) {
	     
	     int id = userId;
	     String sql = "UPDATE users SET password = ? WHERE user_id = ?";
	     System.out.println("the new Password is "+newPassword);
	     try(Connection con = DBConnection.getConnection();
	    		 PreparedStatement ps =con.prepareStatement(sql);){
	    	     System.out.println("Password changing..........");
	    	     ps.setString(1, newPassword);
	    	     ps.setInt(2, id);
	    	   
	    	     if(ps.executeUpdate() > 0) {
	    	    	   System.out.println("password changed successfully");
	    	    	   return true;	
	    	     }
	     }
	     catch(SQLException se) {
	    	 se.printStackTrace();
	     }
	     catch(Exception e) {
	    	 e.printStackTrace();
	     }
	   
	     return false; 
   }
   
   public int registerUser(String username, String password, String role) {

	    int userId = 0;

	    String sql = "INSERT INTO users(username, password, role, status) VALUES (?, ?, ?, ?)";

	    try(Connection con = DBConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

	        ps.setString(1, username);
	        ps.setString(2, password);
	        ps.setString(3, role);
	        ps.setString(4, "PENDING");

	        ps.executeUpdate();

	        ResultSet rs = ps.getGeneratedKeys();

	        if(rs.next()){
	            userId = rs.getInt(1);
	        }

	    } catch(Exception e){
	        e.printStackTrace();
	    }

	    return userId;
	}
   
   
   public List<User> getPendingUsers() {

	    List<User> list = new ArrayList<>();

	    String sql = "SELECT * FROM users WHERE status = 'PENDING'";

	    try(Connection con = DBConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement(sql);
	        ResultSet rs = ps.executeQuery()) {

	        while(rs.next()){
	            User u = new User();

	            u.setUserId(rs.getInt("user_id"));
	            u.setUsername(rs.getString("username"));
	            u.setRole(rs.getString("role"));

	            list.add(u);
	        }

	    } catch(Exception e){
	        e.printStackTrace();
	    }

	    return list;
	}
   
   
   public boolean updateStatus(int userId, String status) {

	    String sql = "UPDATE users SET status=? WHERE user_id=?";

	    try(Connection con = DBConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement(sql)) {

	        ps.setString(1, status);
	        ps.setInt(2, userId);

	        return ps.executeUpdate() > 0;

	    } catch(Exception e){
	        e.printStackTrace();
	    }

	    return false;
	}
   
}
