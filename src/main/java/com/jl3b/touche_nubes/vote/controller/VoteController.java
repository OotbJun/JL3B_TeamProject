package com.jl3b.touche_nubes.vote.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;

import com.jl3b.touche_nubes.member.mapper.MemberSQLMapper;
import com.jl3b.touche_nubes.member.service.MemberService;
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
	public String choiceVote(Model model, HttpSession session) {
		
		try {
			int round = voteService.newRound();		//트라이캐치 안 쓰니까 choice페이지에서 round값 null로 못 받더라.
			model.addAttribute("round", round);		//round값을 받아줘서 항상 최신회차 출력을 위한 것.
		}catch(Exception e) {
			e.printStackTrace();
		}
			
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
        int resiVo = ((ResiVo)session.getAttribute("sessionUser")).getResi_no();
 		candyVo.setResi_no(resiVo);
         
        CandyVo candyCheckData = voteService.checkCandy(candyVo); 
        
        //후보등록 중복방지
        if(candyCheckData == null) {
        	voteService.writeCandy(candyVo, candyImgList);
        }else {
        	return "vote/candy_fail";
        }
		
		return "redirect:./candy.jan?election_round="+voteService.newRound();
	}
	
	//후보 삭제
	@RequestMapping("candy_delete_process.jan")
	public String deleteCandy(int candy_no) {
		voteService.deleteCandy(candy_no);
		return "redirect:./candy.jan";
	}
	
	//후보 수정
	@RequestMapping("candy_change.jan")
	public String changeCandy(int candy_no, Model model) {
		model.addAttribute("readCandy", voteService.viewCandy(candy_no));
		return "vote/candy_change";
	}
	@RequestMapping("candy_change_process.jan")
	public String changeCandyProcess(CandyVo candyVo) {
		
		voteService.changeCandy(candyVo);
		
		return "redirect:./vote_choice.jan";
	}
	
	
	//후보 리스트 출력
	@RequestMapping("candy.jan")
	public String candy(Model model, int election_round) {
		
		List<Map<String, Object>> list = voteService.candyList(election_round);
		model.addAttribute("candyList", list);
		
		return "vote/candy";
	}
	
	//투표
	@RequestMapping("vote.jan")
	public String vote(VoteVo voteVo, Model model, int election_round) {
		
		List<Map<String, Object>> list = voteService.candyList(election_round);
		model.addAttribute("candyList", list);
		
		return "vote/vote";
	}
	@RequestMapping("vote_process.jan")
	public String voteProcess(VoteVo voteVo, HttpSession session) {
		
		int resiVo = ((ResiVo)session.getAttribute("sessionUser")).getResi_no();
		voteVo.setResi_no(resiVo);										//로그인한 no값 담아주기.

		voteVo.setElection_round(voteService.newRound());				//election_round값도 담고
		//voteVo.setElection_round(election_round);
		VoteVo voteData = voteService.checkVote(voteVo);
		
		
		//투표 중복방지
		if(voteData == null) {											
			voteService.takeVote(voteVo);								//중복 아니라면 투표 실행
			return "redirect:./vote_choice.jan";
		}else {
			return "vote/vote_fail";
		}
	}
	
	//후보자 상세 페이지
	@RequestMapping("candy_read.jan")
	public String readCandy(int candy_no, Model model) {
		Map<String, Object> map = voteService.viewCandy(candy_no);
		int round = voteService.newRound();
		
		model.addAttribute("readCandy", map);
		model.addAttribute("round", round);			//당회차 목록으로 이동시킬려구
		
		return "vote/candy_read";
	}
	
	//선거 개시 -> 테이블에 새로운 회차 등록됨
	@RequestMapping("vote_start.jan")
	public String voteStart() {
		voteService.startElection();
		
		return "vote/vote_start";
	}
	
	//선거 득표수 보기
	@RequestMapping("vote_result.jan")
	public String resultVote(Model model, int election_round) {
		List<Map<String, Object>> list = voteService.resultVote(election_round);
		model.addAttribute("voteList", list);
		
		return "/vote/vote_result";
	}
	
}
