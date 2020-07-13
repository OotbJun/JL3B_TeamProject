package com.jl3b.touche_nubes.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jl3b.touche_nubes.center.service.CenterService;
import com.jl3b.touche_nubes.centervo.LessonVo;
import com.jl3b.touche_nubes.centervo.ReserveVo;
import com.jl3b.touche_nubes.member.service.MemberServiceImpl;
import com.jl3b.touche_nubes.membervo.MemberVo;
@Controller
@ResponseBody
@RequestMapping("/member/*")
public class RESTfulMemberController {

   @Autowired
   private MemberServiceImpl memberService;
   @Autowired
   private CenterService centerService;

   // 아이디 중복검사
   @RequestMapping("/confirmId.do")
   public String confirmid(@RequestParam("member_id") String member_id) {
      if (memberService.confrimId(member_id)) {
         return "true";
      } else {
         return "false";
      }
   }
   
   //인증키 확인
   @RequestMapping("/checkNpkiKey.do")
   public String checkNpkiKey(@RequestParam("npki_key") String npki_key) {
      System.out.println("컨트롤러 진입");
      if (memberService.onlyNpki(npki_key)) {               //사용 가능한 인증번호
      if(memberService.confirmNpki(npki_key)) {         //사용하지 않은 인증번호
            return "true"; 
         } else {
            return "used";                           //사용하고 있는 인증번호
         }
      } else {
         return "false";                              //존재하지 않는 인증번호
      }
   }
   
   //이메일 확인
   @RequestMapping("/confirmEmail.do")
   public String confirmEmail(@RequestParam("member_mail") String member_mail) {
      if (memberService.confirmEmail(member_mail)){
         System.out.println(memberService.confirmEmail(member_mail));
         return "true";
      } else {
         return "false";
      }
   }
   
   // 아이디 찾기
   @RequestMapping("/find_member_process.do")
   public String memberIdSearch(@RequestParam("member_rname") String member_rname,
         @RequestParam("npki_key") String npki_key) {
	   
      String result = memberService.get_searchId(member_rname, npki_key);
      return result;
   }
   
   
   
   ////센터
   // 센터 아이디 확인
   @RequestMapping("/confirmCenterId.do")
   public String confirmCenterId(@RequestParam("center_id") String center_id) {
      if (memberService.confirmCenterId(center_id)) {
         return "true";
      } else {
         return "false";
      }
   }
   
   // 센터 인증번호 확인
   @RequestMapping("/checkCenterNpkiKey.do")
   public String checkCenterNpkiKey(@RequestParam("npki_key") String npki_key) {
   
      if (memberService.onlyNpki(npki_key)) { // 사용 가능한 인증번호
         if (memberService.confirmCenterNpki(npki_key)) { // 사용하지 않은 인증번호
            return "true";
         } else {
            return "used"; // 사용하고 있는 인증번호
         }
      } else {
         return "false"; // 존재하지 않는 인증번호
      }
   }
   
   // 센터이메일확인
   @RequestMapping("/checkCenterEmail.do")
   public String confirmCenterEmail(@RequestParam("center_mail") String center_mail) {
      if (memberService.confirmCenterEmail(center_mail)) {
         return "true";
      } else {
         return "false";
      }
   }
   
   //나의 센터예약 취소하기 
//   @RequestMapping("/my_reserve_delete.do")
//   public void deleteReserve(ReserveVo reserveVo,@RequestParam(value = "chbox[]") List<String> chArr, HttpSession session) {
//      
//      System.out.println("레슨 : " + reserveVo.getLesson_no());
//      System.out.println("멤버 : " + reserveVo.getMember_no());
//      System.out.println("리저브 : " + reserveVo.getReserve_no());
//      
//      for(String i : chArr) {
//         int lesson_no = Integer.parseInt(i);
//         reserveVo.setLesson_no(lesson_no);
//         MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
//         reserveVo.setMember_no(memberVo.getMember_no());
//         memberService.deleteReserve(reserveVo);
//         centerService.deleteHorsehead(lesson_no);
//      }  
//   }      
   
}