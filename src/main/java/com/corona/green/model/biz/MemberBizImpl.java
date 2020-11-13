package com.corona.green.model.biz;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.corona.green.model.dao.MemberDao;
import com.corona.green.model.dto.MemberDto;

@Service
public class MemberBizImpl implements MemberBiz{

	@Autowired
	private MemberDao dao;
	
	@Override
	public MemberDto login(MemberDto dto) {
		// TODO Auto-generated method stub
		return dao.login(dto);
	}

	@Override
	public int regist(MemberDto dto) {
		// TODO Auto-generated method stub
		return dao.regist(dto);
	}

	@Override
	public int IdCheck(String id) {
		// TODO Auto-generated method stub
		return dao.IdCheck(id);
	}

	@Override
	public int EmailCheck(String email) {
		// TODO Auto-generated method stub
		return dao.EmailCheck(email);
	}

	@Override
	public MemberDto EmailCheckId(String email) {
		// TODO Auto-generated method stub
		return dao.EmailCheckId(email);
	}

	@Override
	public int EmailIdCheck(MemberDto dto) {
		// TODO Auto-generated method stub
		return dao.EmailIdCheck(dto);
	}

	@Override
	public int ChangePw(MemberDto dto) {
		// TODO Auto-generated method stub
		return dao.ChangePw(dto);
	}

}
