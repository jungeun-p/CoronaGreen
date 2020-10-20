package com.corona.green.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.corona.green.model.dao.QnaBoardDao;
import com.corona.green.model.dao.QnaBoardDaoImpl;
import com.corona.green.model.dto.QnaBoardDto;

@Service
public class QnaBoardBizImpl implements QnaBoardBiz {
	
	@Autowired
	private QnaBoardDao qnaboardDao;

	@Override
	public List<QnaBoardDto> selectList() {
		return qnaboardDao.selectList();
	}

	@Override
	public QnaBoardDto selectOne(int boardno) {
		return qnaboardDao.selectOne(boardno);
	}

	@Override
	public int insert(QnaBoardDto dto) {
		return qnaboardDao.insert(dto);
	}

	@Override
	public int update(QnaBoardDto dto) {
		return qnaboardDao.update(dto);
	}

	@Override
	public int delete(int boardno) {
		return qnaboardDao.delete(boardno);
	}

}
