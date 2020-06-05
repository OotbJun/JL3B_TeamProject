package com.jl3b.touche_nubes.vote.controller;

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

import com.jl3b.touche_nubes.membervo.ResiVo;
import com.jl3b.touche_nubes.vote.service.VoteService;
import com.jl3b.touche_nubes.votevo.CandyImgVo;
import com.jl3b.touche_nubes.votevo.CandyVo;
import com.jl3b.touche_nubes.votevo.VoteVo;

@Controller
@RequestMapping("/vote/*")
public class VoteController {
	
	@Autowired
	private VoteService voteService;
	
	//선거 메인
	@RequestMapping("vote_choice.jan")
	public String choiceVote(Model model) {
		int round = voteService.newRound();
		model.addAttribute("round", round);
		
		return "vote/vote_choice";
	}
	
	//후보등록 글쓰기 페이지
	@RequestMapping("candy_write.jan")
	public String writeCandy() {
		return "vote/candy_write";
	}
	@RequestMapping("candy_write_process.jan")
	public String writeCandyProcess(MultipartFile [] candyFile, CandyVo candyVo, HttpSession session) {
		
	    String rootFolderName = "C:/upload/";
       
	    Date today = new Date();
        
	    SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd");
        
	    String todayFolder = df.format(today);
        
	    String saveFolderName = rootFolderName + todayFolder;
        
	    File saveFolder = new File (saveFolderName);
        
	    if(!saveFolder.exists()){
        	saveFolder.mkdirs();
        }
		
        List<CandyImgVo> candyImgList = new ArrayList<CandyImgVo>();
        
         for(MultipartFile file : candyFile) {
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
	  	    
	  	    CandyImgVo candyImgVo = new CandyImgVo();
	  	    candyImgVo.setCandy_img_title(todayFolder + "/" + saveFileTitle);
	  	    candyImgVo.setCandy_img_path(saveRealPath);
	  	    candyImgList.add(candyImgVo);
        }
		
        candyVo.setElection_round(voteService.newRound());
		ResiVo resiVo = (ResiVo)session.getAttribute("sessionUser");
		candyVo.setResi_no(resiVo.getResi_no());
		voteService.writeCandy(candyVo, candyImgList);
		
		
		return "redirect:./candy.jan?election_round="+voteService.newRound();
	}
	
	//후보 삭제
	@RequestMapping("candy_delete_process.jan")
	public String deleteCandy(int candy_no) {
		voteService.deleteCandy(candy_no);
		return "";
	}
	
	//후보 수정 - 일단 제낌
	
	
	//후보 리스트 출력
	@RequestMapping("candy.jan")
	public String candy(Model model, int election_round) {
		
		
		List<Map<String, Object>> list = voteService.candyList(election_round);
		
		model.addAttribute("candyList", list);
		
		return "vote/candy";
	}
	
	//투표
	@RequestMapping("vote.jan")
	public String vote(VoteVo voteVo) {
		voteService.takeVote(voteVo);
		
		return "redirect:./candy.jan";
	}
	
	//후보자 상세 페이지
	@RequestMapping("candy_read.jan")
	public String readCandy(int candy_no, Model model) {
		Map<String, Object> map = voteService.viewCandy(candy_no);
		model.addAttribute("readCandy", map);
		return "vote/candy_read";
	}
	
	@RequestMapping("vote_start.jan")
	public String voteStart() {
		voteService.startElection();
		
		return "vote/vote_start";
	}
	
}
