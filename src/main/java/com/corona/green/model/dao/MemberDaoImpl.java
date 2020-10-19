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
		logger.info("다오에서" + dto.getId());
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "login", dto);
		} catch (Exception e) {
			logger.info("ERROR LOGIN SELECT");
			e.printStackTrace();
		}
		return res;
	}

}
