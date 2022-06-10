package com.min.noti.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component(value = "wsChatGr.do")
public class MySocketHandlerGr extends TextWebSocketHandler{
	
		private final Logger logger = LoggerFactory.getLogger(MySocketHandlerGr.class);
	
		// WebSocket sessionn을 담는 객체
		private ArrayList<WebSocketSession> list ; 
		
		public MySocketHandlerGr() {
			list = new ArrayList<WebSocketSession>();
		}
		
		// 웹소켓이 연결되면 호출되는 함수
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			logger.info("afterConnectionEstablished() 실행 {}" ,session);
			super.afterConnectionEstablished(session);
			
			// 전체 접속자 리스트에 새로운 접속자 추가
			list.add(session); 
			Map<String, Object> sessionMap = session.getAttributes();
			String grSession = (String)sessionMap.get("gr_id");
			String memSession = (String)sessionMap.get("mem_id");
			System.out.println("Cliecnt session cnt : " + list.size());
			System.out.println("Session connected : " + grSession);
			System.out.println("Session connected : " + memSession);
		}
		
		//웹소켓 클라이언트가 텍스트 메세지 전송시 호출되는 메소드
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			logger.info("handleTextMessage() 실행");
			String msg = message.getPayload();
			String txt = "";
			
			Map<String, Object> mySession = session.getAttributes(); // WebSocketSession의 값을 HttpSession값으로 변경
			String myGrSession = (String)mySession.get("gr_id");  // 접속 그룹 아이디
			String myMemSession = (String)mySession.get("mem_id"); // 접속자 아이디
			
			if(msg != null && !msg.equals("")) {
				if(msg.indexOf("#$nick_")>-1) {
					for (WebSocketSession s : list) {
						Map<String, Object> sessionMap = s.getAttributes();
						String otherGrSession = (String)sessionMap.get("gr_id");
						String otherMemSession = (String)sessionMap.get("mem_id");
						
						System.out.println("그룹아이디 : "+ myGrSession);
						System.out.println("멤버아이디 : " + otherMemSession);
				
						if(myGrSession.equals(otherGrSession)) { //같은 그룹
//							s.sendMessage(new TextMessage("<font color='black' size='3px' text align='center'>"+myMemSession+"님이 입장했습니다</font>"));
							s.sendMessage(new TextMessage("<"+myMemSession+">님이 입장했습니다"));
						}
						
					}
				} else {
					String msg2 = msg.substring(0, msg.indexOf(":")).trim();
					for (WebSocketSession s : list) {
						Map<String, Object> sessionMap = s.getAttributes();
						String otherGrSession = (String)sessionMap.get("gr_id");
						String otherMemSession = (String)sessionMap.get("mem_id");
						if(myGrSession.equals(otherGrSession)) { //같은 그룹
							if(msg2.equals(otherMemSession)) {
								String newMsg = "[나]" + msg.replace(msg.substring(0,msg.trim().indexOf(":")+1),"");
								System.out.println("newMsg :"+newMsg);
								txt = newMsg;
							}else {
								String part1 =msg.substring(0,msg.trim().indexOf(":")).trim();
								System.out.println(part1);
//								String part2 = "["+part1+"]" +msg.substring(msg.trim().indexOf(":")+1);
								String part2 = part1+"]" +msg.substring(msg.trim().indexOf(":")+1);
								txt = part2;
							}
							s.sendMessage(new TextMessage(txt));
						}
					}
				}
			}
			
			
			super.handleTextMessage(session, message);
		}
		
		//웹소켓이 연결이 종료되면 호출되는 함수
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			logger.info("afterConnectionClosed() 실행");
			super.afterConnectionClosed(session, status);
			
			Map<String, Object> mySession = session.getAttributes();
			String myGrSession = (String)mySession.get("gr_id");
			String myMemSession = (String)mySession.get("mem_id"); 
			System.out.println("받아온 session" + mySession); 
			System.out.println("세션 삭제 확인 전 : " +  list.contains(session));
			System.out.println("세션 삭제 확인 전 : " + myGrSession);
			System.out.println("세션 삭제 확인 전 : " + myMemSession);
			list.remove(session);
			System.out.println("세션 삭제 확인 후 : " +  list.contains(session));
			
			for (WebSocketSession s : list) {
				Map<String, Object> sessionMap = s.getAttributes(); 
				String otherGrSession = (String)sessionMap.get("gr_id");
				if(myGrSession.equals(otherGrSession)) {
					s.sendMessage(new TextMessage("<"+myMemSession+">님이 퇴장했습니다"));
				}
			}
			
			
			
			
			
		}
		
		
		
}








