package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.Bean.Jobs;
import com.Bean.User;

public class User_Dao {

	private Connection conn=null;
	

	public User_Dao(Connection conn) {
		super();
		this.conn = conn;
	}




	public boolean adduser(User u) {
		boolean f=false;
		
		try {
			String sql="insert into userdetails(name,email,password,qulification,role) values(?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			ps.setString(4, u.getQulification());
			ps.setString(5, "User");
			
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		
		return f;
		
	}
	
	public User login(String em,String ps) {
		User u=null;
		
		try {
			String sql="Select * from userdetails where email=? and password=?";
			
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, em);
			pst.setString(2, ps);
			ResultSet rs=pst.executeQuery();
			
			while(rs.next()) {
				u=new User();
				
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
				u.setQulification(rs.getString(5));
				u.setRole(rs.getString(6));
				
				
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return u;
		
	}
	
	public boolean Updateuser(User u) {
		boolean f=false;
		
		try {
			String sql="update userdetails set name=?,email=?,password=?,qulification=? where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			ps.setString(4, u.getQulification());
			ps.setInt(5, u.getId());
			
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		
		return f;
		
	}
	
}
