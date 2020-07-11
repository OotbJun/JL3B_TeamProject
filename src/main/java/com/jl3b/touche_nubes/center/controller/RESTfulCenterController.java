package com.jl3b.touche_nubes.center.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jl3b.touche_nubes.center.service.CenterService;
import com.jl3b.touche_nubes.centervo.LessonVo;
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
	public String check(ReserveVo reserveVo, HttpSession session, Model model, LessonVo lessonVo) {
		
		if (session.getAttribute("sessionUser") == null) {
			return "member/login";
		}
		

		int memberVo = ((MemberVo) session.getAttribute("sessionUser")).getMember_no();
		reserveVo.setMember_no(memberVo);

		ReserveVo reserve = centerService.check(reserveVo); // 중복방지 본인확인
		
		model.addAttribute("reserve", reserve);
		

		if(reserve == null) {
			centerService.create(reserveVo);			
			return "true";
		}else {
			return "false";						//예약 취소 마이페이지에서 하는 걸로
		}
		

	
	}
	
	//예약자 수 출력
	@RequestMapping("/get_people.do")
	public int getPeople(int lesson_no) {
		int people = centerService.countbyReserve(lesson_no);

		return people;
	}
	
	@RequestMapping("/update_horsehead.do")
	@ResponseBody
	public Map<String,Object> horsehead(HttpSession session,LessonVo lessonVo) {
		
		Map<String,Object> rr = new HashMap<String, Object>();
		
		System.out.println("레슨 넘버 : " + lessonVo.getLesson_no());
		
		
		if (session.getAttribute("sessionUser") == null) {
			//return "member/login";
			rr.put("result", "fail");
			rr.put("reason", "로그인을 해야 됩니다.");
			return rr;
		}
		
		int horseLessonpeople = centerService.horseLessonpeople(lessonVo);
		int horsepeople = centerService.horsepeople(lessonVo);
		
		System.out.println("horsepeople : " + horsepeople);
		System.out.println("horseLesson : " + horseLessonpeople);
		
		if(horsepeople < horseLessonpeople) {
			//centerService.deleteHorsehead(lessonVo);
			System.out.println("레슨 넘버2 : " + lessonVo.getLesson_no());
			String result = centerService.resultHorsehead(lessonVo.getLesson_no());
			
			rr.put("result", "success");
			rr.put("data", result);
			
			return rr;
		}else {
			centerService.updateHorsehead(lessonVo);
			System.out.println("레슨 넘버3 : " + lessonVo.getLesson_no());
			String result = centerService.resultHorsehead(lessonVo.getLesson_no());
			
			rr.put("result", "success");
			rr.put("data", result);
			
			return rr;
		}
	
	}
		
}

