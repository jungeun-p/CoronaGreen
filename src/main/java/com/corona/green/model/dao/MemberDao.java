package com.corona.green.model.dao;

import com.corona.green.model.dto.MemberDto;

public interface MemberDao {

	String NAMESPACE = "member.";
	
	public MemberDto login(MemberDto dto);
}
