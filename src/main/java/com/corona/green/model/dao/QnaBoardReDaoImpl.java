package com.corona.green.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.corona.green.model.dto.QnaBoardReDto;

@Repository
public class QnaBoardReDaoImpl implements QnaBoardReDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public QnaBoardReDto selectOne(int boardno) {
		
		QnaBoardReDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", boardno);
		} catch (Exception e) {
			System.out.println("[ERROR SelectOne]");
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
			System.out.println("[ERROR insert]");
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
			System.out.println("[ERROR alarmInsert]");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int alarmUpdate(String alarm_boardno) {
		int res=0;
		System.out.println("dao변수"+alarm_boardno);
		try {
			res=sqlSession.update(NAMESPACE+"alarmUpdate",alarm_boardno);
		} catch (Exception e) {
			System.out.println("ERROR alarmUpdate");
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
			System.out.println("ERROR alarmList");
			e.printStackTrace();
		}
		
		return map;
	}
	
	

}
