package com.corona.green.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.corona.green.model.dto.QnaBoardDto;

@Repository
public class QnaBoardDaoImpl implements QnaBoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<QnaBoardDto> selectList() {
		
		List<QnaBoardDto> list = new ArrayList<QnaBoardDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACER+"qnalist");
		} catch (Exception e) {
			System.out.println("[qnalist Error]");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public QnaBoardDto selectOne(int boardno) {
		
		QnaBoardDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACER+"selectOne", boardno);
		} catch (Exception e) {
			System.out.println("[ERROR SelectOne]");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int insert(QnaBoardDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACER+"insert", dto);
		} catch (Exception e) {
			System.out.println("[ERROR insert]");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(QnaBoardDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACER+"update", dto);
		} catch (Exception e) {
			System.out.println("[ERROR Update]");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(int boardno) {
		
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACER+"delete",boardno);
		} catch (Exception e) {
			System.out.println("[ERROR Delete]");
			e.printStackTrace();
		}
		
		return res;
	}

}
