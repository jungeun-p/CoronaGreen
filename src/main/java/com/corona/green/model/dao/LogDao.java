package com.corona.green.model.dao;

import com.corona.green.model.dto.LogDto;

public interface LogDao {

	String NAMESPACE = "log.";
	
	public int LogEnter(LogDto dto);
	public int LogOut(LogDto dto);
}
