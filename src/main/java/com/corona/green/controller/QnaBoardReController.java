package com.corona.green.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.corona.green.model.biz.QnaBoardReBiz;
import com.corona.green.model.dto.MemberDto;
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
	
	@RequestMapping("/qnareAlarm.do")
	@ResponseBody
	public int qnareAlarm(@RequestBody HashMap<String,Object> map) {
		System.out.println("qnarealarm");
		System.out.println(map.keySet());
		System.out.println(map.values());
		int res=qnaReBiz.alarmInsert(map);
		
		return res;
	}
	
	@RequestMapping("/confirm.do")
	@ResponseBody
	public int qnareAlarm_confirm(String alarm_boardno) {
		int res=0;
		System.out.println("Alarm_confirm왔다!");
		System.out.println(alarm_boardno);
		 int alarm_boardno2=Integer.parseInt(alarm_boardno); 
		res=qnaReBiz.alarmUpdate(alarm_boardno);
		return res; 
	}
	
	@RequestMapping("/qnareAlarm_check.do")
	@ResponseBody
	public List<HashMap<String,Object>> qnareAlarm_check(HttpSession session){
		List<HashMap<String,Object>> map=null;
		MemberDto dto=(MemberDto)session.getAttribute("dto");
		if(dto!=null) {		//로그인 했을경우 
			System.out.println(dto.getId());
			try {
				map=qnaReBiz.alarmlist(dto.getId());
			} catch (Exception e) {
				logger.info("알림이 없습니다");
				e.printStackTrace();
			}
		}
		return map;
	}
}
