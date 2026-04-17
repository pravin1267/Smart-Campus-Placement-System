package com.campusplacement.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String host = System.getenv("MYSQLHOST");
            String port = System.getenv("MYSQLPORT");
            String db   = System.getenv("MYSQLDATABASE");
            String user = System.getenv("MYSQLUSER");
            String pwd  = System.getenv("MYSQLPASSWORD");

            // ✅ Add this null check
            if (host == null || port == null || db == null || user == null || pwd == null) {
                System.out.println("❌ ERROR: One or more env variables are NULL!");
                System.out.println("MYSQLHOST=" + host);
                System.out.println("MYSQLPORT=" + port);
                System.out.println("MYSQLDATABASE=" + db);
                System.out.println("MYSQLUSER=" + user);
                return null;
            }

            String URL = "jdbc:mysql://" + host + ":" + port + "/" + db
                       + "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

            System.out.println("✅ Connecting to: " + URL);
            return DriverManager.getConnection(URL, user, pwd);

        } catch (Exception e) {
            System.out.println("❌ DB Connection Failed: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
}