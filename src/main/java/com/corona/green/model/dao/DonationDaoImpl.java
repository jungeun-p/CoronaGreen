package com.corona.green.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DonationDaoImpl implements DonationDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
