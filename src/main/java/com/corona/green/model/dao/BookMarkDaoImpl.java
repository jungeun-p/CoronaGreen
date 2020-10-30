package com.corona.green.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.corona.green.model.dto.BookMarkDto;

@Repository
public class BookMarkDaoImpl implements BookMarkDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	Logger logger = LoggerFactory.getLogger(BookMarkDaoImpl.class);

	@Override
	public List<BookMarkDto> selectList(String id) {
		List<BookMarkDto> list = new ArrayList<BookMarkDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "list",id);
		} catch (Exception e) {
			logger.info("ERROR BOOKMARKLIST");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int delete(BookMarkDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "delete", dto);
		} catch (Exception e) {
			logger.info("ERROR BOOKMARKDELETE");
			e.printStackTrace();
		}
		return res;
	}
}
