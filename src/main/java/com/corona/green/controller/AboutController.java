package com.corona.green.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AboutController {
	Logger logger = LoggerFactory.getLogger(AboutController.class);
	
	@RequestMapping(value="greenabout.do")
	public String about(Model model) {
		return "green_about";
	}
}
