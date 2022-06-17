package com.min.proj.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.min.mema.vo.MemberVo;
import com.min.proj.service.IFixHistoryService;
import com.min.proj.vo.FixHistoryVo;


@Controller
public class fixHistoryCtrl {

	private Logger logger = LoggerFactory.getLogger(fixHistoryCtrl.class);
	
	@Autowired
	private IFixHistoryService fixService;
	
	@RequestMapping(value = "/moveFixhistory.do",method = RequestMethod.GET)
	public String moveFixhistory () {
		logger.info("fixHistoryCtrl newFix {}");
		
		
		return "/proj/fixhistory";
	}
	
	@RequestMapping(value = "/selectFixhistory.do",method = RequestMethod.POST)
	@ResponseBody
	public JSONArray selectFixhistory(HttpSession session) {
		logger.info("fixHistoryCtrl selectFixhistory {}");
		Map<String, String> map = new HashMap<String, String>();
		
		
		MemberVo mVo =	(MemberVo)session.getAttribute("loginVo");
//		TODO 12. 변경점
//		map.put("memId", (String)session.getAttribute("memId"));
		map.put("memId", mVo.getMemberId());
		System.out.println(map.toString());
		
//		map.put("memId", "CH001");
		
		List<FixHistoryVo> fixVo = 	fixService.selectFixHistory(map);
		JSONArray jAry = new JSONArray();
		if(fixVo!=null) {
			for (int i = 0; i < fixVo.size(); i++) {
				JSONObject jObj = new JSONObject();
				jObj.put("fixContent", fixVo.get(i).getFixContent());
				jObj.put("fixName", fixVo.get(i).getFixName());
				
				jAry.add(i, jObj);
			}
		}
		         
		return jAry;
	}
	
	@RequestMapping(value = "/newFix.do",method = RequestMethod.POST)
	public String newFix(String fixName, String fixContent, HttpSession session) {
		logger.info("fixHistoryCtrl newFix {}",fixContent,fixName);
		
		Map<String, String> map = new HashMap<String, String>();
		
//		map.put("memId", "CH001");
		MemberVo mVo =	(MemberVo)session.getAttribute("loginVo");
		map.put("memId", mVo.getMemberId());
		map.put("fixName", fixName);
		map.put("fixContent", fixContent);
		
		fixService.newFix(map);
		
//		System.out.println("수정된 쿼리지롱!");
		         
		return "/proj/fbs";
	}
	
}
