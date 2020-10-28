package com.corona.green.model.dao;

import com.corona.green.model.dto.DonationDto;

public interface DonationDao {

	String NAMESPACE = "donation.";
	
	public int DonationInsert(DonationDto dto);
}
