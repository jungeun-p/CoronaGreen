package com.corona.green.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.corona.green.model.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	Logger logger = LoggerFactory.getLogger(MemberDaoImpl.class);
	
	
	@Override
	public MemberDto login(MemberDto dto) {
		MemberDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "login", dto);
		} catch (Exception e) {
			logger.info("ERROR LOGIN SELECT");
			e.printStackTrace();
		}
		return res;
	}


	@Override
	public int regist(MemberDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("ERROR REGIST INSERT");
		}
		return res;
	}


	@Override
	public int IdCheck(String id) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "idcheck", id);
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("ERROR IDCHECK");
		}
		return res;
	}


	@Override
	public int EmailCheck(String email) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "emailcheck", email);
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("ERROR EMAILCHECK");
		}
		return res;
	}


	@Override
	public MemberDto EmailCheckId(String email) {
		MemberDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "emailcheckid", email);
		} catch (Exception e) {
			logger.info("ERROR EMAILCHECK ID");
			e.printStackTrace();
		}
		return dto;
	}

}
