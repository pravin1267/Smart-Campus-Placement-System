package com.campusplacement.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	private static final String URL = "jdbc:mysql://interchange.proxy.rlwy.net:36473/railway"
			+ "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

	private static final String USER = "root";
	private static final String PWD = "xlotvwnlkYwCxkZyJYomlkFMiFPUMxqS";

	public static Connection getConnection() {
		try {
			return DriverManager.getConnection(URL, USER, PWD);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}