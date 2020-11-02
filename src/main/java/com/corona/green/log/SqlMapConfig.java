package com.corona.green.log;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
private SqlSessionFactory sqlSessionFactory;
	
	public SqlSessionFactory getSqlSeesionFactory() {
		
		String resource = "com/corona/green/log/sqlconfig.xml";
		InputStream inputStream = null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			// xml설정을 읽어옴
		} catch (IOException e) {
			e.printStackTrace();
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		// 읽은 내용을 가져와서 sqlSessionFactory를 만들어줌
		return sqlSessionFactory;
	}
}
