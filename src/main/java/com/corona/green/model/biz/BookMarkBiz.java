package com.corona.green.model.biz;

import java.util.List;

import com.corona.green.model.dto.BookMarkDto;

public interface BookMarkBiz {

	public List<BookMarkDto> selectList(String id);
	public int delete(BookMarkDto dto);
}
