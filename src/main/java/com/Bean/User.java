package com.Bean;

public class User {

	private int id;
	private String name;
	private String email;
	private String qulification;
	private String password;
	private String role;
	
	
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User( String name, String email, String qulification, String password, String role) {
		super();
		
		this.name = name;
		this.email = email;
		this.qulification = qulification;
		this.password = password;
		this.role = role;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getQulification() {
		return qulification;
	}

	public void setQulification(String qulification) {
		this.qulification = qulification;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
	
	
	
}
