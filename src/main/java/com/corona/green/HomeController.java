package com.corona.green;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller 
public class HomeController {
	
	
	@RequestMapping(value = "main.do")
	public String home(Model model) {
		
		
		return "green_main";
	}
	
}