package com.corona.green.model.dto;

import java.util.Date;

public class LogDto {

	private int logno;
	private String sessionid;
	private String id;
	private Date enter;
	private Date out;

	public LogDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LogDto(int logno, String sessionid, String id, Date enter, Date out) {
		super();
		this.logno = logno;
		this.sessionid = sessionid;
		this.id = id;
		this.enter = enter;
		this.out = out;
	}

	public int getLogno() {
		return logno;
	}

	public void setLogno(int logno) {
		this.logno = logno;
	}

	public String getSessionid() {
		return sessionid;
	}

	public void setSessionid(String sessionid) {
		this.sessionid = sessionid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getEnter() {
		return enter;
	}

	public void setEnter(Date enter) {
		this.enter = enter;
	}

	public Date getOut() {
		return out;
	}

	public void setOut(Date out) {
		this.out = out;
	}

}