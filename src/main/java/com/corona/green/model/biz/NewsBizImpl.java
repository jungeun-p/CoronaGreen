package com.corona.green.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.corona.green.model.dao.NewsDao;
import com.corona.green.model.dto.NewsDto;

@Service
public class NewsBizImpl implements NewsBiz {

	@Autowired
	private NewsDao dao;

	@Override
	public List<NewsDto> bookmarkList(String id) {
		// TODO Auto-generated method stub
		return dao.bookmarkList(id);
	}

	@Override
	public int bookmarkCheck(String id, String link) {
		// TODO Auto-generated method stub
		return dao.bookmarkCheck(id, link);
	}

	@Override
	public int bookmarkInert(NewsDto dto) {
		// TODO Auto-generated method stub
		return dao.bookmarkInert(dto);
	}

	@Override
	public int bookmarkDelete(NewsDto dto) {
		// TODO Auto-generated method stub
		return dao.bookmarkDelete(dto);
	}
}
