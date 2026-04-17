package com.campusplacement.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	private static final String URL =
		    "jdbc:mysql://" + System.getenv("MYSQLHOST") + ":" +
		    System.getenv("MYSQLPORT") + "/" +
		    System.getenv("MYSQL_DATABASE") +
		    "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

		private static final String USER = System.getenv("MYSQLUSER");
		private static final String PWD = System.getenv("MYSQLPASSWORD");

	public static Connection getConnection() {
		try {
			return DriverManager.getConnection(URL, USER, PWD);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
