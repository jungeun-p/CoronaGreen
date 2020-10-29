package com.corona.green.model.dao;

import java.util.List;

import com.corona.green.model.dto.NewsDto;


public interface NewsDao {

	String NAMESPACE = "news.";
	
	public List<NewsDto> bookmarkList(String id);
}
