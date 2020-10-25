package com.corona.green.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.corona.green.model.biz.QnaBoardBiz;
import com.corona.green.model.biz.QnaBoardReBiz;
import com.corona.green.model.dto.QnaBoardDto;
import com.corona.green.paging.Paging;

@Controller
public class QnaBoardController {
	
	Logger logger = LoggerFactory.getLogger(QnaBoardController.class);
	
	@Autowired
	private QnaBoardBiz qnaBiz;
	@Autowired
	private QnaBoardReBiz qnaReBiz;

	
	@RequestMapping("/qnaserchlist.do") 
	public String qnalist(Model model) {
	 
		model.addAttribute("list", qnaBiz.selectList());
		 
		return "green_qna_list"; 
	 }
	 
	
	@RequestMapping("/qnadetail.do")
	public String qnadetail(Model model, int boardno) {
		
		model.addAttribute("list", qnaBiz.selectOne(boardno));
		model.addAttribute("relist",qnaReBiz.selectOne(boardno));
		
		return "green_qna_select";
	}

	@RequestMapping("/qnainsertForm.do")
	public String qnainsertForm(Model model) {
		return "green_qna_insert";
	}
	
	@RequestMapping("/qnainsert.do")
	public String qnainsert(QnaBoardDto dto) {
		//System.out.println("비밀글 여부" +dto.getSecret());
		
		int res = qnaBiz.insert(dto);
		
		if(res > 0) {
			return "redirect:qnalist.do";
		} else {
			return "redirect:qnainsertForm.do";
		}
		
	}
	
	@RequestMapping("/qnaupdate.do")
	public String qnaupdate(Model model, int boardno) {
		
		model.addAttribute("list", qnaBiz.selectOne(boardno));
		
		return "green_qna_update";
	}
	
	
	@RequestMapping("/qnaupdateres.do")
	public String qnaupdateres(QnaBoardDto dto, int boardno) {
		
		int res = qnaBiz.update(dto);
		
		if(res > 0) {
			return "redirect:qnalist.do";
		} else {
			return "redirect:qnadetail.do?boardno="+boardno;
		}
		
	}
	
	@RequestMapping("/qnadelete.do")
	public String qnadelete(int boardno) {
		
		int res = qnaBiz.delete(boardno);
		
		if(res > 0) {
			return "redirect:qnalist.do";
		} else {
			return "redirect:qnadetail.do?boardno="+boardno;
		}
		
	}
	
	@RequestMapping("/serch.do")
	public String qnasherch(String serchselect, String serchtext, Model model, Paging vo
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		System.out.println(serchselect+"옵션:::::::"+serchtext);	
		
		if(serchselect.equals("title")) {
			
			int total = qnaBiz.countSerchBoard_title(serchtext);
			
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "5";
			}
			
			vo = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			
			model.addAttribute("serchtext", serchtext);
			model.addAttribute("paging", vo);
			model.addAttribute("viewAll",qnaBiz.selectSerchList_title(serchtext,vo));
			return "green_qna_list";
			
		} else if(serchselect.equals("id")) {
			
			int total = qnaBiz.countSerchBoard_id(serchtext);
			
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "5";
			}
			
			vo = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			
			model.addAttribute("serchtext", serchtext);
			model.addAttribute("paging", vo);
			model.addAttribute("viewAll",qnaBiz.selectSerchList_id(serchtext,vo));
			
			return "green_qna_list";
			
		} else {
			System.out.println("null serchselect");
			return "qnalist.do";
		}
	}
	
	@RequestMapping("/qnalist.do")
	public String boardList(Paging vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = qnaBiz.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", qnaBiz.selectBoard(vo));
		return "green_qna_list";
	}
	
}
