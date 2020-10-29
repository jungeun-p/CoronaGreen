package com.corona.green.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.corona.green.model.dto.NewsDto;

@Repository
public class NewsDaoImpl implements NewsDao {

	Logger logger = LoggerFactory.getLogger(NewsDaoImpl.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<NewsDto> bookmarkList(String id) {
		List<NewsDto> list = new ArrayList<NewsDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "bookmarklist",id);
		} catch (Exception e) {
			logger.info("ERROR NEWSLIST");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int bookmarkCheck(String id, String link) {
		int res = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("link", link);
		try {
			res = sqlSession.selectOne(NAMESPACE + "check", map);
		} catch (Exception e) {
			logger.info("ERROR BOOKMARKCHECK");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int bookmarkInert(NewsDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			logger.info("ERROR BOOKMARKINSERT");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int bookmarkDelete(NewsDto dto) {
int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "delete", dto);
		} catch (Exception e) {
			logger.info("ERROR BOOKMARKDELETE");
			e.printStackTrace();
		}
		return res;
	}
}
