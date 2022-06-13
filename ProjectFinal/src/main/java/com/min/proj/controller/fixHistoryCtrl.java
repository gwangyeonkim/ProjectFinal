package com.min.proj.controller;



import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.min.proj.service.IFixHistoryService;

@Controller
public class fixHistoryCtrl {

	private Logger logger = LoggerFactory.getLogger(fixHistoryCtrl.class);
	
	@Autowired
	private IFixHistoryService fixService;
	
	@RequestMapping(value = "/newFix.do",method = RequestMethod.POST)
	public String newFix(String fixName, String fixContent, HttpSession session) {
		logger.info("fixHistoryCtrl newFix {}",fixContent,fixName);
		
		Map<String, String> map = new HashMap<String, String>();
		
//		map.put("memId", session.getAttribute("memId"));
		map.put("memId", "CH001");
		map.put("fixName", fixName);
		map.put("fixContent", fixContent);
		
//		fixService.newFix(map);
		
		System.out.println("쿼리 돌았습니다!!!!!!"+map);
		System.out.println("쿼리 돌았습니다!!!!!!");
		System.out.println("쿼리 돌았습니다!!!!!!");
		System.out.println("쿼리 돌았습니다!!!!!!");
		System.out.println("쿼리 돌았습니다!!!!!!");
		
//		System.out.println("수정된 쿼리지롱!");
		         
		return "/proj/fbs";
	}
	
}
