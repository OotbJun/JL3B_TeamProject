package com.jl3b.touche_nubes.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jl3b.touche_nubes.board.service.BoardService;
import com.jl3b.touche_nubes.boardvo.BoardVo;
import com.jl3b.touche_nubes.horseheadvo.HorseheadVo;
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
		return "board/main";
	}
	
	/////////////////////////////////////공지사항
	//글쓰기
	@RequestMapping("/write_notice.jan")
	public String writeNotice() {
		return "board/write_notice";
	}
	
	@RequestMapping("/write_notice_process.jan")
	public String writeNoticeProcess(NoticeVo noticeVo, HttpSession session) {
		
		ResiVo resiVo = (ResiVo)session.getAttribute("sessionUser");
		noticeVo.setResi_no(resiVo.getResi_no());
		boardService.writeNotice(noticeVo);
		
		return "redirect:./notice.jan";
	}
	
	//공지 리스트
	@RequestMapping("/notice.jan")
	public String notice(Model model, String search_word, 
				@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
		
		if(currentPage <= 0) {
			currentPage = 1;
		}
		
		List<Map<String, Object>> list = boardService.noticeList(search_word, currentPage);
		
		//총 게시글 수
		int totalCount = boardService.noticeSearchCount(search_word);
		
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
	
	//글보기
	@RequestMapping("/read_notice.jan")
	public String readNotice(int notice_no, Model model) {
		
		Map<String, Object> map = boardService.viewNotice(notice_no);
		model.addAttribute("readNotice", map);
		
		return "board/read_notice";
	}
	
	//글삭제
	@RequestMapping("/delete_notice_process.jan")
	public String deleteNotice(int notice_no) {
		
		boardService.deleteNotice(notice_no);
		
		return "redirect:./notice.jan";
	}
	
	//글수정
	@RequestMapping("/change_notice.jan")
	public String changeNotice(int notice_no, Model model) {
		
		model.addAttribute("readNotice", boardService.viewNotice(notice_no));
		
		return "board/change_notice";
	}
	
	@RequestMapping("/change_notice_process.jan")
	public String changeNoticeProcess(NoticeVo noticeVo) {
		
		boardService.changeNotice(noticeVo);
		
		return "redirect:./notice.jan";
	}
	
	
	///////////////////////////////////자게
	@RequestMapping("/board.jan")
	public String board(String searchWord,Model model,
				@RequestParam(value="currPage", required = false, defaultValue ="1")int currPage) {
			
		List<Map<String, Object>> list = boardService.boardList(searchWord,currPage);
		
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
		
		return "board/board";
	}

	@RequestMapping("/write_board.jan")
	public String writeBoard(Model model) {
//		    Map<String, Object> map = boardService.choiceHeadList();
//			model.addAttribute("horseheadList", map);
		return "board/write_board";
	}
	
	@RequestMapping("/write_board_process.jan")
	public String writeBoardProcess(BoardVo boardVo, HttpSession session) {
		// Vo 객체에는 필요한 정보들을 불러낼 수 있기 때문에 사용한다.
		// session.getAttribute 는 오브젝트파일로 받기 때문에 ResiVo로 형변환 한다.
		ResiVo resiVo = (ResiVo) session.getAttribute("sessionUser");

		boardVo.setResi_no(resiVo.getResi_no());
	
		boardService.writeBoard(boardVo);
	
		return "redirect:./board.jan";
	}

	@RequestMapping("/read_board.jan")
	public String readBoard(int board_no, Model model) {
		
		Map<String, Object> map = boardService.viewBoard(board_no);
		
		model.addAttribute("readBoard", map);
		
		return "board/read_board";
	}

	@RequestMapping("/delete_board_process.jan")
	public String deleteBoard(int board_no) {
		boardService.deleteBoard(board_no);
		return "redirect:./board.jan";
	}

	@RequestMapping("/change_board.jan")
	public String changeBoard(int board_no, Model model) {
		model.addAttribute("readBoard", boardService.viewBoard(board_no));
		return "board/change_board";
	}

	@RequestMapping("/change_board_process.jan")
	public String updateContentProcess(BoardVo boardVo) {
		boardService.changeBoard(boardVo);
		return "redirect:./board.jan";
	}
}
