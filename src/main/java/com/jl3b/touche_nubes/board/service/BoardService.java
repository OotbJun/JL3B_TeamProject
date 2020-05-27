package com.jl3b.touche_nubes.board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jl3b.touche_nubes.board.mapper.BoardSQLMapper;
import com.jl3b.touche_nubes.boardvo.BoardVo;
import com.jl3b.touche_nubes.horseheadvo.HorseheadVo;
import com.jl3b.touche_nubes.member.mapper.MemberSQLMapper;
import com.jl3b.touche_nubes.membervo.ResiVo;
import com.jl3b.touche_nubes.noticevo.NoticeVo;

@Service
public class BoardService {
	
	@Autowired
	private BoardSQLMapper boardSQLMapper;
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	//////////////////////////////////////////공지사항
	//글쓰기
	public void writeNotice(NoticeVo noticeVo) {
		boardSQLMapper.insertNotice(noticeVo);
	}
	//글삭제
	public void deleteNotice(int notice_no) {
		boardSQLMapper.deleteNoticeByNo(notice_no);
	}
	//글수정
	public void changeNotice(NoticeVo noticeVo) {
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
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("resiVo", resiVo);
			map.put("noticeVo", noticeVo);
			
			list.add(map);
		}
		return list;
	}
	//글보기
	public Map<String, Object> viewNotice(int notice_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		boardSQLMapper.updateNoticeReadCount(notice_no);	//조회수
		NoticeVo noticeVo = boardSQLMapper.selectNoticeByNo(notice_no);
		ResiVo resiVo = memberSQLMapper.selectResiByNo(noticeVo.getResi_no());
		
		map.put("noticeVo", noticeVo);
		map.put("resiVo", resiVo);
		
		
		return map;
	}
	
	
	
	////////////////////////////////////////////////자게
	public void writeBoard(BoardVo boardVo) {
		boardSQLMapper.insertBoard(boardVo);
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
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("resiVo", resiVo);
			
			map.put("boardVo", boardVo);
			
			list.add(map);
		}
		return list;
	}

	public Map<String, Object> viewBoard(int board_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		boardSQLMapper.updateBoardReadCount(board_no);
		BoardVo boardVo = boardSQLMapper.selectBoardByNo(board_no);
		ResiVo resiVo = memberSQLMapper.selectResiByNo(boardVo.getResi_no());

		map.put("resiVo", resiVo);
		map.put("boardVo", boardVo);

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
	
}
