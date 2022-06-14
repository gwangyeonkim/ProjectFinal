package com.min.noti.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.min.noti.service.INotiService;
import com.min.noti.vo.NotiVo;

@Controller
@SessionAttributes("loginVo")
public class NotiCtrl {
	
	@Autowired
	private INotiService service;
	
	@RequestMapping(value= "/.do", method = RequestMethod.GET)
	@ResponseBody
	public String regist2(Model model, HttpSession session) {
		//시간 구하기
		Calendar cal = Calendar.getInstance();
		Date nowDate = new Date();
		cal.setTime(nowDate);
		cal.add(Calendar.DATE , 1);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd" );
		String date2 = formatter.format(cal.getTime());
		System.out.println("@@@@@@@@@@@@@@"+(String) date2);
		Date currentDate = null;
		Date notiDate = null;
		
		
//		service.notification_insert_privacy();
//		service.notification_insert_team();
		
		System.out.println(session + "☆★☆★☆★☆★☆★☆★☆★꺄하하하하");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", "GD006");
		List<NotiVo> All_lists=service.notification_my_noti(map);
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
		System.out.println(lists);
		
		//알림 갯수
		int count = service.notification_count(map);
		System.out.println(count + "☆★☆★☆★☆★☆★☆★☆★");
	
		model.addAttribute("lists",lists);	
		model.addAttribute("count",count);
		return "header";
	}
	
	@RequestMapping(value = "/notifieded.do", method = RequestMethod.POST)
	public Map<String, Object> notifieded(@RequestParam Map<String, Object> map){
		Map<String,Object> map1 = new HashMap<String, Object>();
		Map<String,Object> map2 = new HashMap<String, Object>();
		map1.put("notiId", map.get("notiId") );
		int n = service.notification_update(map1);
		if(n>0) {
			map2.put("isc","성공");
		}else {
			map2.put("isc","실패");
		}
		return map2;
	}
	
	@RequestMapping(value= "/ArlimList.do", method = RequestMethod.GET)
	public String ArlimList(Model model) {
		String s = null;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memId", "CH001");
		List<NotiVo> AllLists=service.notification_my_noti(map);
		model.addAttribute("AllLists",AllLists);	
		return "ArlimList";
	}
	
	@RequestMapping(value = "/deleteArlim.do", method = RequestMethod.POST)
	public Map<String, Object> deleteArlim(@RequestParam Map<String, Object> map){
		Map<String,Object> map1 = new HashMap<String, Object>();
		Map<String,Object> map2 = new HashMap<String, Object>();
		System.out.println("@@@@@@@@@@@"+map.get("notiId"));
		map1.put("notiId", map.get("notiId") );
		int n = service.notification_delete(map1);
		if(n>0) {
			map2.put("isc","성공");
		}else {
			map2.put("isc","실패");
		}
		return map2;
	}
}
