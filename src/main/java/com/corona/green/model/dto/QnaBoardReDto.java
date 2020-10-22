package com.corona.green.model.dto;

import java.util.Date;

public class QnaBoardReDto {
	
	private String boardno;
	private String content;
	private Date regdate;
	
	public QnaBoardReDto(){
		
	}

	public QnaBoardReDto(String boardno, String content, Date regdate) {
		this.boardno = boardno;
		this.content = content;
		this.regdate = regdate;
	}

	public String getBoardno() {
		return boardno;
	}

	public void setBoardno(String boardno) {
		this.boardno = boardno;
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
	
}
