package com.jl3b.touche_nubes.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import com.jl3b.touche_nubes.centervo.CenterImgVo;
import com.jl3b.touche_nubes.member.service.MemberService;
import com.jl3b.touche_nubes.membervo.MemberVo;
import com.jl3b.touche_nubes.votevo.CandyImgVo;
import com.jl3b.touche_nubes.membervo.CenterVo;
import com.jl3b.touche_nubes.membervo.MemberAuthVo;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@RequestMapping("join_member_choice.do")
	public String joinMemberChoicePage() {
		return "member/join_member_choice";
	}
	
	@RequestMapping("join_member.do")
	public String joinMemberPage() {
		
		return "member/join_member";
	}
	@RequestMapping("/join_member_process.do")
	public String joinMemberProcess(MemberVo memberVo) { 

		if (memberService.checkNpki(memberVo.getNpki_key()) == null) { //인증키값이 null로 들어오면 Fail 
			return"/member/join_fail";
		}else if(memberService.checkNpkiDupl(memberVo.getNpki_key()) != null) {
			return"/member/join_fail";
		}else {
			MemberAuthVo memberAuthVo = new MemberAuthVo();
			
			String authkey = UUID.randomUUID().toString();
			
			memberAuthVo.setAuth_key(authkey);
			
			memberService.joinMember(memberVo,memberAuthVo);	
			
			//메일을 보내는 쓰레드 
			MemberSenderThread thread = new MemberSenderThread(memberVo.getMember_mail(),memberAuthVo.getAuth_key(), mailSender);
			
			thread.start();
			
			System.out.println("회원가입 성공 " + memberVo.getMember_rname());
			
			return "redirect:./login.do";
		}	
	}
	
	//회원가입  인증 컨트롤러 
	@RequestMapping("/certification_process.do")
	public String certificationProcess(String key) {
		memberService.certification(key);
		return "/member/certification_complete";
			
	}	
	@RequestMapping("/login.do")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("/login_process.do")
	public String loginProcess(MemberVo memberVo, HttpSession session) {
		MemberVo memberdata = memberService.loginMember(memberVo);
		if (memberdata == null) {
			return "member/login_fail";
		} else {
			session.setAttribute("sessionUser", memberdata);
			System.out.println("로그인성공 " + memberdata.getMember_rname());
			return "redirect:/board/main.do";
		}
	}
	
	@RequestMapping("/logout_process.do")
    public String logOutProcess(HttpSession session) {
		 session.invalidate();
		 return "redirect:/";
	}
	
	//아이디 찾기
	@RequestMapping("/find_member.do")
    public String searchUser() {
		return "member/find_member";
	}
	
	/////////////////////////////센터
	//센터 로그인
	@RequestMapping("/login_center.do")
	public String loginCenter() {
		return "member/login_center";
	}
	@RequestMapping("/login_center_process.do")
	public String loginCenterProcess(CenterVo centerVo, HttpSession session) {
		CenterVo centerData = memberService.loginCenter(centerVo);
		if(centerData == null) {
			return "member/login_fail";
		}else {
			session.setAttribute("sessionCenter", centerData);
			System.out.println("센터 로그인");
			return "redirect:/board/main.do";
		}
	}
	
	//센터 회원가입
	@RequestMapping("join_center.do")
	public String joinCenterPage() {
		return "member/join_center";
	}
	
	@RequestMapping("join_center_process.do")
	public String joinCenterProcess(CenterVo centerVo, HttpSession session, MultipartFile [] centerFile) {
		
//		memberService.joinCenter(centerVo);
		
		String rootFolderName = "C:/upload/";
	    Date today = new Date();
	    SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd");
	    String todayFolder = df.format(today);
	    String saveFolderName = rootFolderName + todayFolder;
	    File saveFolder = new File (saveFolderName);
        
	    if(!saveFolder.exists()){
        	saveFolder.mkdirs();
        }
	    
	    List<CenterImgVo> centerImgList = new ArrayList<CenterImgVo>();
	    
	    System.out.println("센터파일 : " + centerFile);
        System.out.println("센터vo : " + centerVo.getCenter_no());
        System.out.println("센터이미지 : " + centerImgList);
	    
        for(MultipartFile file : centerFile) {
       	if(file.getSize() <= 0) {
       		continue;
       	}
       	//파일명 랜덤 이름
       	String saveFileTitle = UUID.randomUUID().toString();
       	String oriFileTitle = file.getOriginalFilename();
 	      
 	      	saveFileTitle += "_" + System.currentTimeMillis();
 	      
 	      	saveFileTitle += oriFileTitle.substring(oriFileTitle.lastIndexOf("."));
 	      
	  	    String saveRealPath = saveFolderName + "/" + saveFileTitle;
	
	  	    try {
	  	    	file.transferTo(new File(saveRealPath));
	  	     }catch(IOException e) {
	  	        e.printStackTrace();
	  	     }
	  	    
	  	    CenterImgVo centerImgVo = new CenterImgVo();
	  	    centerImgVo.setCenter_img_title(todayFolder + "/" + saveFileTitle);
	  	    centerImgVo.setCenter_img_path(saveRealPath);
	  	    centerImgList.add(centerImgVo);
        }
        System.out.println("센터파일 : " + centerFile);
        System.out.println("센터vo : " + centerVo.getCenter_no());
        System.out.println("센터이미지 : " + centerImgList);
        
        memberService.joinCenter(centerVo, centerImgList);
		
		//CenterInfoVo centerInfoData = centerService.checkCenterInfo(centerInfoVo.getCenter_no());
		
		return "redirect:./login.do";
	}
	
	//멤버 마이페이지
	@RequestMapping("/mypage.do")
	public String Mypage(Model model, HttpSession session) {
      
//		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
      
//		String aaa = memberService.getDate(memberVo.getMember_no());
      
//		model.addAttribute("memberDate", aaa);
      
		return "member/mypage";
   }
   
	//비밀번호 확인
	@RequestMapping("/confirm_pw.do")
	public String ConfirmPw() {
		return "member/confirm_pw";
	}

	//비밀번호 확인 프로세스
	@RequestMapping("/confirm_pw_process.do")
	public String ConfirmPwProcess(MemberVo membervo, HttpSession session) {
		MemberVo userData = memberService.confirmPw(membervo);
		if(userData == null) {
			return "member/confirm_fail";
		}else {
			session.setAttribute("sessionUser", userData);
			return "redirect:/member/update_mypage.do";
		}
	}
   
  
	//멤버 마이페이지 수정
	@RequestMapping("/update_mypage.do")
	public String UpdateMypage() {
		return "member/update_mypage";
	}
   
	//멤버 마이페이지 수정 프로세스
	@RequestMapping("/update_mypage_process.do")
	public String UpdateProcessMypage(MemberVo membervo, HttpSession session) {
      
		memberService.updateMypageProcess(membervo);
		MemberVo memberData = memberService.updateSession(membervo.getMember_no());
		
		System.out.println(memberData.getMember_id());
      
		session.setAttribute("sessionUser", memberData);
      
		return "redirect:/member/mypage.do";
	}
   
	//비밀번호 변경 페이지
	@RequestMapping("/update_pw.do")
	public String UpdatePw() {
		return "member/update_pw";
	}
	//비번 변경 프로세스
	@RequestMapping("/update_pw_process.do")
	public String ChangePw(MemberVo membervo, Model model) {
      
		memberService.updatePw(membervo);
   
		return "redirect:/member/mypage.do";
	}
	
	//비밀번호찾기 
	@RequestMapping("/find_password.do")
	@ResponseBody
	public String passwordSearch(@RequestParam("member_id")String member_id,
			@RequestParam("member_mail")String member_mail,
			HttpServletRequest request) {
      
		String pw = memberService.get_searchPw(member_id, member_mail);
		pw = pw.substring(0, 4);
		System.out.println("비번 : " + pw);
		PasswordSenderThread PasswordThread = new PasswordSenderThread(member_mail, pw, mailSender);
		PasswordThread.start();
		memberService.get_changePw(pw, member_id, member_mail);
	
		return "redirect:./login.do";
	}
	
	   // 내가 쓴글 출력하기 
	   @RequestMapping("mywrite.do")
   public String myWrite(HttpSession session,Model model) {
      
      MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
      
      List<Map<String,Object>> list = memberService.getMyBoard(memberVo.getMember_no());
        
      model.addAttribute("myBoardList", list);
       
        return "member/mywrite";
   }
	
}







//-------------------------------------------------------------------------------메일 쓰레드 
class MemberSenderThread extends Thread{
	private String email;
	private String authKey;
	private JavaMailSenderImpl MailSender;

	public MemberSenderThread(String email, String authKey, JavaMailSenderImpl mailSender) {
		super();
		
		this.email = email;
		this.authKey = authKey;
		MailSender = mailSender;
	} 
  
	public void run() {
		try {
		  	 MimeMessage message = null;	
		  	 MimeMessageHelper messageHelper = null ;
		  	 message = MailSender.createMimeMessage();
		  	 messageHelper = new MimeMessageHelper(message,true,"UTF-8");
		  	 messageHelper.setSubject("[TOUCHE NUBES] 이메일 인증입니다.");
		
		  	 String text = "";
  	 
	  	 // 이후에 AWS 서버 IP로 변경해주어야 합니다!!! 
	  	 String link ="http://172.30.1.8:8181/touche_nubes/member/certification_process.do?key="+authKey;
	  	 text += "Touche Nubes 입주민 가입을 환영합니다.<br>";
	  	 text += "입주민 회원가입 완료를 위해 아래의 링크를 클릭해 주세요 ^오^b<br>";
	  	 text += "<a href='"+link+"'>";
	  	 text += "Touche Nubes사이트로 이동하기";
	  	 text += "</a>";
  	 
	  	 messageHelper.setText(text, true);								//내용
	     messageHelper.setFrom("111", "Touche Nubes관리자입니다");						//보내는 사람
	     messageHelper.setTo(email);

       MailSender.send(message);
  		
		}catch (Exception e) {
  		e.printStackTrace();
		}
	}
}


//----------------------------------------------------------------비밀번호 찾기 스레드
class PasswordSenderThread extends Thread{
	private String email;
	private String password;
	private JavaMailSenderImpl MailSender;

	public PasswordSenderThread(String email, String password, JavaMailSenderImpl mailSender) {
		super();
		this.email = email;
		this.password = password;
		MailSender = mailSender;
	}
	
	public void run() {
		try {
		  	 MimeMessage message = null;	
		  	 MimeMessageHelper messageHelper = null ;
		  	 message = MailSender.createMimeMessage();
		  	 messageHelper = new MimeMessageHelper(message,true,"UTF-8");
		  	 messageHelper.setSubject("[TOUCHE NUBES] 비밀번호 찾기 입니다.");
		
		 String text = "";
  	 
	  	 // 이후에 AWS 서버 IP로 변경해주어야 합니다!!! 
	  	 String link ="http://172.30.1.8:8181/touche_nubes/member/login.do";
	  	 text += "Touche Nubes 비밀번호를 알려드립니다.<br>";
	  	 text += "비밀번호는 "+password+" 입니다.<br>";
	  	 text += "비밀번호를 입력하여 재 로그인을 부탁드립니다.";
	  	 text += "<a href='"+link+"'>";
	  	 text += "Touche Nubes 사이트로 로그인 페이지로 이동하기 ";
	  	 text += "</a>";
  	 
	  	 messageHelper.setText(text, true);								//내용
	     messageHelper.setFrom("111", "Touche Nubes관리자입니다");						//보내는 사람
	     messageHelper.setTo(email);

       MailSender.send(message);
  		
  	}catch (Exception e) {
  		e.printStackTrace();
  	}
  }
}