package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Bean.Jobs;

public class Add_Job_Dao {
	
	
	private Connection con;

	public Add_Job_Dao(Connection con) {
		super();
		this.con = con;
	}
	
	
	public  boolean addjob(Jobs j) {
		
		boolean f=false;
		
		try {
			
			String sql="insert into job(title,description,category,status,location) values(?,?,?,?,?)";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getStatus());
			ps.setString(5, j.getLocation());
			
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
		
		return f;
	
	}
	
	
	public List<Jobs> getjob(){
		
		List<Jobs> jl=new ArrayList<Jobs>();
		Jobs n=null;
		try {
			String sql="Select * from job order by id desc";
			
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				n=new Jobs();
				
				n.setId(rs.getInt(1));
				n.setTitle(rs.getString(2));
				n.setDescription(rs.getString(3));
				n.setCategory(rs.getString(4));
				n.setStatus(rs.getString(5));
				n.setLocation(rs.getString(6));
				n.setPdate(rs.getTimestamp(7)+"");
				jl.add(n);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return jl;
		
	}
	
	
public Jobs getjobbyId(int id){
		
		Jobs n=null;
		try {
			String sql="Select * from job where id=? ";
			
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				n=new Jobs();
				
				n.setId(rs.getInt(1));
				n.setTitle(rs.getString(2));
				n.setDescription(rs.getString(3));
				n.setCategory(rs.getString(4));
				n.setStatus(rs.getString(5));
				n.setLocation(rs.getString(6));
				n.setPdate(rs.getTimestamp(7)+"");
				
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return n;
		
	}
	
	
public  boolean updatejob(Jobs j) {
	
	boolean f=false;
	
	try {
		
		String sql="update job set title=?,description=?,category=?,status=?,location=? where id=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, j.getTitle());
		ps.setString(2, j.getDescription());
		ps.setString(3, j.getCategory());
		ps.setString(4, j.getStatus());
		ps.setString(5, j.getLocation());
		ps.setInt(6, j.getId());
		
		int i=ps.executeUpdate();
		
		if(i==1) {
			f=true;
		}
		
	}
	catch(Exception e) {
		e.printStackTrace();
		
	}
	
	return f;

}


public boolean deletejob(int id) {
	
	boolean f=false;
	
	
	try {
		String sql="delete from job  where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		
    int i=ps.executeUpdate();
		
		if(i==1) {
			f=true;
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return f;
	
}


	public List<Jobs> getalljob(){
		
		
		List<Jobs> lj=new ArrayList<Jobs>();
		Jobs j=null;
		try {
			String sql="Select * from job where status=? order by id desc";
			
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, "1");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				j=new Jobs();
				
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+"");
				lj.add(j);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return lj;
	}

}
