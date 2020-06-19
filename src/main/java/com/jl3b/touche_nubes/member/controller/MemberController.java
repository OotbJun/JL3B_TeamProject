package com.jl3b.touche_nubes.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import com.jl3b.touche_nubes.centervo.CenterImgVo;
import com.jl3b.touche_nubes.member.service.MemberService;
import com.jl3b.touche_nubes.membervo.ResiVo;
import com.jl3b.touche_nubes.votevo.CandyImgVo;
import com.jl3b.touche_nubes.membervo.CenterVo;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("join_member_choice.jan")
	public String joinMemberChoicePage() {
		return "member/join_member_choice";
	}
	
	@RequestMapping("join_resi.jan")
	public String joinResiPage() {
		
		return "member/join_resi";
	}
	
	@RequestMapping("/join_resi_process.jan")
	public String joinMemberProcess(ResiVo resiVo) { 

		if (memberService.checkNpki(resiVo.getNpki_key()) == null) { //인증키값이 null로 들어오면 Fail 
			return"/member/join_fail";
		}else if(memberService.checkNpkiDupl(resiVo.getNpki_key()) != null) {
			return"/member/join_fail";
		}else {
			memberService.joinResi(resiVo);
			return "redirect:./login.jan";
		}
	}
	
	@RequestMapping("/login.jan")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("/login_process.jan")
	public String loginProcess(ResiVo resiVo, HttpSession session) {
		ResiVo residata = memberService.loginResi(resiVo);
		if (residata == null) {
			return "member/login_fail";
		} else {
			session.setAttribute("sessionUser", residata);
			System.out.println("로그인성공 ");
			return "redirect:/board/main.jan";
		}
	}
	
	@RequestMapping("/logout_process.jan")
    public String logOutProcess(HttpSession session) {
		 session.invalidate();
		 return "redirect:/";
	}
	
	
	//센터 로그인
	@RequestMapping("/login_center.jan")
	public String loginCenter() {
		return "member/login_center";
	}
	@RequestMapping("/login_center_process.jan")
	public String loginCenterProcess(CenterVo centerVo, HttpSession session) {
		CenterVo centerData = memberService.loginCenter(centerVo);
		if(centerData == null) {
			return "member/login_fail";
		}else {
			session.setAttribute("sessionCenter", centerData);
			System.out.println("센터 로그인");
			return "redirect:/board/main.jan";
		}
	}
	
	//센터 회원가입
	@RequestMapping("join_center.jan")
	public String joinCenterPage() {
		return "member/join_center";
	}
	
	@RequestMapping("join_center_process.jan")
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
		
		return "redirect:./login.jan";
	}
	
}
