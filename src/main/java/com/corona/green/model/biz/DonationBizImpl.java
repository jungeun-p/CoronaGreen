package com.corona.green.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.corona.green.model.dao.DonationDao;
import com.corona.green.model.dto.DonationDto;

@Service
public class DonationBizImpl implements DonationBiz {

	@Autowired
	private DonationDao dao;

	@Override
	public int DonationInsert(DonationDto dto) {
		System.out.println("비즈들어왓음?");
		return dao.DonationInsert(dto);
	}
}
