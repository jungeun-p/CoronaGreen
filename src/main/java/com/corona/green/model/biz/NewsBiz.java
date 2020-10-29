package com.corona.green.model.biz;

import java.util.List;

import com.corona.green.model.dto.NewsDto;

public interface NewsBiz {

	public List<NewsDto> bookmarkList(String id);
}
