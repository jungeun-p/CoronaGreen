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
				reallist.add("\"" +list.get(i).getTitle()+ "\"");
			}
			map.put("list",reallist);
			model.addAttribute("map",map);
			
			return "green_news";
		} 
		
		return "green_news";
	}
}
