package com.corona.green.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.corona.green.model.dto.DonationDto;

@Repository
public class DonationDaoImpl implements DonationDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	Logger logger = LoggerFactory.getLogger(DonationDaoImpl.class);

	@Override
	public int DonationInsert(DonationDto dto) {
		int res = 0;
		System.out.println("다오왓냐?");
		System.out.println(dto.getId() + " 이히히히어허에" + dto.getPayment());
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			logger.info("ERROR INSERT");
			e.printStackTrace();
		}
		return res;
	}
}
