package com.jl3b.touche_nubes.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jl3b.touche_nubes.boardvo.BoardLikeVo;
import com.jl3b.touche_nubes.boardvo.BoardVo;
import com.jl3b.touche_nubes.horseheadvo.HorseheadVo;
import com.jl3b.touche_nubes.noticevo.NoticeVo;

public interface BoardSQLMapper {
	
	/////////////////////공지사항
	//보드넘버 가져올 것
	public int createKey();
	
	//글쓰기
	public void insertNotice(NoticeVo noticeVo);
	
	//글보기
	public NoticeVo selectNoticeByNo(int no);
	
	//게시글 개수
	public int selectNoticeAllCount();
		
	//글삭제
	public void deleteNoticeByNo(int no);
	
	//글수정
	public void updateNoticeByNo(NoticeVo noticeVo);
	
	//조회수
	public void updateNoticeReadCount(int no);
	
	//전체 글 리스트
	public List<NoticeVo> selectNoticeAll(int currentPage);
	
	//제목 검색(매개변수는 무조건 하나 밖에 못 받는다. 따라서 @param 써줘야함!)
	public List<NoticeVo> selectNoticeByTitle(@Param("title") String title, @Param("currentPage") int currentPage);
	
	//검색
	public int selectNoticeByTitleCount(String title);
	
	
	//////////////////////////자게
	public int createBoardKey();
	
	public void insertBoard(BoardVo boardVo);
	   
    public BoardVo selectBoardByNo(int no);
	
    public List<BoardVo> selectBoardAll(int currPage);
	
    public void deleteBoardByNo (int no);
    
    public void updateBoard(BoardVo boardVo);
	
    public void updateBoardReadCount(int no);
	
    public int selectBoardAllCount(); 
	
    public int selectBoardByTitleCount(String title);
	
    public List<BoardVo> selectBoardByTitle(@Param("title")String title, @Param("currPage") int currPage);
    
    //추천
    public void insertBoardLike(BoardLikeVo boardLikeVo);		//추천, 비추 입력
    
    public BoardLikeVo selectLikeByNo(BoardLikeVo boardLikeVo);	//중복방지 본인확인
    
    public int selectLikeUpCount(int boardNo);					//좋아요 개수
   
    public int selectLikeDownCount(int boardNo);				//싫어요 개수
    
    
		
}
