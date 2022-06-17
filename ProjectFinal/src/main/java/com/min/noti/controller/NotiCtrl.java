package com.min.noti.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.min.noti.service.INotiService;
import com.min.noti.vo.NotiVo;
import com.min.sche.controller.ScheduleCtrl;
import com.min.sche.service.IScheduleService;
import com.min.sche.vo.ScheduleVo;

@Controller
@SessionAttributes("loginVo")
public class NotiCtrl {
	
	String memId;

	
	@Autowired
	private INotiService service;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}
	
	
	@RequestMapping(value = "/notifieded.do", method = RequestMethod.POST)
	public Map<String, Object> notifieded(@RequestParam Map<String, Object> map){
		logger.info("notifided : 사용자가 알림을 받으면 Y를 N으로 바꾸는 기능");
		Map<String,Object> map1 = new HashMap<String, Object>();
		Map<String,Object> map2 = new HashMap<String, Object>();
		logger.info("notifided notiId : {}", map.get("notiId"));
		map1.put("notiId", map.get("notiId") );
		int n = service.notification_update(map1);
		logger.info("notification_update 결과 : {} ", n);
		if(n>0) {
			map2.put("isc","성공");
		}else {
			map2.put("isc","실패");
		}
		return map2;
	}
	
	@RequestMapping(value= "/ArlimList.do", method = RequestMethod.GET)
	public String ArlimList(Model model) {
		logger.info("ArlimList 알림함에 리스트를 뿌리는 기능");
		String s = null;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memId", getMemId());
		List<NotiVo> AllLists=service.notification_my_noti(map);
		logger.info("notification_my_noti : {}", AllLists);
		model.addAttribute("AllLists",AllLists);	

		
		
		return "ArlimList";
	}
	
	@RequestMapping(value = "/deleteArlim.do", method = RequestMethod.POST)
	public Map<String, Object> deleteArlim(@RequestParam Map<String, Object> map){
		logger.info("deleteArlim 알림을 삭제하는 기능");
		Map<String,Object> map1 = new HashMap<String, Object>();
		Map<String,Object> map2 = new HashMap<String, Object>();
		map1.put("notiId", map.get("notiId") );
		int n = service.notification_delete(map1);
		logger.info("notification_delete : {}", map1);
		if(n>0) {
			map2.put("isc","성공");
		}else {
			map2.put("isc","실패");
		}
		return map2;
	}
	
	@RequestMapping(value = "/callHeader.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> callHeader(@RequestParam Map<String, Object> map, Model model,  @RequestParam("notiId") String memId){
		logger.info("callHeader 전체 페이지에 알림이 가도록 하는 기능");
		Calendar cal = Calendar.getInstance();
		Date nowDate = new Date();
		cal.setTime(nowDate);
		cal.add(Calendar.DATE , 1);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd" );
		String date2 = formatter.format(cal.getTime());
		Date currentDate = null;
		Date notiDate = null;
			
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		Map<String, Object> map3 = new HashMap<String, Object>();
		map2.put("memId", memId);
		setMemId(memId);
	

//		service.notification_delete_All();
//		service.notification_insert_privacy();
//		service.notification_insert_team();	
		
		List<NotiVo> All_lists=service.notification_my_noti(map2);
		ArrayList<NotiVo> lists = new ArrayList<NotiVo>();
		
		for (int i = 0; i < All_lists.size(); i++) {	
			String s = All_lists.get(i).getNotiRegdate();
						try {
							currentDate = formatter.parse(date2);
							notiDate = formatter.parse(s);
						} catch (ParseException e) {
							e.printStackTrace();
						}
			int compare = notiDate.compareTo( currentDate );
			if(compare == 0) {
				NotiVo nvo = All_lists.get(i);
				lists.add(nvo);
			}
		}
		System.out.println("으에에에에에ㅔㅇ에에에ㅔ에에에에ㅔㅇㅇ" +All_lists);
		
		logger.info("");
		int count = service.notification_count(map2);
		map3.put("lists", All_lists);
		map3.put("count", count);

		return map3;
	}
	
}
