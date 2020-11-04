package com.corona.green.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.corona.green.model.biz.QnaBoardReBiz;
import com.corona.green.model.dto.QnaBoardReDto;

@Controller
public class QnaBoardReController {
	
	Logger logger = LoggerFactory.getLogger(QnaBoardReController.class);

	@Autowired
	private QnaBoardReBiz qnaReBiz;
	
	
	@RequestMapping("/qnaReinsert.do")
	public String qnainsert(QnaBoardReDto dto, int boardno) {
		
		int res = qnaReBiz.insert(dto);
		
		if(res > 0) {
			return "redirect:qnadetail.do?boardno="+boardno;
		} else {
			return "redirect:qnadetail.do?boardno="+boardno;
		}
		
	}
	
}
