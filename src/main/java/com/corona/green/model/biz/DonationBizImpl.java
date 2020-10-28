package com.corona.green.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.corona.green.model.dao.DonationDao;

@Service
public class DonationBizImpl implements DonationBiz {

	@Autowired
	private DonationDao dao;
}
