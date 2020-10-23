package com.corona.green.model.dao;

import com.corona.green.model.dto.MemberDto;

public interface MemberDao {

	String NAMESPACE = "member.";
	
	public MemberDto login(MemberDto dto);
	public int regist(MemberDto dto);
	public int IdCheck(String id);
	public int EmailCheck(String email);
	public MemberDto EmailCheckId(String email);
	public int EmailIdCheck(MemberDto dto);
}
