package com.baway.pojo;

public class Email {
	private Integer id;
	private String fname;
	private String status;
	private String title;
	private String date;
	public Email() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Email(Integer id, String fname, String status, String title,
			String date) {
		super();
		this.id = id;
		this.fname = fname;
		this.status = status;
		this.title = title;
		this.date = date;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}
