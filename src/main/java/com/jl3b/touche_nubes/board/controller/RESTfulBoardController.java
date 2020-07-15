
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
import com.jl3b.touche_nubes.membervo.AdminVo;
import com.jl3b.touche_nubes.membervo.MemberVo;

@Controller
@ResponseBody
@RequestMapping("/board/*")
public class RESTfulBoardController {

	@Autowired
	private BoardService boardService;

	// 댓글 등록
	@RequestMapping("/write_reply_process.do")
	@ResponseBody
	public int writeReplyProcess(@RequestParam int board_no, @RequestParam String board_re_content,
			HttpSession session) {

		int Member_no = ((MemberVo) session.getAttribute("sessionUser")).getMember_no();
		BoardReVo boardrevo = new BoardReVo();
		boardrevo.setMember_no(Member_no);
		boardrevo.setBoard_no(board_no);
		boardrevo.setBoard_re_content(board_re_content);

		return boardService.insertRepl(boardrevo);
	}

	// 댓글 출력
	@ResponseBody
	@RequestMapping("/get_reply_list.do")
	public List<Map<String, Object>> getReplyList(@RequestParam("board_no") int board_no, Model model) {

		List<Map<String, Object>> boardReplList = boardService.getReplyList(board_no);

		return boardReplList;
	}

	// 댓글 수정
	@RequestMapping("/update_reply_process.do")
	@ResponseBody
	private int updateReplyList(@RequestParam int board_re_no, @RequestParam String board_re_content) {

		BoardReVo boardReVo = new BoardReVo();									//여기도 예외처리 들어가야 되는 거 아닌가?
		boardReVo.setBoard_re_no(board_re_no);
		boardReVo.setBoard_re_content(board_re_content);

		return boardService.changeRepl(boardReVo);
	}

	// 댓글 삭제
	@RequestMapping("/delete_reply_process.do/{board_re_no}") // 댓글 삭제
	@ResponseBody
	private int deleteReplyList(BoardReVo boardReVo, HttpSession session) {
		
		
		
		System.out.println(boardReVo.getBoard_re_no());
		
		int memberNo = ((MemberVo) session.getAttribute("sessionUser")).getMember_no();
		//AdminVo adminVo = (AdminVo)session.getAttribute("sessionAdmin");
		boardReVo.setMember_no(memberNo);
		BoardReVo replyData = boardService.checkReply(boardReVo);				//왜 삭제만 한거지..?
		
		if(replyData == null || memberNo == 0) {
			return 0;
		}else {
			System.out.println("리턴 값 : " + boardService.deleteRepl(boardReVo.getBoard_re_no()));
			boardService.deleteRepl(boardReVo.getBoard_re_no());
			
			return 1;
		}
	}

	// 자게 추천!!
	@RequestMapping("/choose_like_process.do")
	public String chooseBoardLikeProcess(BoardLikeVo boardLikeVo, HttpSession session, Model model) {

		if (session.getAttribute("sessionUser") == null) {				//이거 자체는 의미 없는 것 같고
			return "board/board_fail";
		}

//		int currentPage = boardLikeVo.getBoard_no();
		int memberVo = ((MemberVo) session.getAttribute("sessionUser")).getMember_no();
		boardLikeVo.setMember_no(memberVo);

		BoardLikeVo likeData = boardService.checkLike(boardLikeVo); // 중복방지 본인확인
		
		model.addAttribute("likeData", likeData);
		

		if (likeData == null) {								//추천 이력이 있다면 취소, 없다면 추천
			boardService.chooseLike(boardLikeVo);			//추천
			return "true";
		} else {
			boardService.cancelBoardLike(boardLikeVo);		//추천 취소
			return "false";
		}
	}

	// 자게 추천 출력
	@RequestMapping("/get_likecount.do")
	public int getBoardLike(int board_no) {
		int likeCount = boardService.upCount(board_no);

		return likeCount;
	}

	// 자게 비추!!
	@RequestMapping("/choose_dislike_process.do")
	public String chooseDislikeProcess(BoardLikeVo boardLikeVo, HttpSession session) {

		if (session.getAttribute("sessionUser") == null) {
			return "board/board_fail";
		}
		
//			int currentPage = boardLikeVo.getBoard_no();
		int memberVo = ((MemberVo) session.getAttribute("sessionUser")).getMember_no();
		boardLikeVo.setMember_no(memberVo);

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
	@RequestMapping("/get_dislikecount.do")
	public int getBoardDislike(int board_no) {
		int dislikeCount = boardService.downCount(board_no);

		return dislikeCount;
	}
	
	   // 자기글 삭제
    @RequestMapping("/my_board_delete.do")
     public void deleteBoard(HttpSession session,BoardVo boardVo,@RequestParam(value = "chbox[]") List<String> chArr) {
       
    	 MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
         boardVo.setMember_no(memberVo.getMember_no());
    	
      for(String i : chArr) {
         int board_no = Integer.parseInt(i);
         boardVo.setBoard_no(board_no);
         boardService.deleteBoard(boardVo,session);  
      } 
   }

	/////////////////////////////////////////////// 청원
	// 청원 동의
	@RequestMapping("/choose_idea_like_process.do")
	public String chooseIdeaLikeProcess(IdeaLikeVo ideaLikeVo, HttpSession session) {

		if (session.getAttribute("sessionUser") == null) {
			return "board/board_fail";
		}

		int memberNo = ((MemberVo) session.getAttribute("sessionUser")).getMember_no();
		ideaLikeVo.setMember_no(memberNo);
		
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
	@RequestMapping("get_idea_likecount.do")
	public int getIdeaLike(int idea_no) {
		int ideaCount = boardService.recommendCount(idea_no);

		return ideaCount;
	}

}
