package com.corona.green.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.corona.green.model.biz.QnaBoardBiz;
import com.corona.green.model.dto.QnaBoardDto;

@Controller
public class QnaBoardController {
	
	Logger logger = LoggerFactory.getLogger(QnaBoardController.class);
	
	@Autowired
	private QnaBoardBiz qnaBiz;

	@RequestMapping("/qnalsit.do")
	public String qnalist(Model model) {
		
		model.addAttribute("list", qnaBiz.selectList());
		
		return "green_qna_list";
	}
	
	@RequestMapping("/qnadetail.do")
	public String qnadetail(Model model, int boardno) {
		
		model.addAttribute("list", qnaBiz.selectOne(boardno));
		
		return "green_qna_select";
	}

	@RequestMapping("/qnainsertForm.do")
	public String qnainsertForm(Model model) {
		return "green_qna_insert";
	}
	
	@RequestMapping("/qnainsert.do")
	public String qnainsert(QnaBoardDto dto) {
		
		int res = qnaBiz.insert(dto);
		
		if(res > 0) {
			return "redirect:qnalsit.do";
		} else {
			return "redirect:qnainsertForm.do";
		}
		
	}
	
}
