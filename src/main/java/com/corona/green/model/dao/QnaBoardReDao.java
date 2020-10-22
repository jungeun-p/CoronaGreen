package com.corona.green.model.dao;

import com.corona.green.model.dto.QnaBoardReDto;

public interface QnaBoardReDao {
	
	String NAMESPACE = "qnaRe.";
	
	public QnaBoardReDto selectOne(int boardno);
	public int insert(QnaBoardReDto dto);	

}
