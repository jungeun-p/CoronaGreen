package com.corona.green.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.corona.green.api.UserSha256;
import com.corona.green.model.biz.BookMarkBiz;
import com.corona.green.model.biz.MemberBiz;
import com.corona.green.model.biz.MypageBiz;
import com.corona.green.model.dto.BookMarkDto;
import com.corona.green.model.dto.MemberDto;

@Controller
public class MypageController {

	@Autowired
	private MypageBiz biz;
	
	@Autowired
	private BookMarkBiz bookmarkbiz;
	
	Logger logger = LoggerFactory.getLogger(MemberLoginController.class);
	
	@RequestMapping("/mypage_update.do")
	public String mypage_update() {
		return "green_mypage_update";
	}
	
	@RequestMapping("/mypage_updateres.do")
	public String mypage_updateres(MemberDto dto , Model model,HttpSession session) {
		logger.info("mypage_updateres");
		String encryPassword = UserSha256.encrypt(dto.getPw());
		dto.setPw(encryPassword);
		int res= biz.myupdate(dto);
		
		if(res>0) {
			model.addAttribute("msg","비밀번호가 변경되었습니다 다시 로그인 해주세요");
			model.addAttribute("url","/main.do");
			session.invalidate();
			return "redirect";
		}else {
			model.addAttribute("msg","비밀번호 변경에 실패하였습니다");
			model.addAttribute("url","/mypage_updateres.do");
			session.invalidate();
			return "redirect";
		}
	}
	
	@RequestMapping("/pw_check.do")
	@ResponseBody
	public boolean pw_check(@RequestParam String pw ,HttpSession session) {
		boolean ck=false;
		MemberDto dto=(MemberDto) session.getAttribute("dto");
		String pw_encrypt=UserSha256.encrypt(pw);
		if(dto.getPw().equals(pw_encrypt)){
			ck=true;
		}
		return ck;
	}
	
	// 북마크 리스트출력
	@RequestMapping("bookmarklist.do")
	public String bookmarkList(Model model,HttpSession session) {
		MemberDto dto = (MemberDto)session.getAttribute("dto");
		if (dto != null) {
			List<BookMarkDto> list = new ArrayList<BookMarkDto>();
			list = bookmarkbiz.selectList(dto.getId());
			model.addAttribute("list", list);
			return "green_mypage_bookmark";
		} else {
			model.addAttribute("msg", "로그인을 해주세요.");
			model.addAttribute("url", "/loginform.do");
			return "redirect";
		}
	}
	
	@RequestMapping(value="bookmarkdelete.do", method=RequestMethod.GET)
	@ResponseBody
	public String bookmarkDel(BookMarkDto dto) {
		System.out.println(dto.getId());
		System.out.println(dto.getLink());
		
		int res = bookmarkbiz.delete(dto);
		if (res > 0) {
			return "SUCCESS";
		} else {
			return "FAIL";
		}
		
	}
	
	@RequestMapping("secession.do")
	public String Secession(String id) {
		System.out.println(id);
		biz.secession(id);
		return "redirect:logout1.do";
	}
	
}
