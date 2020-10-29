package com.corona.green.model.dao;

import java.util.ArrayList;
import java.util.List;

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
}
