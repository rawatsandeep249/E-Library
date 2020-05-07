package com.sandeep.Bean;

public class LibrarianBean {

	private int Id;
	private String name,email,password;
	private long mobile;
	
	public LibrarianBean() {}
	
	public LibrarianBean(int Id,String name, String email,String password ,long mobile) {
		super();
		this.Id=Id;
		this.name=name;
		this.email=email;
		this.password=password;
		this.mobile=mobile;	
		
	}
	
	public LibrarianBean(String name, String email,String password ,long mobile) {
		super();
		this.name=name;
		this.email=email;
		this.password=password;
		this.mobile=mobile;	
		
	}
	
	public int getId() {
		return Id;
	}	
	public void setId(int id) {
		this.Id=id;
	}	
	public void setName(String name) {
		this.name=name;
	}
	public String getName() {
		return name;
	}
	public void setEmail(String email) {
		this.email=email;
	}
	public String getEmail() {
		return email;
	}
	public void setPassword(String password) {
		this.password=password;
	}
	public String getPassword() {
		return password;
	}
	public void setMobile(long mobile) {
		this.mobile=mobile;
	}
	public long getMobile() {
		return mobile;
	}
	
	
}

