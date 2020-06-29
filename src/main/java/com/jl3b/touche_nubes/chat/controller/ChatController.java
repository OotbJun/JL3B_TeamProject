package com.jl3b.touche_nubes.chat.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jl3b.touche_nubes.chat.service.ChatService;
import com.jl3b.touche_nubes.chatvo.ChatVo;
import com.jl3b.touche_nubes.membervo.MemberVo;

@Controller
@RequestMapping("/chat/*")
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	
	@RequestMapping("/chat.do")
	public String enterChatRoom(HttpSession session) {
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		//chatVo.setMember_no(memberVo.getMember_no());
		chatService.enterChat(memberVo.getMember_no());
		
		
		return "chat/chat";
	}
	
	@RequestMapping("/write_chat_process.do")
	@ResponseBody
	public String writeChat(ChatVo chatVo, HttpSession session) {
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		chatVo.setMember_no(memberVo.getMember_no());
		chatService.writeChat(chatVo);
		
		return "true";
	}
	
	@RequestMapping("/read_chat.do")
	@ResponseBody
	public List<Map<String, Object>> readChat(int chat_no) {
		
		List<Map<String, Object>> chatList = chatService.readChat(chat_no);
		
		return chatList;
	}
	
}
