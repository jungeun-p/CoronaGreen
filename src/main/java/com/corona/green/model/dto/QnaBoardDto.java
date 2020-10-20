package com.corona.green.model.dto;

import java.util.Date;

public class QnaBoardDto {
	
	private String id;
	private int boardno;
	private String title;
	private String content;
	private Date regdate;
	private String secret;
	
	public QnaBoardDto() {
		
	}
	
	public QnaBoardDto(String id, int boardno, String title, String content, Date regdate, String secret) {
		this.id = id;
		this.boardno = boardno;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.secret = secret;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	
	

}
