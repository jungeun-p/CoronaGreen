package com.corona.green.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.corona.green.model.biz.DonationBiz;
import com.corona.green.model.dto.DonationDto;

@Controller
public class DonationController {

	Logger logger = LoggerFactory.getLogger(DonationController.class);
	
	@Autowired
	private DonationBiz biz;
	
	@RequestMapping("donationform.do")
	public String DonationForm() {
		return "green_donation";
	}
	
	@RequestMapping("donationres.do")
	public String DonationRes(@RequestParam("id") String id, @RequestParam("won") String won, Model model) {
		//System.out.println("여기로왔니!?");
		int payment = Integer.parseInt(won);
		DonationDto dto = new DonationDto();
		dto.setId(id);
		dto.setPayment(payment);
		
		int res = biz.DonationInsert(dto);
		
		if (res > 0) {
			model.addAttribute("msg", "후원을 해주셔서 감사합니다.");
			model.addAttribute("url", "/main.do");
			return "redirect";
		} else {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("url", "/main.do");
			return "redirect";
		}
	}
}
