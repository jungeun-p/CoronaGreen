package com.corona.green.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.corona.green.model.biz.NewsBiz;
import com.corona.green.model.dto.MemberDto;
import com.corona.green.model.dto.NewsDto;

@Controller
public class NewsController {

	Logger logger = LoggerFactory.getLogger(NewsController.class);
	
	@Autowired
	private NewsBiz biz;
	
	@RequestMapping("news.do")
	public String NewsForm(Model model, HttpSession session) {
		MemberDto dto = (MemberDto)session.getAttribute("dto");
		if (dto != null) {
			Map<String,Object> map = new HashMap<String, Object>();
			List<NewsDto> list = new ArrayList<NewsDto>();
			
			list = biz.bookmarkList(dto.getId());
			List<String> reallist = new ArrayList<String>();
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getTitle().length() > 40) {
					reallist.add("\"" +list.get(i).getTitle().substring(0,39)+"..."+ "\"");
				} else {
					reallist.add("\"" +list.get(i).getTitle() + "\"");
				}
			}
			map.put("list",reallist);
			model.addAttribute("map",map);
			model.addAttribute("id","\"" +dto.getId() + "\"");
			
			return "green_news";
		} else {
			Map<String,Object> map = new HashMap<String, Object>();
			List<String> reallist = new ArrayList<String>();
			reallist.add("\"alalaldhdh\"");
			map.put("list", reallist);
			model.addAttribute("map", map);
			model.addAttribute("id","null");
			return "green_news";
		}
		
	}
	
	@RequestMapping(value="bookmarkcheck.do", method=RequestMethod.GET)
	@ResponseBody
	public String bookmarkCheck(NewsDto dto) {
		String result = "";
		int res = biz.bookmarkCheck(dto.getId(), dto.getLink());
		System.out.println("과연 체크!!" + res);
		if (res > 0) {
			result = "DELETE";
			biz.bookmarkDelete(dto);
			return result;
		} else {
			result = "INSERT";
			biz.bookmarkInert(dto);
			return result;
		}
	}
	
	@RequestMapping("keywordsearch.do")
	public String KeyWordSearch (@RequestParam("keyword") String keyword, Model model, HttpSession session) {
		System.out.println(keyword);
		MemberDto dto = (MemberDto)session.getAttribute("dto");
		if (dto != null) {
			System.out.println("로그인");
			Map<String,Object> map = new HashMap<String, Object>();
			List<NewsDto> list = new ArrayList<NewsDto>();
			
			list = biz.bookmarkList(dto.getId());
			List<String> reallist = new ArrayList<String>();
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getTitle().length() > 40) {
					reallist.add("\"" +list.get(i).getTitle().substring(0,39)+"..."+ "\"");
				} else {
					reallist.add("\"" +list.get(i).getTitle() + "\"");
				}
			}
			map.put("list",reallist);
			model.addAttribute("map",map);
			model.addAttribute("id","\"" +dto.getId() + "\"");
			model.addAttribute("keyword", "\"" + keyword + "\"");
			
			return "green_news_keyword";
		} else {
			System.out.println("비로그인");
			Map<String,Object> map = new HashMap<String, Object>();
			List<String> reallist = new ArrayList<String>();
			reallist.add("\"alalaldhdh\"");
			map.put("list", reallist);
			model.addAttribute("map", map);
			model.addAttribute("id","null");
			model.addAttribute("keyword", "\"" + keyword + "\"");
			return "green_news_keyword";
		}
	}
}
