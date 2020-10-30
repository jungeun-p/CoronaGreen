package com.corona.green.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.corona.green.model.dao.BookMarkDao;
import com.corona.green.model.dto.BookMarkDto;

@Service
public class BookMarkBizImpl implements BookMarkBiz {

	@Autowired
	private	BookMarkDao dao;

	@Override
	public List<BookMarkDto> selectList(String id) {
		// TODO Auto-generated method stub
		return dao.selectList(id);
	}

	@Override
	public int delete(BookMarkDto dto) {
		// TODO Auto-generated method stub
		return dao.delete(dto);
	}
}
