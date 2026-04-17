package com.campusplacement.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	public static Connection getConnection() {
	    try {
	        String url = "jdbc:mysql://" 
	            + System.getenv("MYSQLHOST") + ":" 
	            + System.getenv("MYSQLPORT") + "/" 
	            + System.getenv("MYSQLDATABASE") 
	            + "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

<<<<<<< HEAD
    public static Connection getConnection() {
        try {
            // Load JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Get values from environment variables
            String URL = "jdbc:mysql://" 
                + System.getenv("MYSQLHOST") + ":" 
                + System.getenv("MYSQLPORT") + "/" 
                + System.getenv("MYSQLDATABASE") 
                + "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

            String USER = System.getenv("MYSQLUSER");
            String PWD  = System.getenv("MYSQLPASSWORD");

            // Debug logs (optional)
            System.out.println("JDBC URL: " + URL);
            System.out.println("USER: " + USER);

            return DriverManager.getConnection(URL, USER, PWD);
=======
	        String user = System.getenv("MYSQLUSER");
	        String pwd  = System.getenv("MYSQLPASSWORD");

	        // ✅ FIXED
	        System.out.println("JDBC URL: " + url);
	        System.out.println("USER: " + user);

	        Class.forName("com.mysql.cj.jdbc.Driver");
	        return DriverManager.getConnection(url, user, pwd);
>>>>>>> 891f63d (Fixed DB connection debug)

	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	
    }
}