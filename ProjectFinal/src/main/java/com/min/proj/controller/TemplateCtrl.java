package com.min.proj.controller;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.json.JsonArray;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.min.proj.service.IFbsService;
import com.min.proj.service.ITopCategoryService;
import com.min.proj.vo.FbsVo;

@Controller
public class TemplateCtrl {

	@Autowired
	private IFbsService fbsService;
	@Autowired
	private ITopCategoryService topService;
	
	private Logger logger = LoggerFactory.getLogger(TemplateCtrl.class);
	
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
		logger.info("TemplateCtrl moveFbs");
		return "/proj/fbs";
	}
	
	
	@RequestMapping(value = "/selectFbs.do",method = RequestMethod.POST)
	@ResponseBody
	public JSONArray selectFbs(HttpSession session) {
		logger.info("TemplateCtrl selectFbs");
		Map<String, String> map = new HashMap<String, String>();
//		System.out.println((String)session.getAttribute("userId"));
		//TODO 1. 변경점 1
//		map.put("memId", (String)session.getAttribute("userId"));
		map.put("memId", "CH003");
		List<FbsVo> fVo = fbsService.selectFbs(map);
//		System.out.println(fVo.toString());
//		System.out.println(map);
		
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
//		for (int i = 0; i < jAry.size()-1; i++) {
//			System.out.println(jAry.get(i));
//		}
		return jAry;
	}
	

	@RequestMapping(value = "/newTopCategory.do",method = RequestMethod.POST,produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String newTopCategory(@RequestParam Map<String, String> jsonArr, HttpSession session) {
		logger.info("TemplateCtrl newTopCategory {}",jsonArr);
		System.out.println("!!!!!!!!!!!!!!!!!!!"+jsonArr.get("rowKey"));
		Map<String, String>map = new HashMap<String, String>();
		JSONArray jAry = selectFbs(session);
//		System.out.println(jAry.get(0).equals(jsonArr.get("topName")));
//		System.out.println(jAry.get(0));
		
//		JSONObject jObj = (JSONObject) jAry.get(0);
//		System.out.println(jObj.get("topName"));
		System.out.println(jAry.size());
		
		for (int i = 0; i < jAry.size()-1; i++) {
			JSONObject jsonObj = (JSONObject) jAry.get(i);
			try {
				boolean isc = (jsonObj.get("topName").equals(jsonArr.get("topName")))?true:false;
//				System.out.println(jsonObj.get("topName"));
//				System.out.println(jsonArr.get("topName"));
//				System.out.println(isc);
				if(isc==true) {
					boolean iscTopId = (jsonObj.get("topId").equals(jsonArr.get("topId")))?true:false;
					System.out.println("checkpoint 1");
					System.out.println(iscTopId);
						if(iscTopId=true) {
							return "";
						}else {
							Map<String, String> fixMap = new HashMap<String, String>();
							fixMap.put("fbsName", jsonArr.get("fbsName"));
							fixMap.put("fbsCode", jsonArr.get("fbsCode"));
							fixMap.put("fbsContent", jsonArr.get("fbsContent"));
							fixMap.put("fbsImp", jsonArr.get("fbsImp"));
							fixMap.put("fbsLevel", jsonArr.get("fbsLevel"));
							fixMap.put("fbsManager", jsonArr.get("fbsManager"));
							fixMap.put("topId", (String) jsonObj.get("topId"));
							
							fbsService.fixFbs(fixMap);
						}
					}
				} catch (NullPointerException e) {
					// TODO: handle exception
				}
			}
			return "Yammy";
		}
	
	@RequestMapping(value = "/newFbs.do",method = RequestMethod.POST,produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String newFbs(@RequestParam Map<String, String> jsonArr, HttpSession session) {
		logger.info("TemplateCtrl newFbs {}",jsonArr);
		System.out.println("!!!!!!!!!!!!!!!!!!!"+jsonArr.get("rowKey"));
		Map<String, String> map = new HashMap<String, String>();
		JSONArray jAry = selectFbs(session);
//		System.out.println(jAry);
//		for (int i = 0; i < jAry.size(); i++) {
//			JSONObject jsonObj = (JSONObject) jAry.get(i);
//			jsonObj.get("topName").equals(jsonArr.get("topName"));
//			System.out.println("중복대분류존재");
//		}
		return "Yammy";
	}
	
	@RequestMapping(value = "/newFbsRow.do",method = RequestMethod.GET)
	@ResponseBody
	public Boolean newFbsRow(HttpSession session) {
		logger.info("TemplateCtrl newFbsRow {}");
		Map<String, String> map = new HashMap<String, String>();
		// TODO 2. 변경점 1
//		map.put("projName", (String)session.getAttribute("projName"));
		map.put("projName", "자두과");
		map.put("topCode", "");
		map.put("topName", "");
		topService.newTopCategory(map);
		
		return true;
	}
	
	
	@RequestMapping(value = "/tempFbs.do",method = RequestMethod.POST,produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String tempFbs(@RequestParam String[] jsonArr1, HttpSession session) {
		logger.info("TemplateCtrl tempFbs {}",jsonArr1.toString());
		System.out.println("!!!!!!!!!!!!!!!!!!!"+jsonArr1.toString());
//		Map<String, String>map = new HashMap<String, String>();
//		JSONArray jAry = selectFbs(session);
//		System.out.println(jAry);
//		for (int i = 0; i < jAry.size(); i++) {
//			JSONObject jsonObj = (JSONObject) jAry.get(i);
//			jsonObj.get("topName").equals(jsonArr.get("topName"));
//			System.out.println("중복대분류존재");
//		}
		return "";
	}
}
