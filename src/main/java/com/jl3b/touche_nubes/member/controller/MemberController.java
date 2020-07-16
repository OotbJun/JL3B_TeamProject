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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jl3b.touche_nubes.admin.service.AdminService;
import com.jl3b.touche_nubes.center.service.CenterService;
import com.jl3b.touche_nubes.centervo.CenterImgVo;
import com.jl3b.touche_nubes.centervo.ReserveVo;
import com.jl3b.touche_nubes.member.service.MemberServiceImpl;
import com.jl3b.touche_nubes.membervo.MemberVo;
import com.jl3b.touche_nubes.votevo.CandyImgVo;
import com.jl3b.touche_nubes.membervo.CenterAuthVo;
import com.jl3b.touche_nubes.membervo.CenterVo;
import com.jl3b.touche_nubes.membervo.MemberAuthVo;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberServiceImpl memberService;
	@Autowired
	private JavaMailSenderImpl mailSender;
	@Autowired
	private AdminService adminService;
	@Autowired
	private CenterService centerService;
	
	
	@RequestMapping("join_member_choice.do")
	public String joinMemberChoicePage() {
		return "member/join_member_choice";
	}
	
	//회원가입
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
	         
	         
	         // 회원가입시 npki_key값 "admin" 확인후 어드민 자동 회원가입 
	        if(memberVo.getNpki_key().contains("admin")) {
	        		adminService.insertAdmin(memberVo.getNpki_key());
	        }	

	         
	         
	         //메일을 보내는 쓰레드 
	         MemberSenderThread thread = new MemberSenderThread(memberVo.getMember_mail(),memberAuthVo.getAuth_key(), mailSender);
	         
	         thread.start();
	         
	         System.out.println("회원가입 성공 " + memberVo.getMember_rname());
	         
	         return "redirect:./join_member_complete.do";
	      }   
	}
	
	// 회원가입 대기화면 
	@RequestMapping("/join_member_complete.do")
	public String memberComplete() {
		return "member/join_complete";
	}
	
	//회원가입  인증 컨트롤러 
	@RequestMapping("/certification_process.do")
	public String certificationProcess(String key) {
		memberService.certification(key);
		return "/member/certification_complete";
			
	}	
	
	//로그인
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
	
	//로그아웃
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
		
		String rootFolderName = "/var/storage/";
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
        
        CenterAuthVo centerAuthVo = new CenterAuthVo();
        String centerAuthkey = UUID.randomUUID().toString();
        centerAuthVo.setCenter_auth_key(centerAuthkey);
        
        memberService.joinCenter(centerVo, centerImgList, centerAuthVo);
        CenterSenderThread centerthread = new CenterSenderThread(centerVo.getCenter_mail(),centerAuthVo.getCenter_auth_key(), mailSender);
		centerthread.start();
        //CenterInfoVo centerInfoData = centerService.checkCenterInfo(centerInfoVo.getCenter_no());
		
		return "redirect:./join_member_complete.do";
	}
	
	//센터 회원가입  인증 컨트롤러 
	@RequestMapping("/certification_center_process.do")
	public String certification_Center_Process(String key) {
		
		memberService.certification_Center(key);
		
		return "/member/certification_complete";
		
	}	
	
	//멤버 마이페이지
	@RequestMapping("/mypage.do")
	public String Mypage(Model model, HttpSession session) {
		
		String memberDate = null;			//if 때문에 밖에서 선언
		String centerDate = null;
		
		if(session.getAttribute("sessionUser") != null) {								//if문 안 쓰면 널포인터 뜨더라
			MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
			memberDate = memberService.getMemberDate(memberVo.getMember_no());			//그냥 날짜 자른거 담아서 넘겨주는 거야
		}
		
		if(session.getAttribute("sessionCenter") != null) {
			CenterVo centerVo = (CenterVo)session.getAttribute("sessionCenter");
			centerDate = memberService.getCenterDate(centerVo.getCenter_no());
		}
		
		model.addAttribute("memberDate", memberDate);
		model.addAttribute("centerDate", centerDate);
		
		return "member/mypage";
   }
   
	//비밀번호 확인
	@RequestMapping("/confirm_pw.do")
	public String ConfirmPw() {
		return "member/confirm_pw";
	}

	//비밀번호 확인 프로세스
	@RequestMapping("/confirm_pw_process.do")
	public String ConfirmPwProcess(MemberVo membervo, HttpSession session, CenterVo centerVo) {
		
		MemberVo userData = null;
		CenterVo centerData = null;
		
		if(session.getAttribute("sessionUser") != null) {					//진짜 이렇게까지 해줘야 넘어가는 값 제대로 받아짐
			userData = memberService.confirmMemberPw(membervo);
		}
		if(session.getAttribute("sessionCenter") != null) {					//안하면 member, center 둘 다 넘어가서 익셉션
			centerData = memberService.confirmCenterPw(centerVo);
		}
		
		if(userData == null && centerData == null) {
			return "member/confirm_fail";
		}
		
		if(userData != null) {
			session.setAttribute("sessionUser", userData);
			
			return "redirect:/member/update_mypage.do";
		}else {
			session.setAttribute("sessionCenter", centerData);
			
			return "redirect:/member/update_mypage.do";
		}
	}
  
	//멤버 마이페이지 수정
	@RequestMapping("/update_mypage.do")
	public String UpdateMypage(Model model, HttpSession session) {
		
		String memberDate = null;			//if 때문에 밖에서 선언
		String centerDate = null;
		
		if(session.getAttribute("sessionUser") != null) {								//if문 안 쓰면 널포인터 뜨더라
			MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
			memberDate = memberService.getMemberDate(memberVo.getMember_no());			//그냥 날짜 자른거 담아서 넘겨주는 거야
		}
		
		if(session.getAttribute("sessionCenter") != null) {
			CenterVo centerVo = (CenterVo)session.getAttribute("sessionCenter");
			centerDate = memberService.getCenterDate(centerVo.getCenter_no());
		}
		
		model.addAttribute("memberDate", memberDate);
		model.addAttribute("centerDate", centerDate);
		
		return "member/update_mypage";
	}
   
	//멤버 마이페이지 수정 프로세스
	@RequestMapping("/update_mypage_process.do")
	public String UpdateProcessMypage(MemberVo membervo, HttpSession session, CenterVo centerVo) {
      
		if(session.getAttribute("sessionUser") != null) {
			memberService.updateMember(membervo);
			MemberVo memberData = memberService.updateSession(membervo.getMember_no());
			session.setAttribute("sessionUser", memberData);							//로그아웃 없이 업데이트
	      
			return "redirect:/member/mypage.do";
		}else {
			memberService.updateCenter(centerVo);
			CenterVo centerData = memberService.updateCenterSession(centerVo.getCenter_no());
			session.setAttribute("sessionCenter", centerData);
			
			return "redirect:/member/mypage.do";
		}
		
		
	}
   
	//비밀번호 변경 페이지
	@RequestMapping("/update_pw.do")
	public String UpdatePw() {
		return "member/update_pw";
	}
	//비번 변경 프로세스
	@RequestMapping("/update_pw_process.do")
	public String ChangePw(MemberVo membervo, Model model, HttpSession session, CenterVo centerVo) {
      
		if(session.getAttribute("sessionUser") != null) {
			memberService.updatePw(membervo);
		}else {
			memberService.updateCenterPw(centerVo);
		}
   
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
	
	   // 내가 쓴글 출력하기(자게)
	   @RequestMapping("mywrite.do")
	public String myWrite(HttpSession session,Model model) {
      
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
      
      
	    List<Map<String,Object>> list = memberService.getMyBoard(memberVo.getMember_no());
	        
	    model.addAttribute("myBoardList", list);
       
	    return "member/mywrite";
	}
	   
	   // 내가 쓴글 출력하기 (청원)
	   @RequestMapping("myidea.do")
	 public String myIdea(HttpSession session,Model model) {
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		List<Map<String,Object>> list = memberService.getMyIdea(memberVo.getMember_no());   
		model.addAttribute("myIdeaList", list);
		return "member/myidea";
	}

	   
	
	//회원 탈퇴
	@RequestMapping("/member_drop_process.do")
	public String memberDrop(MemberVo memberVo, HttpSession session, CenterVo centerVo) {		//int member_no, int center_no 주의!
		
		
		if(session.getAttribute("sessionUser") != null) {
			memberService.memberDrop(memberVo.getMember_no());
			session.invalidate();
		}else {
			memberService.centerDrop(centerVo.getCenter_no());
			session.invalidate();
		}
		
		return "redirect:../";
	}
	
    // 내가 예약한 내역 
	@RequestMapping("mylesson.do")
	public String myLesson(HttpSession session,Model model) {
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		List<Map<String,Object>> list = memberService.getMyCenter(memberVo.getMember_no());
		
		
		model.addAttribute("myLessonList",list);
		
		return "member/mylesson";
    }
	
//	//예약 취소
	@RequestMapping("my_reserve_delete.do")
	public String deleteReserve(int[] lesson_no, int member_no, int[] lesson_people) {
		
		System.out.println("레슨 : " + lesson_no[0]);
		System.out.println("멤버 : " + member_no);
		System.out.println("피플 : " + lesson_people[0]);
		
		memberService.deleteReserve(lesson_no, member_no, lesson_people);
		
		centerService.deleteHorsehead(lesson_no, lesson_people);
		
		return "redirect:/member/mylesson.do";
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
	  	 String link ="http://15.164.48.63:8080/JL3B/member/certification_process.do?key="+authKey;
	  	 text += "Touche Nubes 입주민 가입을 환영합니다.<br>";
	  	 text += "입주민 회원가입 완료를 위해 아래의 링크를 클릭해 주세요.<br>";
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

class CenterSenderThread extends Thread{
	private String email;
	private String centerAuthKey;
	private JavaMailSenderImpl MailSender;

	public CenterSenderThread(String email, String centerAuthKey, JavaMailSenderImpl mailSender) {
		super();
		
		this.email = email;
		this.centerAuthKey= centerAuthKey;
		MailSender = mailSender;
	} 

	public void run() {
		try {
		  	 MimeMessage message = null;	
		  	 MimeMessageHelper messageHelper = null ;
		  	 message = MailSender.createMimeMessage();
		  	 messageHelper = new MimeMessageHelper(message,true,"UTF-8");
		  	 messageHelper.setSubject("[TOUCHE NUBES] 센터 가입 이메일 인증입니다.");
		
		  	 String text = "";
	 
	  	 // 이후에 AWS 서버 IP로 변경해주어야 합니다!!! 
	  	 String link ="http://15.164.48.63:8080/JL3B/member/certification_center_process.do?key="+centerAuthKey;
	  	 text += "Touche Nubes 센터에 가입하신 선생님 감사합니다.<br>";
	  	 text += "센터등록  완료를 위해 아래의 링크를 클릭해 주세요.<br>";
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
	  	 String link ="http://15.164.48.63:8080/JL3B/member/login.do";
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