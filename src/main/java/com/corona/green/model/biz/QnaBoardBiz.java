package com.corona.green.model.biz;

import java.util.List;

import com.corona.green.model.dto.QnaBoardDto;
import com.corona.green.paging.Paging;

public interface QnaBoardBiz {
	
	public List<QnaBoardDto> selectList();
	public QnaBoardDto selectOne(int boardno);
	public int insert(QnaBoardDto dto);
	public int update(QnaBoardDto dto);
	public int delete(int boardno);
	
	public List<QnaBoardDto> selectSerchList_title(String serchtext);
	public List<QnaBoardDto> selectSerchList_id(String serchtext);
	
	// 게시물 총 갯수
	public int countBoard();
	// 페이징 처리 게시글 조회
	public List<QnaBoardDto> selectBoard(Paging vo);
	
}
