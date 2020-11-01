package com.corona.green.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.corona.green.model.dto.LogDto;

@Repository
public class LogDaoImpl implements LogDao {

	Logger logger = LoggerFactory.getLogger(LogDaoImpl.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int LogEnter(LogDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "enter", dto);
		} catch (Exception e) {
			logger.info("ERROE LOGENTERINSERT");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int LogOut(LogDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "out", dto);
		} catch (Exception e) {
			logger.info("ERROR LOGOUTUPDATE");
			e.printStackTrace();
		}
		return res;
	}
}
