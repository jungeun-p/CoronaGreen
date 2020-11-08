package com.corona.green.model.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.corona.green.model.dto.QnaBoardReDto;

public interface QnaBoardReBiz {

	public QnaBoardReDto selectOne(int boardno);
	public int insert(QnaBoardReDto dto);
	public int alarmInsert(HashMap<String, Object> map);
	public int alarmUpdate(String alarm_boardno);
	public List<HashMap<String, Object>> alarmlist(String recipient);
	
}
