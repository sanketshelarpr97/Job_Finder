package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {

	
	private static Connection con;
	
	public static Connection getConn() {
		
		String uname="root";
		String upass="Sanketpr@97";
		String driver="com.mysql.cj.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/job_portal";
		
		try {
			
			if(con==null) {
				
				Class.forName(driver);
				con=DriverManager.getConnection(url,uname,upass);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return con;
		
	}
}
