package com.corona.green.model.dao;

import java.util.List;

import com.corona.green.model.dto.QnaBoardDto;

public interface QnaBoardDao {
	
	String NAMESPACER = "qnaboard.";
	
	public List<QnaBoardDto> selectList();
	public QnaBoardDto selectOne(int boardno);
	public int insert(QnaBoardDto dto);
	public int update(QnaBoardDto dto);
	public int delete(int boardno);

}
