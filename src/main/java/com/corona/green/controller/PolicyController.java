package com.corona.green.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PolicyController {

	
	Logger logger = LoggerFactory.getLogger(PolicyController.class);
	
	
	@RequestMapping("policylist.do")
	public String PolicyList() {
		return "green_policy";
	}
}
