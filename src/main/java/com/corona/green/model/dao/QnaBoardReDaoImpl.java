package com.corona.green.model.dao;

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
	
	

}
