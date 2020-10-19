package com.corona.green.model.dto;

import java.util.Date;

public class MemberDto {

	private String id;
	private String pw;
	private String phone;
	private String address;
	private String email;
	private String role;
	private String enabled;
	private Date regdate;

	public MemberDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberDto(String id, String pw, String phone, String address, String email, String role, String enabled,
			Date regdate) {
		super();
		this.id = id;
		this.pw = pw;
		this.phone = phone;
		this.address = address;
		this.email = email;
		this.role = role;
		this.enabled = enabled;
		this.regdate = regdate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

}
