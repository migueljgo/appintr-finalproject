package com.benilde.finalproject.Model;

public class UserBean {
	private String firstname;
	private String lastname;
	private String username;
	private String password;
	private String role;
	
	public UserBean() {}
	
	public UserBean(String firstname, String lastname, String username, String role) {
		this.firstname = firstname;
		this.lastname = lastname;
		this.username = username;
		this.role = role;
	}
	
	public String getFirstname() {
		return firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getUsername() {
		return username;
	}
	public String getPassword() {
		return password;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
