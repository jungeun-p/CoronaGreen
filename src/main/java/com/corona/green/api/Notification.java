package com.corona.green.api;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.corona.green.model.dto.MemberDto;

/**
 * 
 * @Title : 웹소켓 핸들러
 * @author : yangjaewoo
 * @date : 2019. 11. 19.
 */
public class Notification extends TextWebSocketHandler {
	//로그인 한 전체
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 1대1
	Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
		
	//서버에 접속이 성공 했을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//맵을 쓸때 방법
		//session.put(session.getId(),session)
		//List쓸때 방법
		sessions.add(session);	//접속되어 있는 유저들을 담는다 
		//세션값을 불러옴 
		String senderEmail = getEmail(session);	//세션 연결된 사람의 값을 가져와야한다
		userSessionsMap.put(senderEmail , session);
		
	}
	
	//클라이언트가 서버로 메시지를 전송했을때 ,소켓에 메세지를 보냈을때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//		String senderEmail = getEmail(session);
		//모든 유저에게 보낸다 - 브로드 캐스팅
//		for (WebSocketSession sess : sessions) {
//			sess.sendMessage(new TextMessage(senderNickname + ": " +  message.getPayload()));
//		}

		//protocol : cmd , 댓글작성자, 게시글 작성자 , seq (reply , user2 , user1 , 12)
		
		//메세지내용가져오기 , payload: 전송되는 데이터
		String msg = message.getPayload();	
		//메세지가 비어있지 않다면 
		 if(StringUtils.isNotEmpty(msg)) { 
			JSONParser parser=new JSONParser();
			JSONObject obj=(JSONObject)parser.parse(msg);
			
				String recipient = (String)obj.get("recipient");
				String sender = (String)obj.get("sender");
				String alarm_title = (String)obj.get("alarm_title");
				String alarm_content = (String)obj.get("alarm_content");
				String alarm_date = (String)obj.get("alarm_date");
				String alarm_boardno=(String)obj.get("alarm_boardno");
				
				//작성자가 로그인 해서 있다면 알림보냄
				WebSocketSession boardWriterSession = userSessionsMap.get(recipient);	//알림 받는사람
				
				//로그인한 상태라면 
				if(boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(msg);
					boardWriterSession.sendMessage(tmpMsg);
				}
			}
		}
	
	//연결 해제될때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		userSessionsMap.remove(session.getId());
		sessions.remove(session);
	}
	
	//웹소켓 email 가져오기
	private String getEmail(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		MemberDto loginUser = (MemberDto)httpSession.get("dto");
		
		if(loginUser == null) {
			return session.getId();
		} else {
			return loginUser.getId();
		}
	}
}