package com.jl3b.touche_nubes.board.controller;


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
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.config.ScheduledTask;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jl3b.touche_nubes.board.service.BoardService;
import com.jl3b.touche_nubes.boardvo.BoardImgVo;
import com.jl3b.touche_nubes.boardvo.BoardLikeVo;
import com.jl3b.touche_nubes.boardvo.BoardReVo;
import com.jl3b.touche_nubes.boardvo.BoardVo;
import com.jl3b.touche_nubes.horseheadvo.HorseheadVo;
import com.jl3b.touche_nubes.ideavo.IdeaImgVo;
import com.jl3b.touche_nubes.ideavo.IdeaLikeVo;
import com.jl3b.touche_nubes.ideavo.IdeaVo;
import com.jl3b.touche_nubes.member.service.MemberService;
import com.jl3b.touche_nubes.membervo.ResiVo;
import com.jl3b.touche_nubes.noticevo.NoticeVo;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	//걍 메인 테스트용
	@RequestMapping("/main.jan")
	public String main() {
		//boardService.test();
		return "board/main";
	}
	
	/////////////////////////////////////공지사항
	//글쓰기
	@RequestMapping("/notice_write.jan")
	public String writeNotice() {		//말머리 테스트
		return "board/notice_write";
	}
	@RequestMapping("/notice_write_process.jan")
	public String writeNoticeProcess(NoticeVo noticeVo, HttpSession session) {
		
		ResiVo resiVo = (ResiVo)session.getAttribute("sessionUser");
		noticeVo.setResi_no(resiVo.getResi_no());
		boardService.writeNotice(noticeVo);
		
		return "redirect:./notice.jan";
	}
	
	//공지 리스트
	@RequestMapping("/notice.jan")
	public String notice(Model model, String searchWord, 
				@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
				HttpSession session) {
		
		if(currentPage <= 0) {
			currentPage = 1;
		}
		
		List<Map<String, Object>> list = boardService.noticeList(searchWord, currentPage);
		
		//총 게시글 수
		int totalCount = boardService.noticeSearchCount(searchWord);
		
		//페이지 짜르는 거 할 거야
		int beginPage = ((currentPage-1) / 5) * 5 + 1;
		int endPage = ((currentPage-1)/5+1)*5;
		
		if(endPage > (totalCount-1)/10 + 1) {
			endPage = (totalCount-1)/10 + 1;
		}
		
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("noticeList", list);
		
		return "board/notice";
	}
	
	//글 하나 읽기
	@RequestMapping("/notice_read.jan")
	public String readNotice(int notice_no, Model model) {		
		
		Map<String, Object> map = boardService.viewNotice(notice_no);
		model.addAttribute("readNotice", map);
		
		return "board/notice_read";
	}
	
	//글삭제
	@RequestMapping("/notice_delete_process.jan")
	public String deleteNotice(int notice_no) {
		
		boardService.deleteNotice(notice_no);
		
		return "redirect:./notice.jan";
	}
	
	//글수정
	@RequestMapping("/notice_change.jan")
	public String changeNotice(int notice_no, Model model) {		
		
		model.addAttribute("readNotice", boardService.viewNotice(notice_no));
		
		return "board/notice_change";
	}
	@RequestMapping("/notice_change_process.jan")
	public String changeNoticeProcess(NoticeVo noticeVo) {						
		
		boardService.changeNotice(noticeVo);
		
		return "redirect:./notice.jan";
	}
	
	
	///////////////////////////////////자게
	@RequestMapping("/board.jan")
	public String board(String searchWord,Model model,
				@RequestParam(value="currPage", required = false, defaultValue ="1")int currPage) {
			
		List<Map<String, Object>> list = boardService.boardList(searchWord,currPage);
		List<Map<String, Object>> list2 = boardService.boardNoticeList(searchWord,currPage);	//상단 고정 공지
		boardService.changeHot();
		List<Map<String, Object>> list3 = boardService.boardHotList(searchWord, currPage);		//인기글 고정
		
		
		
		int totalCount = boardService.getBoardDataCount(searchWord);
		int beginPage = ((currPage-1)/5) *5 +1;
		int endPage = ((currPage-1)/5+1) * (5);
		
		if(endPage>(totalCount-1)/10+1) {
			endPage=((totalCount-1))/10+1;	
		}
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("currPage", currPage);
		model.addAttribute("boardList", list);
		model.addAttribute("boardNoticeList",list2);		//공지 고정
		model.addAttribute("boardHotList",list3);			//인기글 고정
		
		return "board/board";
	}
	
	//글쓰기
	@RequestMapping("/board_write.jan")
	public String writeBoard(Model model) {
		return "board/board_write";
	}
	@RequestMapping("/board_write_process.jan")
	   public String writeBoardProcess(MultipartFile [] boardImgList,BoardVo boardVo, HttpSession session) {
	      // Vo 객체에는 필요한 정보들을 불러낼 수 있기 때문에 사용한다.
	      // session.getAttribute 는 오브젝트파일로 받기 때문에 ResiVo로 형변환 한다.
	      String RootFolderName = "C:/upload/";
	      
	      Date today = new Date();
	      
	      SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd");
	      
	      String todayFolder = df.format(today);
	      
	      String SaveFolderName = RootFolderName + todayFolder;
	      
	      File SaveFolder = new File (SaveFolderName);
	   
	      if(!SaveFolder.exists()){
	         SaveFolder.mkdirs();
	      
	      }
	      List<BoardImgVo> BoardImgList = new ArrayList<BoardImgVo>();
	      
	      for(MultipartFile file :boardImgList ) {
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
	      
	      // DB에 담을 Vo객체를 생성 
	      BoardImgVo boardImgVo = new BoardImgVo();
	      
	      boardImgVo.setBoard_img_title(todayFolder+"/"+SaveFileTitle);
	      
	      boardImgVo.setBoard_img_path(SaveRealPath);
	      
	      BoardImgList.add(boardImgVo);
	      }
	      ResiVo resiVo = (ResiVo) session.getAttribute("sessionUser");

	      boardVo.setResi_no(resiVo.getResi_no());
	   
	      boardService.writeBoard(boardVo,BoardImgList);
	   
	      return "redirect:./board.jan";
	   }
	
	//글 하나 읽기
	@RequestMapping("/board_read.jan")
	public String readBoard(int board_no, Model model, BoardLikeVo boardLikeVo) {
		
		Map<String, Object> map = boardService.viewBoard(board_no);
		List<Map<String, Object>> boardReplList = boardService.getReplyList(board_no);
		
		model.addAttribute("readBoard", map);
		model.addAttribute("boardReplList",boardReplList);
		
		return "board/board_read";
	}
	
	//글삭제
	@RequestMapping("/board_delete_process.jan")
	public String deleteBoard(int board_no) {
		boardService.deleteBoard(board_no);			//게시글 삭제
		boardService.deleteBoardImg(board_no);		//게시글 이미지 삭제
		boardService.deleteBoardRe(board_no);		//게시글 댓글 삭제

		return "redirect:./board.jan";
	}
	
	//글수정
	@RequestMapping("/board_change.jan")
	public String changeBoard(int board_no, Model model) {
		model.addAttribute("readBoard", boardService.viewBoard(board_no));
		return "board/board_change";
	}
	@RequestMapping("/board_change_process.jan")
	public String updateContentProcess(BoardVo boardVo) {
		boardService.changeBoard(boardVo);
		return "redirect:./board.jan";
	}
	
	//추천!!
	@RequestMapping("/choose_like_process.jan")
	public String chooseLikeProcess(BoardLikeVo boardLikeVo, HttpSession session) {
		int currentPage = boardLikeVo.getBoard_no();
		int resiVo = ((ResiVo)session.getAttribute("sessionUser")).getResi_no();
		boardLikeVo.setResi_no(resiVo);
		
		BoardLikeVo likeData = boardService.checkLike(boardLikeVo);			//중복방지 본인확인
		
		if(likeData == null) {
			boardService.chooseLike(boardLikeVo);
			return "redirect:./board_read.jan?board_no="+currentPage;
		}else {
			return "redirect:./board_read.jan?board_no="+currentPage;
		}
	}
	
	//댓글!
	@RequestMapping("/write_reply_process.jan")
	public String wirteReplyProcess(HttpSession session, BoardReVo boardReVo) {
		int resiNo = ((ResiVo)session.getAttribute("sessionUser")).getResi_no();
		int boardNo = boardReVo.getBoard_no();
		boardReVo.setResi_no(resiNo);
		boardService.insertRepl(boardReVo);
		
		return "redirect:./board_read.jan?board_no="+boardNo;
	}
	
	//이미지 삭제
	@RequestMapping("/delete_board_img.jan")
	public String deleteBoardImg(int board_no) {
		boardService.deleteBoardImg(board_no);
		return "redirect:./board_read.jan?board_no="+board_no ;
	}
	
	
	
	
	////////////////////////////////// 주민청원게시판
	//주민청원게시판 리스트
	@RequestMapping("/idea.jan")
	public String idea(String searchWord, Model model,
			@RequestParam(value = "currPage", required = false, defaultValue = "1") int currPage) {

		List<Map<String, Object>> list = boardService.ideaList(searchWord, currPage);
		List<Map<String, Object>> list2 = boardService.boardNoticeList(searchWord,currPage);	//공지 상단 고정
		
		int totalCount = boardService.getIdeaDataCount(searchWord);
		int beginPage = ((currPage - 1) / 5) * 5 + 1;
		int endPage = ((currPage - 1) / 5 + 1) * (5);

		if (endPage > (totalCount - 1) / 10 + 1) {
			endPage = ((totalCount - 1)) / 10 + 1;
		}
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("currPage", currPage);
		model.addAttribute("ideaList", list);
		model.addAttribute("ideaNoticeList",list2);

		return "board/idea";
	}
	
	//청원글쓰기
	@RequestMapping("/idea_write.jan")
	public String writeidea(Model model) {

		return "board/idea_write";
	}
	//청원글쓰기 프로세스
	@RequestMapping("/idea_write_process.jan")
	public String writeideaProcess(MultipartFile[] ideaImgList, IdeaVo ideaVo, HttpSession session) {
		// Vo 객체에는 필요한 정보들을 불러낼 수 있기 때문에 사용한다.
		// session.getAttribute 는 오브젝트파일로 받기 때문에 ResiVo로 형변환 한다.
		String RootFolderName = "C:/upload/";

		Date today = new Date();

		SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd");

		String todayFolder = df.format(today);

		String SaveFolderName = RootFolderName + todayFolder;

		File SaveFolder = new File(SaveFolderName);

		if (!SaveFolder.exists()) {
			SaveFolder.mkdirs();

		}
		List<IdeaImgVo> IdeaImgList = new ArrayList<IdeaImgVo>();
		
		for (MultipartFile file : ideaImgList) {
			if (file.getSize() <= 0) {
				continue;
			}
			// 파일명 랜덤 이름
			String SaveFileTitle = UUID.randomUUID().toString();

			String oriFileTitle = file.getOriginalFilename();

			SaveFileTitle += "_" + System.currentTimeMillis();

			SaveFileTitle += oriFileTitle.substring(oriFileTitle.lastIndexOf("."));

			String SaveRealPath = SaveFolderName + "/" + SaveFileTitle;

			try {

				file.transferTo(new File(SaveRealPath));

			} catch (IOException e) {
				e.printStackTrace();
			}

			// DB에 담을 Vo객체를 생성
			IdeaImgVo ideaImgVo = new IdeaImgVo();

			ideaImgVo.setIdea_img_title(todayFolder + "/" + SaveFileTitle);

			ideaImgVo.setIdea_img_path(SaveRealPath);

			IdeaImgList.add(ideaImgVo);
		}
		ResiVo resiVo = (ResiVo) session.getAttribute("sessionUser");
		ideaVo.setResi_no(resiVo.getResi_no());
		boardService.writeIdea(ideaVo, IdeaImgList);

		return "redirect:./idea.jan";
	}

	//청원글읽기
	@RequestMapping("/idea_read.jan")
	public String readidea(int idea_no, Model model, IdeaLikeVo ideaLikeVo) {

		Map<String, Object> map = boardService.viewIdea(idea_no);
		model.addAttribute("readIdea", map);

		return "board/idea_read";
	}
	
	//글삭제
	@RequestMapping("/idea_delete_process.jan")
	public String deleteIdea(int idea_no) {

		boardService.deleteIdea(idea_no);

		return "redirect:./idea.jan";
	}

	// 글수정
	@RequestMapping("/idea_change.jan")
	public String changeIdea(int idea_no, Model model) {

		model.addAttribute("readIdea", boardService.viewIdea(idea_no));

		return "board/idea_change";
	}
	@RequestMapping("/idea_change_process.jan")
	public String updateIdeaProcess(IdeaVo ideaVo) {
		boardService.changeIdea(ideaVo);
		return "redirect:./idea.jan";
	}
	
	//청원글 좋아요 
	@RequestMapping("/choose_idea_like_process.jan")
	public String chooseLikeProcess(IdeaLikeVo ideaLikeVo, HttpSession session) {

		int currentPage = ideaLikeVo.getIdea_no();
		int resiVo = ((ResiVo) session.getAttribute("sessionUser")).getResi_no();

		ideaLikeVo.setResi_no(resiVo);
		IdeaLikeVo likeData = boardService.checkLike(ideaLikeVo);			//중복방지 본인확인

		if (likeData == null) {
			boardService.chooseLike(ideaLikeVo);
			return "redirect:./idea_read.jan?idea_no=" + currentPage;
		} else {
			return "redirect:./idea_read.jan?idea_no=" + currentPage;
		}
	}
	
	//청원글답변달기
	@RequestMapping("/idea_answer.jan")
	public String answerIdea(IdeaVo ideaVo, Model model) {

		model.addAttribute("readIdea", boardService.viewIdea(ideaVo.getIdea_no()));

		return "board/idea_answer";
	}
	@RequestMapping("/idea_answer_process.jan")
	public String answerIdeaProcess(IdeaVo ideaVo, HttpSession session) {
		
		ResiVo resiVo = (ResiVo) session.getAttribute("sessionUser");
		ideaVo.setResi_no(resiVo.getResi_no());
		boardService.answerIdea(ideaVo);

		return "redirect:./idea.jan";
	}
	
}
