package com.min.noti.controller;

//import static org.springframework.test.web.client.match.MockRestRequestMatchers.method;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.ServletConfigAware;

@Controller
@SessionAttributes("userList")
public class SocketController  implements ServletConfigAware{
	
	private ServletContext servletContext;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void setServletConfig(ServletConfig servletConfig) {
		servletContext = servletConfig.getServletContext();
	}
	

	//--------------- 그룹체팅 ------------------//
	@RequestMapping(value = "/groupChat.do" , method = RequestMethod.GET)
	public String groupChat() {
		logger.info("그룹 체팅 이동");
		return "groupChat";
	}
	
	// WebSocket 채팅 접속 했을 때
	@RequestMapping(value = "/socketOpenGr.do" , method = RequestMethod.GET)
	public String socketOpenGr(HttpSession session, String mem_id, String gr_id, Model model) {
		logger.info("socketOpenGr 소켓화면 이동 1) 리스트에 접속자 넣기");
		
		session.setAttribute("mem_id", mem_id);
		session.setAttribute("gr_id", gr_id);
		model.addAttribute("userList", mem_id);
		
		@SuppressWarnings("unchecked")
		HashMap<String, String> chatList = (HashMap<String, String>)servletContext.getAttribute("chatList");
		if(chatList == null) {
			chatList = new HashMap<String, String>();
			chatList.put(mem_id, gr_id);
			servletContext.setAttribute("chatList", chatList);
		}else {
			chatList.put(mem_id, gr_id);
			servletContext.setAttribute("chatList", chatList);
		}
		logger.info("socketOpenGr 소켓화면 이동 2) 리스트값 전달");
		return "groupChatView2";
	}
	
	// WebSocket 채팅이 종료 됐을때
	@RequestMapping(value = "/socketOut.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public void socketOut(HttpSession session, Model model) {
		logger.info("socketOut 소켓에서 나오기");
		String mem_id = (String)session.getAttribute("mem_id");
		HashMap<String, String> chatList =  (HashMap<String, String>)servletContext.getAttribute("chatList");
		 
		 System.out.println("기존 접속 회원 리스트 : " + chatList);
		 
		 if(chatList != null) {
			  chatList.remove(mem_id);
		 }
		 HashMap<String, String> removeSession = chatList;
		 session.getAttribute("mem_id");
		 System.out.println("갱신 후 접속 회원 리스트 chatList☆★☆★☆★ : "+ chatList);
		 System.out.println("session ☆★☆★☆★" +session.getAttribute("mem_id"));
		 servletContext.setAttribute("removeSession", removeSession);
		 
	}
	
	
	@RequestMapping(value = "/viewChatList.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Map<String, String>> viewChatList(){
		Map<String, Map<String, String>> map = new HashMap<String, Map<String,String>>();
		@SuppressWarnings("unchecked")
		HashMap<String, String> chatList =  (HashMap<String, String>)servletContext.getAttribute("chatList");
		HashMap<String, String> removeSession = (HashMap<String,String>)servletContext.getAttribute("removeSession");
		logger.info("출력되는 chatList " + removeSession);
		map.put("chatList", chatList);
		map.put("list", removeSession);
		return map;
	} 
}





