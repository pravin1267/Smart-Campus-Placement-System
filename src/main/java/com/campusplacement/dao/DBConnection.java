package com.campusplacement.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

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

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
