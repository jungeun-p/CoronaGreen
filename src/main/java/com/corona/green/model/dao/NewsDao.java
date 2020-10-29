package com.corona.green.model.dao;

import java.util.List;

import com.corona.green.model.dto.NewsDto;


public interface NewsDao {

	String NAMESPACE = "news.";
	
	public List<NewsDto> bookmarkList(String id);
	public int bookmarkCheck(String id, String link);
	public int bookmarkInert(NewsDto dto);
	public int bookmarkDelete(NewsDto dto);
}
