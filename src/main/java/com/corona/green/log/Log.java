package com.corona.green.log;

import org.apache.ibatis.session.SqlSession;

public class Log extends SqlMapConfig{

	public int TimeLogOut(String sessionid) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSeesionFactory().openSession(true);
			res = session.insert("log."+"timeout",sessionid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		
		return res;
	
	}
}
