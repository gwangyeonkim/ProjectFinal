package com.min.noti.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component(value = "wsChat.do")
public class MySocketHandler extends TextWebSocketHandler {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private ArrayList<WebSocketSession> list; // 웹소켓 세션을 담아 주는 객체(채팅 대상을 담음)
	private Map<WebSocketSession, String> map = new HashMap<WebSocketSession, String>(); //이름
	
	public MySocketHandler() {
		list = new ArrayList<WebSocketSession>();
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("웹소켓 커넥션 생성 afterConnectionEstablished");
		super.afterConnectionEstablished(session);
		list.add(session);
		logger.info("웹소켓 커넥션이 생성되어 참여 하고 있는 SessionID : {}", session.getId());
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info("웹소켓 세션 삭제  afterConnectionClosed");
		super.afterConnectionClosed(session, status);
		// 채팅창이 닫기거나 Websocket에서 close()를 했다면 
		// WebSocketSession을 삭제 하여 데이터가 전송되지 않도록 함
		logger.info("웹소켓 세션 삭제 : {}" , session);
		list.remove(session);
		
		// 화면에 메시지 보내주기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH24:mm:ss");
		String out = sdf.format(new Date());
		for (WebSocketSession s : list) {
			s.sendMessage(new TextMessage("<font style='color:tomato; size:5px;'>"+map.get(session)+"님이 방을 나갔습니다("+out+")</font>"));
		}
		logger.info("웹소켓 세션 이름 삭제 : {}" , map.get(session));
		map.remove(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("웹소켓 메시지 전달 : handleTextMessage");
		String msg = message.getPayload();
		String msgToString = message.toString();
		
		logger.info("전달된 메시지 getPlayLoad() : {}" , msg);
		logger.info("전달된 메시지 toString() : {}" , msgToString);
		
//		StringUtils.defaultIfEmpty(msg, "true")
		if(msg != null && !msg.equals("")) {
			if(msg.indexOf("#&nick_") != -1) {
				map.put(session, msg.replace("#&nick_", ""));
				logger.info(session +"의 이름 : {}" , map.get(session));
				
				for (WebSocketSession s : list) {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH24:mm:ss");
					String out = sdf.format(new Date());
//					s.sendMessage(new TextMessage("<font style='color:forestgreen; size:5px;'>"+map.get(session)+"님이 입장하셨습니다("+out+")</font>"));	
				}
				
			}else { //머릿말 "#&nick_" 없다면 채팅글 이기 때문에 모든 참여자에게 메시지를 보낸다
				for (WebSocketSession s : list) {
					String m = "<font style='color:black; size:5px;'>"+msg+"</font>)";
					s.sendMessage(new TextMessage(m));
				}
			}
		}
		
		super.handleTextMessage(session, message);
	}
	
}






