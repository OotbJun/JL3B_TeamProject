package com.jl3b.touche_nubes.board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jl3b.touche_nubes.board.mapper.BoardImgSQLMapper;
import com.jl3b.touche_nubes.board.mapper.BoardReplSQLMapper;
import com.jl3b.touche_nubes.board.mapper.BoardSQLMapper;
import com.jl3b.touche_nubes.boardvo.BoardImgVo;
import com.jl3b.touche_nubes.boardvo.BoardLikeVo;
import com.jl3b.touche_nubes.boardvo.BoardReVo;
import com.jl3b.touche_nubes.boardvo.BoardVo;
import com.jl3b.touche_nubes.horseheadvo.HorseheadVo;
import com.jl3b.touche_nubes.ideavo.IdeaImgVo;
import com.jl3b.touche_nubes.ideavo.IdeaLikeVo;
import com.jl3b.touche_nubes.ideavo.IdeaVo;
import com.jl3b.touche_nubes.member.mapper.MemberSQLMapper;
import com.jl3b.touche_nubes.membervo.ResiVo;
import com.jl3b.touche_nubes.noticevo.NoticeVo;

@Service
public class BoardService {
	
	@Autowired
	private BoardSQLMapper boardSQLMapper;
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	@Autowired
	private BoardImgSQLMapper boardImgSQLMapper;
	@Autowired
	private BoardReplSQLMapper boardReplSQLMapper;
	
	//말머리 리스트 테스트
//	public List<Map<String, Object>> chooseHorsehead(String sort) {
//		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
//		List<HorseheadVo> horseheadList = null;
//		
//		
//		horseheadList = boardSQLMapper.selectHorsehead(sort);
//		
//		for(HorseheadVo horseheadVo : horseheadList) {
//			
//			NoticeVo noticeVo = boardSQLMapper.selectNoticeBySort(horseheadVo.getHorsehead_sort());
//			
//			Map<String, Object> map = new HashMap<String, Object>();
//			
//			map.put("horseheadVo", horseheadVo);
//			map.put("noticeVo", noticeVo);
//			list.add(map);
//		}
//		return list;
//	}
	
	//말머리 선택
	public HorseheadVo chooseHorsehead(String sort){
		return boardSQLMapper.selectNoticeHorsehead(sort);
	}
	
	
	//////////////////////////////////////////공지사항
	//글쓰기
	public void writeNotice(NoticeVo noticeVo) {
		boardSQLMapper.insertNotice(noticeVo);
		//boardSQLMapper.selectHorsehead(sort);
	}
	//글삭제
	public void deleteNotice(int notice_no) {
		boardSQLMapper.deleteNoticeByNo(notice_no);
	}
	//글수정
	public void changeNotice(NoticeVo noticeVo) {			//테스트
		boardSQLMapper.updateNoticeByNo(noticeVo);
	}
	//검색
	public int noticeSearchCount(String searchWord) {
		if(searchWord == null) {
			return boardSQLMapper.selectNoticeAllCount();
		}else {
			return boardSQLMapper.selectNoticeByTitleCount(searchWord);
		}
	}
	//공지 리스트
	public List<Map<String, Object>> noticeList(String searchWord, int currentPage){
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<NoticeVo> noticeList = null;
		
		//페이징 + 검색
		if(searchWord == null) {
			noticeList = boardSQLMapper.selectNoticeAll(currentPage);
		}else {
			noticeList = boardSQLMapper.selectNoticeByTitle(searchWord, currentPage);
		}
		
		//담기
		for(NoticeVo noticeVo : noticeList) {
			ResiVo resiVo = memberSQLMapper.selectResiByNo(noticeVo.getResi_no());
			//HorseheadVo horseheadVo = boardSQLMapper.selectNoticeHorsehead(noticeVo.getHorsehead_sort());
//			horseheadList = boardSQLMapper.selectHorsehead(noticeVo.getHorsehead_sort());
//			
//			HorseheadVo horseheadVo = (HorseheadVo) horseheadList;
			
			HorseheadVo horseheadVo = boardSQLMapper.selectNoticeHorsehead(noticeVo.getHorsehead_sort());
			

			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("horseheadVo", horseheadVo);
			map.put("resiVo", resiVo);
			map.put("noticeVo", noticeVo);
			
			list.add(map);
		}
		return list;
	}
	//글보기
	public Map<String, Object> viewNotice(int notice_no) {				//테스트
		Map<String, Object> map = new HashMap<String, Object>();
		boardSQLMapper.updateNoticeReadCount(notice_no);	//조회수
		NoticeVo noticeVo = boardSQLMapper.selectNoticeByNo(notice_no);
		ResiVo resiVo = memberSQLMapper.selectResiByNo(noticeVo.getResi_no());
		
		//
		HorseheadVo horseheadVo = boardSQLMapper.selectNoticeHorsehead(noticeVo.getHorsehead_sort());
		map.put("horseheadVo", horseheadVo);
		
		
		map.put("noticeVo", noticeVo);
		map.put("resiVo", resiVo);
		
		
		return map;
	}
	
	
	
	////////////////////////////////////////////////자게
	public void writeBoard(BoardVo boardVo, List<BoardImgVo> boardImgList) {
		int boardKey = boardSQLMapper.createBoardKey();
	      
	      boardVo.setBoard_no(boardKey);
	     
	      boardSQLMapper.insertBoard(boardVo);
	      
	      for (BoardImgVo boardImgVo : boardImgList) {
	      
	    	  boardImgVo.setBoard_no(boardKey);
	         
	    	  boardImgSQLMapper.insertBoardImg(boardImgVo);
	      }
	   }
	
	public List<Map<String, Object>> boardList(String searchWord, int currPage) {
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		List<BoardVo> boardlist = null;
		
		
		if (searchWord == null) {
			boardlist = boardSQLMapper.selectBoardAll(currPage);
		} else {
			boardlist = boardSQLMapper.selectBoardByTitle(searchWord, currPage);
		}

		for (BoardVo boardVo : boardlist) {
			
			ResiVo resiVo = memberSQLMapper.selectResiByNo(boardVo.getResi_no());
			
			int like = boardSQLMapper.selectLikeUpCount(boardVo.getBoard_no());
			int replyCount = boardReplSQLMapper.selectReplyCount(boardVo.getBoard_no());
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("resiVo", resiVo);
			map.put("like", like);
			map.put("boardVo", boardVo);
			map.put("replyCount", replyCount);
			
			list.add(map);
		}
		return list;
	}
	
	//상단 고정 공지
	public List<Map<String, Object>> boardNoticeList(String searchWord, int currPage) {
		List<Map<String, Object>> list2 = new ArrayList<Map<String, Object>>();
		List<NoticeVo> noticelist = null;
		if (searchWord == null) {
			noticelist = boardSQLMapper.selectNoticeFix();
		} else {
			noticelist = boardSQLMapper.selectNoticeFix();
		}
		
		for(NoticeVo noticeVo : noticelist) {
			ResiVo resiVo = memberSQLMapper.selectResiByNo(noticeVo.getResi_no());
			Map<String, Object> map2 = new HashMap<String, Object>();
			
			map2.put("resiVonotice", resiVo);
			map2.put("noticeVo", noticeVo);
	     	list2.add(map2);
		}
		
		return list2;
	}
	
	public List<Map<String, Object>> boardHotList(String searchWord, int currPage) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		List<BoardVo> hotList = null;
		if (searchWord == null) {
			hotList = boardSQLMapper.selectHotFix();
		} else {
			hotList = boardSQLMapper.selectHotFix();
		}
		
		
		
		for(BoardVo boardVo : hotList) {
			ResiVo resiVo = memberSQLMapper.selectResiByNo(boardVo.getResi_no());
			Map<String, Object> map = new HashMap<String, Object>();
			int replyCount = boardReplSQLMapper.selectReplyCount(boardVo.getBoard_no());
			
			map.put("resiVoHot", resiVo);
			map.put("boardVo", boardVo);
			map.put("replyCount", replyCount);
	     	list.add(map);
		}
		
		return list;
	}

	public Map<String, Object> viewBoard(int board_no) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		boardSQLMapper.updateBoardReadCount(board_no);				//조회수
		BoardVo boardVo = boardSQLMapper.selectBoardByNo(board_no);
		ResiVo resiVo = memberSQLMapper.selectResiByNo(boardVo.getResi_no());
		List<BoardImgVo> boardImgList = boardImgSQLMapper.selectBoardByNo(board_no);
		
		int upCount = boardSQLMapper.selectLikeUpCount(boardVo.getBoard_no());
		int downCount = boardSQLMapper.selectLikeDownCount(boardVo.getBoard_no());

		map.put("resiVo", resiVo);
		map.put("boardImgList", boardImgList);
		map.put("boardVo", boardVo);
		map.put("upCount", upCount);
		map.put("downCount", downCount);

		return map;
	}

	public void deleteBoard(int board_no) {
		boardSQLMapper.deleteBoardByNo(board_no);
	}

	public void changeBoard(BoardVo boardVo) {
		boardSQLMapper.updateBoard(boardVo);
	}

	public int getBoardDataCount(String searchWord) {
		if (searchWord == null) {
			return boardSQLMapper.selectBoardAllCount();
		} else {
			return boardSQLMapper.selectBoardByTitleCount(searchWord);
		}
	}
	
	public void changeHot() {			//인기글로 가버려~~
		boardSQLMapper.updateHot();
	}
	
	//추천
	public void chooseLike(BoardLikeVo boardLikeVo) {
		boardSQLMapper.insertBoardLike(boardLikeVo);
	}
	public BoardLikeVo checkLike(BoardLikeVo boardLikeVo) {		//중복방지 본인확인
		return boardSQLMapper.selectLikeByNo(boardLikeVo);
	}
	//할 필요 없어서 지움~ 다른 방법으로 카운트
//	public int likeUpCount() {									//좋아요 개수
//		return boardSQLMapper.selectLikeUpCount();
//	}
//	public int likeDownCount() {								//싫어요 개수
//		return boardSQLMapper.selectLikeDownCount();
//	}
	
	//댓글
	public  List<Map<String, Object>> getReplyList(int board_no){
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		List<BoardReVo> boardReplyList = boardReplSQLMapper.selectBoardRepleList(board_no);
		
		for(BoardReVo boardReVo : boardReplyList ) {
			
			ResiVo resiVo = memberSQLMapper.selectResiByNo(boardReVo.getResi_no());
			
			Map<String,Object> map = new HashMap<String, Object>();
			
			map.put("boardReVo", boardReVo);
			
			map.put("resiVo",resiVo);
			
			list.add(map);
		}
		return list;
	}

    //댓글삽입
	public void insertRepl(BoardReVo boardReVo) {
	    boardReplSQLMapper.insertBoardReply(boardReVo);
	}
	// 댓글 수정
	public void changeRepl(BoardReVo boardReVo) {
	    boardReplSQLMapper.updateBoardReply(boardReVo);
	}
	// 댓글 삭제 
	public void deleteRepl(int board_re_no) {
	    boardReplSQLMapper.deleteBoardReply(board_re_no);
	}
	
	
	///////////////////////////////////////////////////// 청원
	//글쓰기
	public void writeIdea(IdeaVo ideaVo, List<IdeaImgVo> ideaImgList) {
		int ideaKey = boardSQLMapper.createIdeaKey();

		ideaVo.setIdea_no(ideaKey);

		boardSQLMapper.insertIdea(ideaVo);

		for (IdeaImgVo ideaImgVo : ideaImgList) {

			ideaImgVo.setIdea_no(ideaKey);

			boardImgSQLMapper.insertIdeaImg(ideaImgVo);
		}
	}
	public List<Map<String, Object>> ideaNoticeList(String searchWord, int currPage) {
		List<Map<String, Object>> list2 = new ArrayList<Map<String, Object>>();
		List<NoticeVo> noticelist = null;
		if (searchWord == null) {
			noticelist = boardSQLMapper.selectNoticeIdeaFix();
		} else {
			noticelist = boardSQLMapper.selectNoticeIdeaFix();
		}
		
		for(NoticeVo noticeVo : noticelist) {
			ResiVo resiVo = memberSQLMapper.selectResiByNo(noticeVo.getResi_no());
			Map<String, Object> map2 = new HashMap<String, Object>();
			
			map2.put("resiVonotice", resiVo);
			map2.put("noticeVo", noticeVo);
	     	list2.add(map2);
		}
		
		return list2;
	}
	//글 리스트
	public List<Map<String, Object>> ideaList(String searchWord, int currPage) {

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		List<IdeaVo> idealist = null;

		if (searchWord == null) {
			idealist = boardSQLMapper.selectIdeaAll(currPage);
		} else {
			idealist = boardSQLMapper.selectIdeaByTitle(searchWord, currPage);
		}

		for (IdeaVo ideaVo : idealist) {

			ResiVo resiVo = memberSQLMapper.selectResiByNo(ideaVo.getResi_no());

			Map<String, Object> map = new HashMap<String, Object>();

			map.put("resiVo", resiVo);

			map.put("ideaVo", ideaVo);

			list.add(map);
		}
		return list;
	}
		
	//글보기
	public Map<String, Object> viewIdea(int idea_no) {

		Map<String, Object> map = new HashMap<String, Object>();

		boardSQLMapper.updateIdeaReadCount(idea_no);

		IdeaVo ideaVo = boardSQLMapper.selectIdeaByNo(idea_no);

		ResiVo resiVo = memberSQLMapper.selectResiByNo(ideaVo.getResi_no());

		
		System.out.println("qqqq" + idea_no);
		List<IdeaImgVo> ideaImgList = boardImgSQLMapper.selectIdeaByNo(idea_no);

		map.put("resiVo", resiVo);

		map.put("ideaImgList", ideaImgList);
		
		map.put("ideaVo", ideaVo);

		return map;
	}
	
	//글삭제
	public void deleteIdea(int idea_no) {
		boardSQLMapper.deleteIdeaByNo(idea_no);
	}
	
	//글수정
	public void changeIdea(IdeaVo ideaVo) {
		boardSQLMapper.updateIdea(ideaVo);
	}

	//글 개수
	public int getIdeaDataCount(String searchWord) {
		if (searchWord == null) {
			return boardSQLMapper.selectIdeaAllCount();
		} else {
			return boardSQLMapper.selectIdeaByTitleCount(searchWord);
		}
	}

	// 추천
	public void chooseLike(IdeaLikeVo ideaLikeVo) {
		boardSQLMapper.insertIdeaLike(ideaLikeVo);
	}

	public IdeaLikeVo checkLike(IdeaLikeVo ideaLikeVo) { // 중복방지 본인확인
		return boardSQLMapper.selectIdeaLikeByNo(ideaLikeVo);
	}

	public int recommendCount(int idea_no) { // 좋아요 개수
		return boardSQLMapper.selectIdeaLikeUpCount(idea_no);
	}
	
	//답글쓰기
	public void answerIdea(IdeaVo ideaVo) {
		boardSQLMapper.insertIdeaAnswer(ideaVo);
	}
	
//	public void test() {
//		boardSQLMapper.test();
//	}
	
}
