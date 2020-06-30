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
	public String enterChatRoom(HttpSession session, ChatVo chatVo, Model model) {
		
		if(session.getAttribute("sessionCenter") != null ) {
			return "./board/center_fail";
		}
		if(session.getAttribute("sessionUser") == null) {
			return "./board/board_fail";
		}
		
		try{
			int chat_no = chatService.newChatNo();
			model.addAttribute("chat_no", chat_no);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		chatVo.setMember_no(memberVo.getMember_no());
		chatVo.setMember_rname(memberVo.getMember_rname());
		chatService.enterChat(chatVo);
		
		
		return "chat/chat";
	}
	
	@RequestMapping("/write_chat_process.do")
	@ResponseBody
	public String writeChat(ChatVo chatVo, HttpSession session) {
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		chatVo.setMember_no(memberVo.getMember_no());
		chatVo.setMember_rname(memberVo.getMember_rname());
		chatService.writeChat(chatVo);
		
		return "true";
	}
	
	@RequestMapping("/read_chat.do")
	@ResponseBody
	public List<Map<String, Object>> readChat(int chat_no, Model model) {
		
		List<Map<String, Object>> chatList = chatService.readChat(chat_no);
		model.addAttribute("chatList", chatList);
		
		return chatList;
	}
	
}
