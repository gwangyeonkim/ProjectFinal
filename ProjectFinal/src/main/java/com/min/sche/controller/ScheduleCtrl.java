package com.min.sche.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.json.XML;
import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.min.mema.vo.MemberVo;
import com.min.proj.service.IProjMemListService;
import com.min.proj.vo.ProjMemListVo;
import com.min.sche.service.IScheduleService;
import com.min.sche.vo.ScheduleVo;
import com.min.sche.vo.WbsViewVo;



/**
 * Handles requests for the application home page.
 */

@Controller
public class ScheduleCtrl { 
	
	private static final Logger logger = LoggerFactory.getLogger(ScheduleCtrl.class);
	
	@Autowired
	IScheduleService service;
	
	@Autowired
	IProjMemListService pService;
	
	/**
	 * 처음 접속을 할 때 현재 년도 정보를 가져간다.
	 */
	@RequestMapping(value = "/calendar.do", method = RequestMethod.GET,produces = "application/text;charset-UTF-8")
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date today = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY");
		String year = simpleDateFormat.format(today);
		model.addAttribute("serverTime", year );
		
		return "scheduler";
	}
	
	@RequestMapping(value="/scheboard.do", method=RequestMethod.GET)
	public String showChart(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String projName = (String)session.getAttribute("projName");
		
		List<ProjMemListVo> mlists = pService.projMemList(projName);
		List<String> memberList = new ArrayList<String>();
		for (int i = 0; i < mlists.size(); i++) {
			memberList.add(service.getProjectMember(mlists.get(i).getMemId()));
		}
		session.setAttribute("mLists", memberList);
		
		int allCount = service.getAllCount(projName); //전체 일정의 갯수
		if(allCount != 0) {
			int perValue = Math.round(100/allCount);//일정 1개완료당 진척도 올라가는량
			int done = service.getFinCount(projName);//완료한 일정의 갯수
			model.addAttribute("jinchuck",perValue*done);
		}
		
		
		MemberVo loginVo = (MemberVo) session.getAttribute("loginVo");
		String manager = loginVo.getMemName();
		
		List<ProjMemListVo> lists = pService.projMemList(projName);
		List<Integer> memFinList = new ArrayList<Integer>();
		
		for (int i = 0; i < lists.size(); i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("projName",projName);
			map.put("manager",service.getProjectMember(lists.get(i).getMemId()));
			int memAll = service.memAllCount(map);
			if(memAll != 0) {
				int memValue = Math.round(100/memAll);
				int memFin = service.memFinCount(map);
				memFinList.add(memValue*memFin);
			}
		}
		model.addAttribute("finInfo",memFinList);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projName",projName);
		map.put("manager",manager);
		service.memAllCount(map);
		service.memFinCount(map);
		
		return "scheboard";
	}
	
	@RequestMapping(value="/callComplete.do", method=RequestMethod.POST)
	@ResponseBody
	public List<WbsViewVo> callComplete(@RequestParam String memId){
		List<WbsViewVo> lists = service.callComplete(memId);
		
		return lists;
	}
	
	@RequestMapping(value="/callIncomplete.do", method=RequestMethod.POST)
	@ResponseBody
	public List<WbsViewVo> callIncomplete(@RequestParam String memId){
		List<WbsViewVo> lists = service.callIncomplete(memId);
		
		return lists;
	}
	
	/**
	 * API를 요청하여 공휴일 정보를 받아온다음 toast의 createSchedule 형식에 맞게 데이터를 가공하여 JSONArray로 만들어 보내준다
	 * 1월1일 신정의 경우 이름이 다른 경우가 있어 처리해주었음
	 * @param sunYear 받은 양력 년도
	 * @param sunMonth 받은 양력 월
	 * @param sunDay 받은 양력 일
	 * @return
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/restDay.do", method=RequestMethod.POST,produces = "application/text; charset=utf8")
	@ResponseBody
	public String restDay(@RequestParam String year) throws IOException{
		String key = "fET3a8HPdgurj21NIvYv%2BpPB3hJ5cgyRtZj4oV%2FU36V7d80cPhkpJ4O5SUR4FHhdenvXtgrCH9Upl6VO8YfFBQ%3D%3D";
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getRestDeInfo"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+key); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("30", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("solYear","UTF-8") + "=" + URLEncoder.encode(year, "UTF-8")); /*연*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        String result = rd.readLine();
        rd.close();
        conn.disconnect();
        System.out.println("받아온 결과!~~~~~~~~~~~~~~~~~~~~~~~~~");
        System.out.println(result);
        
        JSONObject json =  XML.toJSONObject(result);//읽어온 xml을 JSON으로 parsing(이 API의 경우 응답을 xml타입으로 줌)
        System.out.println("xml을 JSON으로 바꾼 결과~~~~~~~~~~~~~~~~~~~~~~~~~");
        System.out.println(json);
        JSONObject i = (JSONObject) json.get("response");
        JSONObject i2 = (JSONObject) i.get("body");
        JSONObject i3 = (JSONObject) i2.get("items");
        org.json.JSONArray i4 = i3.getJSONArray("item");
        
        JSONArray arr = new JSONArray();//JSONArray[JSONObject] 형태로 만들어서 보내줌
        JSONArray sulArr = new JSONArray();// 설날-설날-설날 의 형태로 나오기 때문에 바꾸어주어야함
        JSONArray chuArr = new JSONArray();// 추석-추석-추석
        
		for (int j = 0; j < i4.length(); j++) {
			String date = i4.getJSONObject(j).get("locdate").toString().substring(0,4) + "-"
					+i4.getJSONObject(j).get("locdate").toString().substring(4,6) + "-"
					+i4.getJSONObject(j).get("locdate").toString().substring(6,8);
			JSONObject jsonObj = new JSONObject();
			if(i4.getJSONObject(j).get("dateName").toString().equals("신정")||date.equals(year+"-01-01")) { 
				jsonObj.put("title", "신정");// 1월1일이라고 표기되어 있는 년도가 있음
			}else{
				jsonObj.put("title", i4.getJSONObject(j).get("dateName"));
			}
			jsonObj.put("id", "holiday"+i4.getJSONObject(j).get("dateName"));
			jsonObj.put("category", "time");
			jsonObj.put("start", date);
			jsonObj.put("end", date);
			jsonObj.put("isAllDay","true");
			jsonObj.put("isReadOnly","true");
			jsonObj.put("color","white");
			jsonObj.put("bgColor","red");
			if(i4.getJSONObject(j).get("dateName").toString().equals("설날")) {//설날 정보 따로 저장
				sulArr.add(jsonObj);
			}else if(i4.getJSONObject(j).get("dateName").toString().equals("추석")) {//추석 정보 따로 저장
				chuArr.add(jsonObj);
			}else {
				arr.add(jsonObj);
			}
		}
		
		arr.add(startEndChange(sulArr));
		arr.add(startEndChange(chuArr));
		
		
		
		System.out.println(arr.toJSONString());
		
		return arr.toJSONString();
	}
	
	/**
	 * 시작일의 end를 마지막날의 end로 바꾸어줌
	 * 추석, 설날의 경우 설날-설날-설날의 형태로 출력되어 수정이 필요하였음
	 * @return 끝나는 날의 end 날짜를 가져와 첫날의 end로 바꾸어준 첫날의 값
	 */
	public JSONObject startEndChange(JSONArray jsonArr) {
		JSONObject endInfo = (JSONObject)jsonArr.get(jsonArr.size()-1);
		String endDate = endInfo.getString("end");
		JSONObject info = (JSONObject)jsonArr.get(0);
		info.put("end", endDate);	
		return info;
	}
	
	/**
	 * DB에서 일정 목록을 불러와서 JSONArray[JSONObject] 형태로 만들어서 보내줌
	 * key의 경우 https://nhn.github.io/tui.calendar/latest/Schedule 에서 확인
	 * @return DB에 저장된 일정 목록
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/callSchedule.do",method=RequestMethod.POST)
	@ResponseBody
	public JSONArray callSchedule(@RequestParam(value="list[]") List<String> nameList , HttpServletRequest req) {
		System.out.println(nameList);
		HttpSession session = req.getSession();
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userList", nameList);
		map.put("memId", loginVo.getMemberId()); //접속한 사용자 아이디
		List<WbsViewVo> lists = service.getTeamSchedule(map);//DB에서 일정목록을 불러옴
		System.out.println("받아온 리스트@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println(lists);
		JSONArray arr = new JSONArray();//JSONArray[JSONObject] 형태로 만들어서 보내줌
		for (int i = 0; i < lists.size(); i++) {
			org.json.simple.JSONObject jsonObj = new org.json.simple.JSONObject();
			jsonObj.put("id", lists.get(i).getWbsId());
			jsonObj.put("calendarId",lists.get(i).getProjName());
			jsonObj.put("title", lists.get(i).getWbsName());
			jsonObj.put("category", "time");
			jsonObj.put("start", lists.get(i).getWbsStartDate());
			jsonObj.put("end", lists.get(i).getWbsEndDate());
			jsonObj.put("isAllDay","true");
			jsonObj.put("isPrivate","true");
			jsonObj.put("isReadOnly", "true");
			jsonObj.put("color","white");
			jsonObj.put("bgColor","gray");
			jsonObj.put("body", lists.get(i).getWbsManager());
			jsonObj.put("location", lists.get(i).getWbsConent());
			arr.add(jsonObj);
		}
		System.out.println(arr.toJSONString());
		return arr;
	}
	
	@RequestMapping(value="/insertSchedule.do", method=RequestMethod.POST)
	@ResponseBody
	public int insertSchedule(@RequestParam
				String title, String content, String start, String end, HttpServletRequest req
			){
		logger.info("받아온 값 : {}",title +"/"+ content +"/"+ start +"/"+ end);
		HttpSession session = req.getSession();
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(title + content);
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		map.put("mId", loginVo.getMemberId());//로그인된 회원의 ID
		map.put("sName", title);
		map.put("sCont", content);
		map.put("start", start);
		map.put("end", end);
		int cnt = 0;
		cnt = service.pScheduleInsert(map);
		System.out.println(map.toString());
		return cnt;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/showPersonalSchedule.do",method=RequestMethod.POST,produces = "application/text; charset=utf8")
	@ResponseBody
	public String showPersonalSchedule(@RequestParam String memberId) {
		List<ScheduleVo> lists = service.pScheduleShow(memberId);
		System.out.println("받아온 리스트@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println(lists);
		JSONArray arr = new JSONArray();//JSONArray[JSONObject] 형태로 만들어서 보내줌
		for (int i = 0; i < lists.size(); i++) {
			org.json.simple.JSONObject jsonObj = new org.json.simple.JSONObject();
			jsonObj.put("id", lists.get(i).getScheId());
			jsonObj.put("calendarId",lists.get(i).getMemId());
			jsonObj.put("title", lists.get(i).getScheName());
			jsonObj.put("category", "time");
			jsonObj.put("start", lists.get(i).getScheStart());
			jsonObj.put("end", lists.get(i).getScheEnd());
			jsonObj.put("isAllDay","true");
			jsonObj.put("isPrivate","false");
			jsonObj.put("color","white");
			jsonObj.put("bgColor","green");
			jsonObj.put("location", lists.get(i).getScheContent());
			arr.add(jsonObj);
		}
		System.out.println(arr.toJSONString());
		String result = arr.toJSONString();
		return result;
	}
	
	@RequestMapping(value="/deleteSchedule.do", method = RequestMethod.GET)
	@ResponseBody
	public int deleteSchedule(@RequestParam String sId, String mId) {
		logger.info("개인 일정 삭제 화면에서 넘겨받은 값{}",sId+mId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sId", sId);
		map.put("mId", mId);
		int cnt = service.pScheduleDelete(map);
		System.out.println(cnt);
		return cnt;
	}
	
	@RequestMapping(value="/updateSchedule.do", method = RequestMethod.POST)
	@ResponseBody
	public int deleteSchedule(@RequestParam
			String sId, String mId, String sName, String sCont, String start, String end) {
		logger.info("개인 일정 업데이트 화면에서 넘겨받은 값{}",sId+"/"+mId+"/"+sName+"/"+sCont+"/"+start+"/"+end);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sId", sId);
		map.put("mId", mId);
		map.put("sName", sName);
		map.put("sCont", sCont);
		map.put("start", start);
		map.put("end", end);
		int cnt = service.pScheduleUpdate(map);
		System.out.println(cnt);
		return cnt;
	}
	
	@RequestMapping(value="/completeSchedule.do", method = RequestMethod.POST)
	@ResponseBody
	public int completeSchedule(@RequestParam
			String wbsId) {
		logger.info("일정 완료 화면에서 넘겨받은 값{}",wbsId);
		int cnt = service.completeSchedule(wbsId);
		System.out.println(cnt);
		return cnt;
	}
	
	@RequestMapping(value="/incompleteSchedule.do", method = RequestMethod.POST)
	@ResponseBody
	public int incompleteSchedule(@RequestParam
			String wbsId) {
		logger.info("일정 완료 화면에서 넘겨받은 값{}",wbsId);
		int cnt = service.incompleteSchedule(wbsId);
		System.out.println(cnt);
		return cnt;
	}

	@RequestMapping(value="/checkAuth.do", method=RequestMethod.POST)
	@ResponseBody
	public boolean checkAuth(@RequestParam String memId) {
		boolean isc = false;
		logger.info("PM 유무 체크 받은 값 {}",memId);
		String auth = service.checkAuth(memId);
		if(auth.equals("Y")){
			isc = true;
		}else {
			isc = false;
		}
		return isc;
	}

}
