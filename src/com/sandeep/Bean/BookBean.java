package com.sandeep.Bean;

public class BookBean {

	private String Call,Name,Author,Publisher;
	private int Quantity,Issued;
	
	public BookBean() {
		super();
	}
	public BookBean(String Call,String Name,String Author,String Publisher,int Quantity) {
		
		this.Call=Call;
		this.Name=Name;
		this.Author=Author;
		this.Publisher=Publisher;
		this.Quantity=Quantity;
	}
	
	public void setCall(String Call) {
		this.Call=Call;
	}
	public String getCall() {
		return Call;
	}
	
	public void setName(String Name) {
		this.Name=Name;
	}
	public String getName() {
		return Name;
	}
	
	public void setAuthor(String Author) {
		this.Author=Author;
	}
	public String getAuthor() {
		return Author;
	}
	
	public void setPublisher(String Publisher) {
		this.Publisher=Publisher;
	}
	public String getPublisher() {
		return Publisher;
	}
	public void setQuantity(int Quantity) {
		this.Quantity=Quantity;
	}
	public int getQuantity() {
		return Quantity;
	}
	
	public void setIssued(int Issued) {
		this.Issued=Issued;
	}
	public int getIssued() {
		return Issued;
	}
	
	
	
	
	
}
