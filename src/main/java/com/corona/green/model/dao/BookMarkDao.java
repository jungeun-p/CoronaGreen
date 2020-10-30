package com.corona.green.model.dao;

import java.util.ArrayList;
import java.util.List;

import com.corona.green.model.dto.BookMarkDto;

public interface BookMarkDao {

	String NAMESPACE = "bookmark.";
	
	public List<BookMarkDto> selectList(String id);
	public int delete(BookMarkDto dto);
}
