package com.jl3b.touche_nubes.center.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.jl3b.touche_nubes.center.service.CenterService;
import com.jl3b.touche_nubes.centervo.CenterImgVo;
import com.jl3b.touche_nubes.membervo.CenterVo;
import com.jl3b.touche_nubes.votevo.CandyImgVo;

@Controller
@RequestMapping("/center/*")
public class CenterController {

	@Autowired
	private CenterService centerService;
	
	//센터 초이스(등록, 리스트출력 등) 나중에 따로 빼야될 듯
//	@RequestMapping("/center_choice.jan")
//	public String centerChoice(Model model, HttpSession session) {
//		
//		int info_no = centerService.getInfoNo();
//		model.addAttribute("info_no", info_no);
//		
//		if(session.getAttribute("sessionCenter") != null) {					//중복방지, 정보 등록한 센터는 다시 등록 안 보이게끔
//			CenterInfoVo centerInfoVo = centerService.checkCenterInfo(((CenterVo)session.getAttribute("sessionCenter")).getCenter_no());	
//			model.addAttribute("centerInfoVo", centerInfoVo);
//		}
//		return "center/center_choice";
//	}
	
	//센터 정보 등록
//	@RequestMapping("/center_write.jan")
//	public String writeCenter(HttpSession session) {
//		
//		CenterInfoVo centerInfoData = centerService.checkCenterInfo(((CenterVo)session.getAttribute("sessionCenter")).getCenter_no());
//		
//		if(centerInfoData == null) {			//중복등록 방지 -> 사실상 의미 없겠다.
//			
//		}else {
//			return "center/center_fail";
//		}
//		return "center/center_write";
//	}
//	@RequestMapping("/center_write_process.jan")
//	public String writeCenterProcess(CenterInfoVo centerInfoVo, HttpSession session, MultipartFile [] centerFile) {
//		//파일업로드
//		String rootFolderName = "C:/upload/";
//	       
//	    Date today = new Date();
//        
//	    SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd");
//        
//	    String todayFolder = df.format(today);
//        
//	    String saveFolderName = rootFolderName + todayFolder;
//        
//	    File saveFolder = new File (saveFolderName);
//        
//	    if(!saveFolder.exists()){
//        	saveFolder.mkdirs();
//        }
//		
//        List<CenterImgVo> centerImgList = new ArrayList<CenterImgVo>();
//        
//         for(MultipartFile file : centerFile) {
//        	if(file.getSize() <= 0) {
//        		continue;
//        	}
//        	//파일명 랜덤 이름
//        	String saveFileTitle = UUID.randomUUID().toString();
//  	      
//        	String oriFileTitle = file.getOriginalFilename();
//  	      
//  	      	saveFileTitle += "_" + System.currentTimeMillis();
//  	      
//  	      	saveFileTitle += oriFileTitle.substring(oriFileTitle.lastIndexOf("."));
//  	      
//	  	    String saveRealPath = saveFolderName + "/" + saveFileTitle;
//	
//	  	    try {
//	  	    	file.transferTo(new File(saveRealPath));
//	  	     }catch(IOException e) {
//	  	        e.printStackTrace();
//	  	     }
//	  	    
//	  	    CenterImgVo centerImgVo = new CenterImgVo();
//	  	    centerImgVo.setCenter_img_title(todayFolder + "/" + saveFileTitle);
//	  	    centerImgVo.setCenter_img_path(saveRealPath);
//	  	    centerImgList.add(centerImgVo);
//        }
//		
//		CenterVo centerVo = (CenterVo)session.getAttribute("sessionCenter");
//		centerInfoVo.setCenter_no(centerVo.getCenter_no());
//		CenterInfoVo centerInfoData = centerService.checkCenterInfo(centerInfoVo.getCenter_no());
//		
//		return "redirect:./center.jan";
//	}
	
	//센터 리스트
	@RequestMapping("/center.jan")
	public String center(Model model) {
		
		List<Map<String, Object>> centerList = centerService.centerList();
		model.addAttribute("centerList", centerList);
		
		return "center/center";
	}
	
	//센터 정보 보기
	@RequestMapping("/center_read.jan")
	public String readCenter(int info_no, Model model) {
		
		Map<String, Object> readCenter = centerService.viewCenterInfo(info_no);
		model.addAttribute("readCenter", readCenter);
		
		return "center/center_read";
	}
	
	//센터 정보 수정
//	@RequestMapping("/center_modify.jan")
//	public String modifyCenter(int info_no, Model model) {
//
//		model.addAttribute("readCenter", centerService.viewCenterInfo(info_no));
//		
//		return "center/center_modify";
//	}
//	@RequestMapping("/center_modify_process.jan")
//	public String modifyCenterProcess(CenterInfoVo centerInfoVo) {
//		
//		centerService.modifyCenterInfo(centerInfoVo);
//		
//		return "redirect:./center.jan";
//	}
	
	//센터 정보 삭제
//	@RequestMapping("/center_erase_process.jan")
//	public String eraseCenterProcess(int info_no) {
//
//		centerService.eraseCenterInfo(info_no);
//		
//		return "redirect:./center.jan";
//	}
	
	
}
