package com.corona.green.model.biz;

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
	
}
