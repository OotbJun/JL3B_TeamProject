
package com.jl3b.touche_nubes.board.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jl3b.touche_nubes.board.service.BoardService;
import com.jl3b.touche_nubes.boardvo.BoardLikeVo;
import com.jl3b.touche_nubes.boardvo.BoardReVo;
import com.jl3b.touche_nubes.boardvo.BoardVo;
import com.jl3b.touche_nubes.ideavo.IdeaLikeVo;
import com.jl3b.touche_nubes.membervo.ResiVo;

@Controller
@ResponseBody
@RequestMapping("/board/*")
public class RESTfulBoardController {

	@Autowired
	private BoardService boardService;

	// 댓글 등록
	@RequestMapping("/write_reply_process.jan")
	@ResponseBody
	public int writeReplyProcess(@RequestParam int board_no, @RequestParam String board_re_content,
			HttpSession session) {

		int resi_no = ((ResiVo) session.getAttribute("sessionUser")).getResi_no();
		BoardReVo boardrevo = new BoardReVo();
		boardrevo.setResi_no(resi_no);
		boardrevo.setBoard_no(board_no);
		boardrevo.setBoard_re_content(board_re_content);

		return boardService.insertRepl(boardrevo);
	}

	// 댓글 출력
	@ResponseBody
	@RequestMapping("/get_reply_list.jan")
	public List<Map<String, Object>> getReplyList(@RequestParam("board_no") int board_no, Model model) {

		List<Map<String, Object>> boardReplList = boardService.getReplyList(board_no);

		return boardReplList;
	}

	// 댓글 수정
	@RequestMapping("/update_reply_process.jan")
	@ResponseBody
	private int updateReplyList(@RequestParam int board_re_no, @RequestParam String board_re_content) {

		BoardReVo boardReVo = new BoardReVo();
		boardReVo.setBoard_re_no(board_re_no);
		boardReVo.setBoard_re_content(board_re_content);

		return boardService.changeRepl(boardReVo);
	}

	// 댓글 삭제
	@RequestMapping("/delete_reply_process.jan/{board_re_no}") // 댓글 삭제
	@ResponseBody
	private int deleteReplyList(BoardReVo boardReVo, HttpSession session) {
		
		
		
		System.out.println(boardReVo.getBoard_re_no());
		
		int resiNo = ((ResiVo) session.getAttribute("sessionUser")).getResi_no();
		boardReVo.setResi_no(resiNo);
		BoardReVo replyData = boardService.checkReply(boardReVo);
		
		if(replyData == null) {
			return 0;
		}else {
			System.out.println("리턴 값 : " + boardService.deleteRepl(boardReVo.getBoard_re_no()));
			boardService.deleteRepl(boardReVo.getBoard_re_no());
			
			return 1;
		}
	}

	// 자게 추천!!
	@RequestMapping("/choose_like_process.jan")
	public String chooseBoardLikeProcess(BoardLikeVo boardLikeVo, HttpSession session, Model model) {

		if (session.getAttribute("sessionUser") == null) {
			return "board/board_fail";
		}

//		int currentPage = boardLikeVo.getBoard_no();
		int resiVo = ((ResiVo) session.getAttribute("sessionUser")).getResi_no();
		boardLikeVo.setResi_no(resiVo);

		BoardLikeVo likeData = boardService.checkLike(boardLikeVo); // 중복방지 본인확인
		
		model.addAttribute("likeData", likeData);
		

		if (likeData == null) {
			boardService.chooseLike(boardLikeVo);			//추천
			return "true";
		} else {
			boardService.cancelBoardLike(boardLikeVo);		//추천 취소
			return "false";
		}
	}

	// 자게 추천 출력
	@RequestMapping("/get_likecount.jan")
	public int getBoardLike(int board_no) {
		int likeCount = boardService.upCount(board_no);

		return likeCount;
	}

	// 자게 비추!!
	@RequestMapping("/choose_dislike_process.jan")
	public String chooseDislikeProcess(BoardLikeVo boardLikeVo, HttpSession session) {

		if (session.getAttribute("sessionUser") == null) {
			return "board/board_fail";
		}
		
//			int currentPage = boardLikeVo.getBoard_no();
		int resiVo = ((ResiVo) session.getAttribute("sessionUser")).getResi_no();
		boardLikeVo.setResi_no(resiVo);

		BoardLikeVo likeData = boardService.checkLike(boardLikeVo); // 중복방지 본인확인

		if (likeData == null) {
			boardService.chooseLike(boardLikeVo);			//비추
			return "true";
		} else {
			boardService.cancelBoardLike(boardLikeVo);		//비추 취소
			return "false";
		}
	}

	// 자게 비추천 출력
	@RequestMapping("/get_dislikecount.jan")
	public int getBoardDislike(int board_no) {
		int dislikeCount = boardService.downCount(board_no);

		return dislikeCount;
	}

	/////////////////////////////////////////////// 청원
	// 청원 동의
	@RequestMapping("/choose_idea_like_process.jan")
	public String chooseIdeaLikeProcess(IdeaLikeVo ideaLikeVo, HttpSession session) {

		if (session.getAttribute("sessionUser") == null) {
			return "board/board_fail";
		}

		int resiNo = ((ResiVo) session.getAttribute("sessionUser")).getResi_no();
		ideaLikeVo.setResi_no(resiNo);
		
		IdeaLikeVo ideaData = boardService.checkLike(ideaLikeVo); // 중복방지 확인

		if (ideaData == null) {
			boardService.chooseLike(ideaLikeVo);				//추천
			return "true";
		} else {
			boardService.cancelIdeaLike(ideaLikeVo);			//추천 취소
			return "false";
		}
	}

	// 청원 동의 출력
	@RequestMapping("get_idea_likecount.jan")
	public int getIdeaLike(int idea_no) {
		int ideaCount = boardService.recommendCount(idea_no);

		return ideaCount;
	}

}
