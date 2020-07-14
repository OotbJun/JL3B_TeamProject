package com.jl3b.touche_nubes.center.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jl3b.touche_nubes.boardvo.BoardImgVo;
import com.jl3b.touche_nubes.boardvo.BoardVo;
import com.jl3b.touche_nubes.center.service.CenterService;
import com.jl3b.touche_nubes.centervo.CenterImgVo;
import com.jl3b.touche_nubes.centervo.CenterReviewVo;
import com.jl3b.touche_nubes.centervo.LessonInfoVo;
import com.jl3b.touche_nubes.centervo.LessonVo;
import com.jl3b.touche_nubes.centervo.ReserveVo;
import com.jl3b.touche_nubes.membervo.CenterVo;
import com.jl3b.touche_nubes.membervo.MemberVo;
import com.jl3b.touche_nubes.votevo.CandyImgVo;

@Controller
@RequestMapping("/center/*")
public class CenterController {

	@Autowired
	private CenterService centerService;
	
	
	
	//센터 리스트
	@RequestMapping("/center.do")
	public String center(Model model) {
		
		List<Map<String, Object>> centerList = centerService.centerList();
		
		model.addAttribute("centerList", centerList);
		
		return "center/center";
	}
	
	//센터 정보 보기
	@RequestMapping("/center_read.do")
	public String readCenter(int center_no, Model model,LessonVo lessonVo) {
		//centerService.updateHorsehead(lessonVo.getLesson_people());
		//centerService.deleteHorsehead(lessonVo);
		
		Map<String, Object> readCenter = centerService.viewCenterInfo(center_no);
		List<Map<String, Object>> readReview = centerService.viewReviewList(center_no);
		List<Map<String,Object>> lessonList = centerService.viewLessonList(center_no);
		List<LessonInfoVo> infoList = centerService.viewInfoList(center_no);
		
		
		model.addAttribute("readCenter", readCenter);
		model.addAttribute("readReview", readReview);
		model.addAttribute("lessonList", lessonList);
		model.addAttribute("infoList", infoList);
		
		return "center/center_read";
	}
	
	//센터 이미지 업로드
	@RequestMapping("/center_img.do")
	public String uploadImgCenter() {
		return "center/center_img";
	}
	@RequestMapping("/center_img_process.do")
	public String uploadImgCenterProcess(MultipartFile [] centerImgFile, CenterVo centerVo, HttpSession session) {
		
		String RootFolderName = "/var/storage/";
		Date today = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		String todayFolder = df.format(today);
		String SaveFolderName = RootFolderName + todayFolder;
		File SaveFolder = new File (SaveFolderName);
   
		if(!SaveFolder.exists()){
			SaveFolder.mkdirs();
		}
		List<CenterImgVo> centerImgList = new ArrayList<CenterImgVo>();
      
		for(MultipartFile file : centerImgFile) {
			if(file.getSize() <=0) {
				continue;
			}
			//파일명 랜덤 이름 
			String SaveFileTitle = UUID.randomUUID().toString();
			String oriFileTitle = file.getOriginalFilename();
			SaveFileTitle += "_" + System.currentTimeMillis();
			SaveFileTitle += oriFileTitle.substring(oriFileTitle.lastIndexOf("."));
			String SaveRealPath = SaveFolderName + "/" + SaveFileTitle;

			try {
				file.transferTo(new File(SaveRealPath));
			}catch(IOException e) {
				e.printStackTrace();
			}
			
			
			centerVo = (CenterVo) session.getAttribute("sessionCenter");
			
			// DB에 담을 Vo객체를 생성 
			CenterImgVo centerImgVo = new CenterImgVo();
			centerImgVo.setCenter_img_title(todayFolder+"/"+SaveFileTitle);
			centerImgVo.setCenter_img_path(SaveRealPath);
			centerImgVo.setCenter_no(centerVo.getCenter_no());
			centerImgList.add(centerImgVo);
		}
		
	    centerService.uploadCenterImg(centerImgList);
	    
	    return "redirect:./center_read.do?center_no="+centerVo.getCenter_no();
	}
	
	//센터 정보 수정
//	@RequestMapping("/center_modify.do")
//	public String modifyCenter(int info_no, Model model) {
//
//		model.addAttribute("readCenter", centerService.viewCenterInfo(info_no));
//		
//		return "center/center_modify";
//	}
//	@RequestMapping("/center_modify_process.do")
//	public String modifyCenterProcess(CenterInfoVo centerInfoVo) {
//		
//		centerService.modifyCenterInfo(centerInfoVo);
//		
//		return "redirect:./center.do";
//	}
	
	//센터 정보 삭제
//	@RequestMapping("/center_erase_process.do")
//	public String eraseCenterProcess(int info_no) {
//
//		centerService.eraseCenterInfo(info_no);
//		
//		return "redirect:./center.do";
//	}
	
	
	///////////////////////////////////////////////리뷰
	//리뷰 등록
	@RequestMapping("/review_write.do")
	public String writeReview(Model model, int center_no) {
		
		model.addAttribute("center_no", center_no);
		
		return "center/review_write";
	}
	@RequestMapping("/review_write_process.do")
	public String writeReviewProcess(CenterReviewVo centerReviewVo, HttpSession session) {
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		centerReviewVo.setMember_no(memberVo.getMember_no());
		centerService.writeReview(centerReviewVo);
		
		return "redirect:./center_read.do?center_no="+centerReviewVo.getCenter_no();
	}
	
	//강의 생성 페이지
	@RequestMapping("/center_write.do")
	public String writeLessonPage(Model model) throws ParseException {
		System.out.println("강의 생성 페이지 호출 컨트롤러");
		
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String today = df.format(date);
		
		System.out.println(today);
		
		model.addAttribute("today", today);
		
		return "center/center_write";
	}

	//강의생성
	@RequestMapping("/center_write_process.do")
	public String create(LessonInfoVo lessonInfoVo, Date [] lesson_date, String [] lesson_time, int [] lesson_people, HttpSession session) {
	
		CenterVo centerVo = (CenterVo)session.getAttribute("sessionCenter");	//로그인 한 세션유지 후 글 쓰기 위해...
		
		lessonInfoVo.setCenter_no(centerVo.getCenter_no());		//센터넘버를 갖고와서 info에 센터넘버 입력
		
		centerService.writeLesson(lessonInfoVo, lesson_date, lesson_time, lesson_people, centerVo.getCenter_no());	//생성
		
		return "redirect:./center_read.do?center_no="+centerVo.getCenter_no();
	}
	
	
//	//수강생 조회
//	@RequestMapping("/mylesson.do")
//	public String readmember(HttpSession session, Model model) {
//		
//		
//		CenterVo centerVo = (CenterVo) session.getAttribute("sessionCenter");
//		
//		List<LessonVo> aaa = centerService.test(centerVo.getCenter_no());
//		
//		
//		
//		List<Map<String,Object>> list = centerService.readmember(lessonVo.getLesson_no());
//	        
//		model.addAttribute("mylesson", list);
//		 
//		return "center/mylesson";
//	}
	
//	//센터 정보 보기
//		@RequestMapping("/mylesson.do")
//		public String mylesson(Model model,HttpSession session) {
//			//centerService.updateHorsehead(lessonVo.getLesson_people());
//			
//			CenterVo centerVo = (CenterVo)session.getAttribute("sessionCenter");
//			List<LessonVo> lessonList = centerService.lessonList(centerVo.getCenter_no());
//			List<LessonInfoVo> lessonInfoList = centerService.lessonInfoList(centerVo.getCenter_no());
//			//List<ReserveVo> reserveList = centerService.reserveList()
//			
//			model.addAttribute("lessonList", lessonList);
//			model.addAttribute("lessonInfoList", lessonInfoList);
//			model.addAttribute("centerVo", centerVo);
//		
//			
//			return "center/mylesson";
//		}
	
	//센터 정보 보기
	@RequestMapping("/mylesson.do")
	public String mylesson(Model model,HttpSession session) {
		//centerService.updateHorsehead(lessonVo.getLesson_people());
//			CenterVo centerVo = (CenterVo)session.getAttribute("sessionCenter");
//			Map<String, Object> readCenter = centerService.viewCenterInfo(centerVo.getCenter_no());
//			List<Map<String, Object>> readReview = centerService.viewReviewList(centerVo.getCenter_no());
//			List<Map<String,Object>> lessonList = centerService.viewLessonList(centerVo.getCenter_no());
//			List<LessonInfoVo> infoList = centerService.viewInfoList(centerVo.getCenter_no());
//			
//			model.addAttribute("readCenter", readCenter);
//			model.addAttribute("readReview", readReview);
//			model.addAttribute("lessonList", lessonList);
//			model.addAttribute("infoList", infoList);
		
		CenterVo centerVo = (CenterVo)session.getAttribute("sessionCenter");
		
		List<Map<String, Object>> lessonList = centerService.viewLessonList(centerVo.getCenter_no());
		
		//String infoTitle = centerService.infoTitle()
		
		model.addAttribute("lessonList", lessonList);
		
		
		
		return "center/mylesson";
	}
	
	
	//테스트
	@RequestMapping("/test.do")
	public String test(Model model, int lesson_no) {
		
		List<Map<String, Object>> reserveList = centerService.reserveMember(lesson_no);
		
		model.addAttribute("reserveList", reserveList);
		
		return "center/popup";
	}
	
	//강의 삭제
	@RequestMapping("/delete_lesson_process.do")
	public String removeLesson(int[] lesson_no) {
		
		
		for(int i : lesson_no) {
			centerService.removeLesson(i);
			   System.out.println("넘버 : " + i);
		   }
		
		return "redirect:./mylesson.do";
	}

}
