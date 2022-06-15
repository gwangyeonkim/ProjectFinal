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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.min.proj.service.IFbsService;
import com.min.proj.service.ITopCategoryService;
import com.min.proj.service.IWbsService;
import com.min.proj.vo.FbsVo;
import com.min.proj.vo.WbsVo;

@Controller
public class TemplateCtrl {

	@Autowired
	private IFbsService fbsService;
	@Autowired
	private ITopCategoryService topService;
	@Autowired
	private IWbsService wbsService;

	private Logger logger = LoggerFactory.getLogger(TemplateCtrl.class);

	@RequestMapping(value = "/fbs.do")
	public String moveFbs() {
		logger.info("TemplateCtrl moveFbs");
		return "/proj/fbs";
	}

	@RequestMapping(value = "/selectFbs.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONArray selectFbs(HttpSession session) {
		logger.info("TemplateCtrl selectFbs");
		Map<String, String> map = new HashMap<String, String>();
//		System.out.println((String)session.getAttribute("userId"));
		
		// TODO 1. 변경점 1
//		map.put("memId", (String)session.getAttribute("userId"));
		map.put("memId", "CH001");
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
			jObj.put("fbsManager", fVo.get(i).getFbsManager());
			jObj.put("fbsStep", fVo.get(i).getFbsStep());
			jObj.put("topCode", fVo.get(i).getTopVo().getTopCode());
			jObj.put("topName", fVo.get(i).getTopVo().getTopName());
			jObj.put("topStep", fVo.get(i).getTopVo().getTopStep());

			System.out.println("!!!!!!!" + jObj);
			jAry.add(i, jObj);

		}
//		for (int i = 0; i < jAry.size()-1; i++) {
//			System.out.println(jAry.get(i));
//		}
		return jAry;
	}

	@RequestMapping(value = "/matchTopCategory.do", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String matchTopCategory(@RequestParam Map<String, String> jsonArr, HttpSession session)
			throws NullPointerException {
		logger.info("TemplateCtrl matchTopCategory {}", jsonArr);
//		System.out.println("!!!!!!!!!!!!!!!!!!!" + jsonArr.get("rowKey"));
		Map<String, String> map = new HashMap<String, String>();
		JSONArray jAry = selectFbs(session);
//		System.out.println(jAry.get(0).equals(jsonArr.get("topName")));
//		System.out.println(jAry.get(0));

//		System.out.println(jObj.get("topName"));
		System.out.println(jAry.size());

		try {
			for (int i = 0; i < jAry.size(); i++) {
				JSONObject jsonObj = (JSONObject) jAry.get(i);
				boolean isc = (jsonObj.get("topName").equals(jsonArr.get("topName"))) ? true : false;
				System.out.println("!!!!!!!!!!" + jsonObj.get("topName"));
				System.out.println("!!!!!!!!!!" + jsonArr.get("topName"));
				System.out.println("!!!!!!!!!!" + jsonArr.get("projName"));
				System.out.println(isc);
				System.out.println("!!!!!!!!!!!!!@!@!@@@@@@@@@@");
				System.out.println(jsonArr.get("midId"));
				System.out.println(jsonArr.get("midId").trim().equals(""));
				System.out.println("!!!!!!!!!!!!!@!@!@@@@@@@@@@");
				if (isc == true) {
					boolean iscTopId = (jsonObj.get("topId").equals(jsonArr.get("topId"))) ? true : false;
					System.out.println("checkpoint 1");
					System.out.println(iscTopId);
					if (iscTopId == false && jsonArr.get("midId").trim().equals("")) {
						System.out.println("checkpoint 2");
						topService.deleteTopCategory((String)jsonArr.get("topId"));
						Map<String, String> newFbsMap = new HashMap<String, String>();
						//TODO 3 projName 세션으로
//						newFbsMap.put("projName", "자두과");
						newFbsMap.put("projName", (String)session.getAttribute("projName"));
						newFbsMap.put("topName", jsonArr.get("topName"));
						newFbsMap.put("fbsName", jsonArr.get("fbsName"));
						newFbsMap.put("fbsCode", jsonArr.get("fbsCode"));
						newFbsMap.put("fbsContent", jsonArr.get("fbsContent"));
						newFbsMap.put("fbsImp", jsonArr.get("fbsImp"));
						newFbsMap.put("fbsLevel", jsonArr.get("fbsLevel"));
						newFbsMap.put("fbsManager", jsonArr.get("fbsManager"));

						fbsService.newFbs(newFbsMap);
					}else if(iscTopId == false && !jsonArr.get("midId").trim().equals("")){
						System.out.println("checkpoint 3");
								Map<String, String> fixMap = new HashMap<String, String>();
								fixMap.put("fbsName", jsonArr.get("fbsName"));
								fixMap.put("fbsCode", jsonArr.get("fbsCode"));
								fixMap.put("fbsContent", jsonArr.get("fbsContent"));
								fixMap.put("fbsImp", jsonArr.get("fbsImp"));
								fixMap.put("fbsLevel", jsonArr.get("fbsLevel"));
								fixMap.put("fbsManager", jsonArr.get("fbsManager"));
								fixMap.put("topId", (String) jsonArr.get("topId"));

								fbsService.fixFbs(fixMap);
					}else if(iscTopId == true && jsonArr.get("midId").trim().equals("")){
						System.out.println("checkpoint 4");
						Map<String, String> newFbsMap = new HashMap<String, String>();
						//TODO 3 projName 세션으로
//						newFbsMap.put("projName", "자두과");
						newFbsMap.put("projName", (String)session.getAttribute("projName"));
						newFbsMap.put("topName", jsonArr.get("topName"));
						newFbsMap.put("fbsName", jsonArr.get("fbsName"));
						newFbsMap.put("fbsCode", jsonArr.get("fbsCode"));
						newFbsMap.put("fbsContent", jsonArr.get("fbsContent"));
						newFbsMap.put("fbsImp", jsonArr.get("fbsImp"));
						newFbsMap.put("fbsLevel", jsonArr.get("fbsLevel"));
						newFbsMap.put("fbsManager", jsonArr.get("fbsManager"));

						fbsService.newFbs(newFbsMap);
					}else if(iscTopId == true && !jsonArr.get("midId").trim().equals("")) {
						System.out.println("checkpoint 5");
						Map<String, String> fixMap = new HashMap<String, String>();
						fixMap.put("fbsName", jsonArr.get("fbsName"));
						fixMap.put("fbsCode", jsonArr.get("fbsCode"));
						fixMap.put("fbsContent", jsonArr.get("fbsContent"));
						fixMap.put("fbsImp", jsonArr.get("fbsImp"));
						fixMap.put("fbsLevel", jsonArr.get("fbsLevel"));
						fixMap.put("fbsManager", jsonArr.get("fbsManager"));
						fixMap.put("midId", jsonArr.get("midId"));

						fbsService.fixFbs(fixMap);
					}
					break;
				}
			}
		
		} catch (NullPointerException e) {
			// TODO: handle exception
		}
		return "Yammy";
	}
	
	@RequestMapping(value = "/updateTopCategory.do", method = RequestMethod.POST,produces = "application/json; charset=UTF-8")
	@ResponseBody
	public Boolean updateTopCategory(@RequestParam Map<String, String> jsonArr,HttpSession session) {
		logger.info("TemplateCtrl updateTopCategory {}",jsonArr);
		Map<String, String> map = new HashMap<String, String>();
		// TODO 2. 변경점 1
//		map.put("projName", (String)session.getAttribute("projName"));
		map.put("topId", jsonArr.get("topId"));
		map.put("topCode", jsonArr.get("topCode"));
		map.put("topName", jsonArr.get("topName"));
		topService.fixTopCategory(map);

		return true;
	}

	@RequestMapping(value = "/newFbsRow.do", method = RequestMethod.GET)
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
	
	@RequestMapping(value = "/finFbs.do", method = RequestMethod.GET)
	@ResponseBody
	public Boolean finFbs(HttpSession session) {
		logger.info("TemplateCtrl finFbs {}");

		// TODO 5. 변경점 projName
		topService.deleteNullTopCategory("자두과");
//		topService.deleteNullTopCategory((String)session.getAttribute("projName"));
		
		return true;
	}
	
	@RequestMapping(value = "/wbs.do")
	public String moveWbs() {
		logger.info("TemplateCtrl moveWbs");
		return "/proj/wbs";
	}
	
	@RequestMapping(value = "/selectWbs.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONArray selectWbs(HttpSession session) {
		logger.info("TemplateCtrl selectWbs");
		Map<String, String> map = new HashMap<String, String>();
//		System.out.println((String)session.getAttribute("userId"));
		// TODO 1. 변경점 1
//		map.put("memId", (String)session.getAttribute("userId"));
		map.put("memId", "CH001");
		List<WbsVo> wVo = wbsService.selectWbs(map);
//		System.out.println(fVo.toString());
//		System.out.println(map);

		JSONArray jAry = new JSONArray();
		for (int i = 0; i < wVo.size(); i++) {
			JSONObject jObj = new JSONObject();
			jObj.put("topId", wVo.get(i).getTopVo().getTopId());
			jObj.put("topName", wVo.get(i).getTopVo().getTopName());
			jObj.put("topCode", wVo.get(i).getTopVo().getTopCode());
			jObj.put("midId", wVo.get(i).getFbsVo().getMidId());
			jObj.put("fbsName", wVo.get(i).getFbsVo().getFbsName());
			jObj.put("wbsId", wVo.get(i).getWbsId());
			jObj.put("wbsCode", wVo.get(i).getWbsCode());
			jObj.put("wbsName", wVo.get(i).getWbsName());
			jObj.put("wbsContent", wVo.get(i).getWbsConent());
			jObj.put("wbsManager", wVo.get(i).getWbsManager());
			jObj.put("wbsStartDate", wVo.get(i).getWbsStartDate());
			jObj.put("wbsEndDate", wVo.get(i).getWbsEndDate());
			
//			System.out.println("!!!!!!!" + jObj);
			jAry.add(i, jObj);

		}
		return jAry;
	}
	
	
//	midName fbs이름,wbsCode wbs코드,wbsName 
//	wbs이름,wbsContent wbs 내용,wbsManager wbs담당자
//	,wbsStartDate wbs시작일,wbsFinDate wbs종료일
	@RequestMapping(value = "/newWbsRow.do", method = RequestMethod.POST)
	public String newWbsRow(@RequestParam Map<String, String> jsonArr, HttpSession session) {
		logger.info("TemplateCtrl newWbsRow {}",jsonArr);
		
		String rowKey = jsonArr.get("midId");
		System.out.println(jsonArr.get("midId"));
		System.out.println(jsonArr.get("wbsId"));
		Map<String, String> map = new HashMap<String, String>();
			map.put("midId", jsonArr.get("midId"));
			map.put("wbsCode", "");
			map.put("wbsName", "");
			map.put("wbsContent", "");
			map.put("wbsManager", "");
			map.put("wbsStartDate", "");
			map.put("wbsEndDate", "");
//			TODO 10. 캐시때문인지 뭔지 모르겠는데. 자꾸 여러번 도는 현상이 나옴. 톰캣클린하고 돌리면 한번씩 정상작동하는데 중간에 여러번 돔.
			wbsService.newWbs(map);
			
		return "redirect:/wbs.do";
	}
	
	@RequestMapping(value = "/fixWbs.do", method = RequestMethod.POST)
	@ResponseBody
	public String fixWbs(@RequestParam Map<String, String> jsonArr) {
		logger.info("TemplateCtrl fixWbs {}",jsonArr);
		
		boolean isc = jsonArr.get("wbsId").equals("")?true:false;
		System.out.println(isc);
		
		if(isc==true) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("midId", jsonArr.get("midId"));
			map.put("wbsCode", jsonArr.get("wbsCode"));
			map.put("wbsName", jsonArr.get("wbsName"));
			map.put("wbsContent", jsonArr.get("wbsContent"));
			map.put("wbsManager", jsonArr.get("wbsManager"));
			map.put("wbsStartDate",jsonArr.get("wbsStartDate"));
			map.put("wbsEndDate", jsonArr.get("wbsEndDate"));
		wbsService.newWbs(map);

		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("wbsId", jsonArr.get("wbsId"));
		map.put("wbsCode", jsonArr.get("wbsCode"));
		map.put("wbsName", jsonArr.get("wbsName"));
		map.put("wbsContent", jsonArr.get("wbsContent"));
		map.put("wbsManager", jsonArr.get("wbsManager"));
		map.put("wbsStartDate", jsonArr.get("wbsStartDate"));
		map.put("wbsEndDate", jsonArr.get("wbsEndDate"));
		
		wbsService.fixWbs(map);
		
		return "Yammy";
	}
	
	@RequestMapping(value = "/finWbs.do",method = RequestMethod.GET)
	@ResponseBody
	public String finWbs(HttpSession session) {
		logger.info("TemplateCtrl finWbs {}");
		//TODO 6. 변경점 프로젝트 이름 세션에서 받을 것
		wbsService.deleteNullWbs("자두과");
		return "Yammy";
	}
}
