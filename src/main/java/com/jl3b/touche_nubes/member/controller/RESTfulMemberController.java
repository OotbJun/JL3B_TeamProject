package com.jl3b.touche_nubes.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jl3b.touche_nubes.member.service.MemberService;
@Controller
@ResponseBody
@RequestMapping("/member/*")
public class RESTfulMemberController {

   @Autowired
   private MemberService memberService;

   // 아이디 중복검사
   @RequestMapping("/confirmId.jan")
   public String confirmid(@RequestParam("resi_id") String resi_id) {
      if (memberService.confrimId(resi_id)) {
         return "true";
      } else {
         return "false";
      }
   }
   
   //인증키 확인
   @RequestMapping("/checkNpkiKey.jan")
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
   @RequestMapping("/confirmEmail.jan")
   public String confirmEmail(@RequestParam("resi_mail") String resi_mail) {
      if (memberService.confrimId(resi_mail)){
         System.out.println(memberService.confirmEmail(resi_mail));
         return "true";
      } else {
         return "false";
      }
   }
   
   // 아이디 찾기
   @RequestMapping("/find_resi_process.jan")
   public String resiIdSearch(@RequestParam("resi_rname") String resi_rname,
         @RequestParam("npki_key") String npki_key) {
	   
      String result = memberService.get_searchId(resi_rname, npki_key);
      return result;
   }
   
   
   
   ////센터
   // 센터 아이디 확인
   @RequestMapping("/confirmCenterId.jan")
   public String confirmCenterId(@RequestParam("center_id") String center_id) {
      if (memberService.confirmCenterId(center_id)) {
         return "true";
      } else {
         return "false";
      }
   }
   
   // 센터 인증번호 확인
   @RequestMapping("/checkCenterNpkiKey.jan")
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
   @RequestMapping("/checkCenterEmail.jan")
   public String confirmCenterEmail(@RequestParam("center_mail") String center_mail) {
      if (memberService.confirmCenterEmail(center_mail)) {
         return "true";
      } else {
         return "false";
      }
   }
   
}