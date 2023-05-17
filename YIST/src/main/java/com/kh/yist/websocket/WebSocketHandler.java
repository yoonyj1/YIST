package com.kh.yist.websocket;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.yist.member.model.vo.Member;

// @Configuration 빈 객체 자동생성 함수.
@Configuration
public class WebSocketHandler extends TextWebSocketHandler {

	// 로그인 한 전체
	// ArrayList<WebSocketSession> sessions = new ArrayList<WebSocketSession>();

	// 로그인중인 개별유저
	Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();

	// 전체 공지시
	// 로그인한 전체 아이디
	ArrayList<String> userArr = new ArrayList<String>();

	// 클라이언트가 서버로 연결시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String senderId = getMemberId(session); // 접속한 유저의 http세션을 조회하여 id를 얻는 함수
		if (senderId != null) { // 로그인 값이 있는 경우만
			log(senderId + " 연결 됨");

			// 기존 로그인한 세션 구분
			if (!users.containsKey(senderId)) {
				userArr.add(senderId);
				users.put(senderId, session); // 로그인중 개별유저 저장
			}

			// 현재 로그인한 세션
			for (String key : users.keySet()) {
				log("현재 로그인한 세션 : " + key);
			}

		}
	}

	
	// 클라이언트가 Data 전송 시
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String senderId = getMemberId(session);
		
		// 특정 유저에게 보내기
		String msg = message.getPayload();
		System.out.println(msg);

		if (msg != null) {
			String[] strs = msg.split(",");
			log(strs.toString());
			if (strs != null && strs.length == 4) {
				String type = strs[0];
				String target = strs[1]; // m_id 저장
				String content = strs[2];
				String user = strs[3];
				
				WebSocketSession targetSession = null;
				
				if (target.equals("all")) { // 전체 메세지
					for (String userId : users.keySet()) {
						if (userId.equals(user)) {
							System.out.println("지나감");
							continue;
						}
						targetSession = users.get(userId);
						
						if (targetSession != null) {
							TextMessage tmpMsg = new TextMessage(content);
							targetSession.sendMessage(tmpMsg);
						}
					}
					
				} else { // 개별 메세지
					
					targetSession = users.get(target); // 메시지를 받을 세션 조회

					TextMessage tmpMsg = new TextMessage(content);
					targetSession.sendMessage(tmpMsg); 
				}
				 

			}
		}
	}

	// 연결 해제될 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String senderId = getMemberId(session);
		if (senderId != null) { // 로그인 값이 있는 경우만
			log(senderId + " 연결 종료됨");
			users.remove(senderId);
			//sessions.remove(session);
		}
	}

	// 에러 발생시
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());

	}

	// 로그 메시지
	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}

	// 웹소켓에 id 가져오기
	// 접속한 유저의 http세션을 조회하여 id를 얻는 함수
	private String getMemberId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();

		Member m = (Member) httpSession.get("loginUser");
		
		String m_id = m.getId();

		return m_id == null ? null : m_id;
	}

}
