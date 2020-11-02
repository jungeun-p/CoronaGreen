package com.corona.green.model.biz;

import com.corona.green.model.dto.LogDto;

public interface LogBiz {

	public int LogEnter(LogDto dto);
	public int LogOut(LogDto dto);
	public int TimeLogOut(String sessionid);
}
