package com.corona.green.model.dto;

public class NewsDto {

	private int bookmarkno;
	private String id;
	private String link;
	private String img;
	private String title;
	private String content;

	public NewsDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NewsDto(int bookmarkno, String id, String link, String img, String title, String content) {
		super();
		this.bookmarkno = bookmarkno;
		this.id = id;
		this.link = link;
		this.img = img;
		this.title = title;
		this.content = content;
	}

	public int getBookmarkno() {
		return bookmarkno;
	}

	public void setBookmarkno(int bookmarkno) {
		this.bookmarkno = bookmarkno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
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

}
