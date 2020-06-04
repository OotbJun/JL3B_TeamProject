package com.jl3b.touche_nubes.vote.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jl3b.touche_nubes.membervo.ResiVo;
import com.jl3b.touche_nubes.vote.service.VoteService;
import com.jl3b.touche_nubes.votevo.CandyVo;

@Controller
@RequestMapping("/vote/*")
public class VoteController {
	
	@Autowired
	private VoteService voteService;
	
	//글쓰기 페이지
	@RequestMapping("candy_write.jan")
	public String writeCandy() {
		return "vote/candy_write";
	}
	@RequestMapping("candy_write_process.jan")
	public String writeCandyProcess(CandyVo candyVo, HttpSession session) {
		
		ResiVo resiVo = (ResiVo)session.getAttribute("sessionUser");
		candyVo.setResi_no(resiVo.getResi_no());
		System.out.println("test : "+candyVo.getResi_no());
		voteService.writeCandy(candyVo);
		
		return "redirect:./";
	}
	
}
