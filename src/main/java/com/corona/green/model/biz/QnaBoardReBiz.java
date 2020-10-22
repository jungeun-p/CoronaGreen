package com.corona.green.model.biz;

import com.corona.green.model.dto.QnaBoardReDto;

public interface QnaBoardReBiz {

	public QnaBoardReDto selectOne(int boardno);
	public int insert(QnaBoardReDto dto);
	
}
