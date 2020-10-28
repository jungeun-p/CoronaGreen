package com.corona.green.model.dto;

import java.util.Date;

public class DonationDto {

	private int donationorder;
	private String id;
	private int payment;
	private Date regdate;

	public DonationDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DonationDto(int donationorder, String id, int payment, Date regdate) {
		super();
		this.donationorder = donationorder;
		this.id = id;
		this.payment = payment;
		this.regdate = regdate;
	}

	public int getDonationorder() {
		return donationorder;
	}

	public void setDonationorder(int donationorder) {
		this.donationorder = donationorder;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

}
