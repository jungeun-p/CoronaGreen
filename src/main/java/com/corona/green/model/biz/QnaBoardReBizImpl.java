package com.corona.green.model.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.corona.green.model.dao.QnaBoardReDao;
import com.corona.green.model.dto.QnaBoardReDto;

@Service
public class QnaBoardReBizImpl implements QnaBoardReBiz {

	@Autowired
	private QnaBoardReDao dao;
	
	@Override
	public QnaBoardReDto selectOne(int boardno) {
		return dao.selectOne(boardno);
	}

	@Override
	public int insert(QnaBoardReDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int alarmInsert(HashMap<String, Object> map) {
		return dao.alarmInsert(map);
	}

	@Override
	public int alarmUpdate(String alarm_boardno) {
		return dao.alarmUpdate(alarm_boardno);
	}

	@Override
	public List<HashMap<String, Object>> alarmlist(String recipient) {
		// TODO Auto-generated method stub
		return dao.alarmlist(recipient);
	}
	
}
