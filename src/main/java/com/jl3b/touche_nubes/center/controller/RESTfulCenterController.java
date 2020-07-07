package com.jl3b.touche_nubes.center.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jl3b.touche_nubes.center.service.CenterService;
import com.jl3b.touche_nubes.centervo.ReserveVo;
import com.jl3b.touche_nubes.membervo.MemberVo;

@Controller
@ResponseBody
@RequestMapping("/center/*")
public class RESTfulCenterController {

	@Autowired
	private CenterService centerService;
	
	//예약하기
	@RequestMapping("/reserve_process.do")
	public String check(ReserveVo reserveVo, HttpSession session, Model model, int lesson_people) {
		
		if (session.getAttribute("sessionUser") == null) {
			return "member/login";
		}
		
		System.out.println("  : "+reserveVo.getLesson_no());

		int memberVo = ((MemberVo) session.getAttribute("sessionUser")).getMember_no();
		reserveVo.setMember_no(memberVo);

		ReserveVo reserve = centerService.check(reserveVo); // 중복방지 본인확인
		
		model.addAttribute("reserve", reserve);
		centerService.updateHorsehead(lesson_people);

		if (reserve == null) {
			centerService.create(reserveVo);			
			return "true";
		} else {
			centerService.delete(reserveVo);	
			return "false";
		}
		

	
	}
	
	//예약자 수 출력
	@RequestMapping("/get_people.do")
	public int getPeople(int lesson_no) {
		int people = centerService.countbyReserve(lesson_no);

		return people;
	}
		
}

