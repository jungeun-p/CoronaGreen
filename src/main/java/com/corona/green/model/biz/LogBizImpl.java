package com.corona.green.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.corona.green.model.dao.LogDao;
import com.corona.green.model.dto.LogDto;

@Service
public class LogBizImpl implements LogBiz {

	@Autowired
	private LogDao dao;

	@Override
	public int LogEnter(LogDto dto) {
		return dao.LogEnter(dto);
	}

	@Override
	public int LogOut(LogDto dto) {
		// TODO Auto-generated method stub
		return dao.LogOut(dto);
	}
}
