package com.corona.green.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.corona.green.controller.QnaBoardController;
import com.corona.green.model.dto.QnaBoardReDto;

@Repository
public class QnaBoardReDaoImpl implements QnaBoardReDao {

	Logger logger = LoggerFactory.getLogger(QnaBoardController.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public QnaBoardReDto selectOne(int boardno) {
		
		QnaBoardReDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", boardno);
		} catch (Exception e) {
			logger.info("[ERROR SelectOne]");
			e.printStackTrace();
		}
		
		return dto;
		
	}

	@Override
	public int insert(QnaBoardReDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
		} catch (Exception e) {
			logger.info("[ERROR insert]");
			e.printStackTrace();
		}
		
		return res;
		
	}

	@Override
	public int alarmInsert(HashMap<String, Object> map) {
		int res=0;
		
		try {
			res=sqlSession.insert(NAMESPACE+"alarmInsert",map);
		} catch (Exception e) {
			logger.info("[ERROR alarmInsert]");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int alarmUpdate(String alarm_boardno) {
		int res=0;
		try {
			res=sqlSession.update(NAMESPACE+"alarmUpdate",alarm_boardno);
		} catch (Exception e) {
			logger.info("ERROR alarmUpdate");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<HashMap<String, Object>> alarmlist(String recipient) {
		List<HashMap<String, Object>> map=null;
		try {
			map=sqlSession.selectList(NAMESPACE+"alarmlist",recipient);
		} catch (Exception e) {
			logger.info("ERROR alarmList");
			e.printStackTrace();
		}
		
		return map;
	}
	
	

}
