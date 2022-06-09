package com.min.proj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.json.JsonArray;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.min.proj.service.IFbsService;
import com.min.proj.vo.FbsVo;

@Controller
public class TemplateCtrl {

	@Autowired
	private IFbsService fbsService;
	
	@RequestMapping(value = "/sessionTest2.do",produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String sessionTest(HttpSession session) {
		String projName= (String)session.getAttribute("projName");
		String user = (String)session.getAttribute("userId");
		Map<String, String> map = new HashMap<String, String>();
		map.put("memId", (String)session.getAttribute("userId"));
		List<FbsVo> fVo = fbsService.selectFbs(map);
		String json = JSONArray.toJSONString(fVo);
		return json;
		
	}
	
	@RequestMapping(value = "/fbs.do")
	public String moveFbs() {
		
		return "/proj/fbs";
	}
	
	
	@RequestMapping(value = "/selectFbs.do",method = RequestMethod.POST)
	@ResponseBody
	public JSONArray selectFbs(HttpSession session) {
		Map<String, String> map = new HashMap<String, String>();
		System.out.println((String)session.getAttribute("userId"));
//		map.put("memId", (String)session.getAttribute("userId"));
		map.put("memId", "CH003");
		List<FbsVo> fVo = fbsService.selectFbs(map);
		System.out.println(fVo.toString());
		System.out.println(map);
		
		JSONArray jAry = new JSONArray();
		for (int i = 0; i < fVo.size(); i++) {
			JSONObject jObj = new JSONObject();
			jObj.put("midId", fVo.get(i).getMidId());
			jObj.put("topId", fVo.get(i).getTopId());
			jObj.put("fbsName", fVo.get(i).getFbsName());
			jObj.put("fbsCode", fVo.get(i).getFbsCode());
			jObj.put("fbsContent", fVo.get(i).getFbsContent());
			jObj.put("fbsImp", fVo.get(i).getFbsImp());
			jObj.put("fbsLevel", fVo.get(i).getFbsLevel());
			jObj.put("fbsManager", fVo.get(i).getFbsLevel());
			jObj.put("fbsStep", fVo.get(i).getFbsStep());
			jObj.put("topCode", fVo.get(i).getTopVo().getTopCode());
			jObj.put("topName", fVo.get(i).getTopVo().getTopName());
			jObj.put("topStep", fVo.get(i).getTopVo().getTopStep());
			
			System.out.println("!!!!!!!"+jObj);
			jAry.add(i, jObj);
			
		}
		for (int i = 0; i < jAry.size()-1; i++) {
			System.out.println(jAry.get(i));
		}
		return jAry;
	}
	
}
