package com.jl3b.touche_nubes.chat.mapper;

import java.util.List;

import com.jl3b.touche_nubes.chatvo.ChatVo;

public interface ChatSQLMapper {
	
	public void insertChat(ChatVo chatVo);						//채팅 입력
	public List<ChatVo> selectChat(int chat_no);				//채팅 출력
	public void enterChat(ChatVo chatVo);						//채팅방 입장하면 찍히게(출력 기준 잡기)
	public int newChatNo();										//입장한 이후로 채팅 내용 가져오려고
}
