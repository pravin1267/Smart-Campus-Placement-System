package com.campusplacement.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
     private static final String URL= "jdbc:mysql://localhost:3306/campus_placement_db";
     private static final String USER = "root";
     private static final String PWD = "root";
     private static final String JDBC_DRIVER ="com.mysql.cj.jdbc.Driver";
     
     public static Connection getConnection() {
    	     Connection con = null;
    	     
    	     try {
    	    	 Class.forName(JDBC_DRIVER);
    	    	 con = DriverManager.getConnection(URL,USER,PWD);
    	     System.out.println("Database Connected Successfully ");
    	     }
    	     catch(SQLException se) {
    	    	  se.printStackTrace();
    	     }
    	     catch(Exception e) {
    	    	 e.printStackTrace();
    	     }
    	     return con;
    	     
     }
}
