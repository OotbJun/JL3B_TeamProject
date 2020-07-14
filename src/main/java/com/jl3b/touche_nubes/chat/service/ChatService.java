package com.jl3b.touche_nubes.chat.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jl3b.touche_nubes.chat.mapper.ChatSQLMapper;
import com.jl3b.touche_nubes.chatvo.ChatVo;
import com.jl3b.touche_nubes.member.mapper.MemberSQLMapper;
import com.jl3b.touche_nubes.membervo.MemberVo;

@Service
public class ChatService {
	
	@Autowired
	private ChatSQLMapper chatSQLMapper;
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	
	//채팅 입력
	public void writeChat(ChatVo chatVo) {
		chatSQLMapper.insertChat(chatVo);
	}
	
	//채팅 출력
	public List<Map<String, Object>> readChat(int chat_no) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<ChatVo> chatList = null;
		
		chatList = chatSQLMapper.selectChat(chat_no);
				
		
		System.out.println("챗 넘버 : " + chat_no);
		
		for(ChatVo chatVo : chatList) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			//MemberVo memberVo = memberSQLMapper.selectMemberByNo(chatVo.getMember_no());
			
			
			//map.put("memberVo", memberVo);
			map.put("chatVo", chatVo);
			
			list.add(map);
		}
		return list;
	}
	
	//채팅방 입장
	public void enterChat(ChatVo chatVo) {
		
		chatSQLMapper.enterChat(chatVo);
	}
	
	//채팅 최신 내용 출력
	public Integer newChatNo() {					//Integer 이유 : 채팅 테이블에 로우가 하나도 없을 때 아래 쿼리 결과가 null값 나오는데
													//				 int는 기본 타입이라 null 못 담아서 Integer로 처리.
		return chatSQLMapper.newChatNo();			//MAX값을 뽑아서 내가 입장한 이후의 채팅만 보이게끔
	}
}
