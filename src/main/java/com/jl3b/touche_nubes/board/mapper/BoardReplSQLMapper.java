package com.jl3b.touche_nubes.board.mapper;

import java.util.List;

import com.jl3b.touche_nubes.boardvo.BoardReVo;

public interface BoardReplSQLMapper {
	
public List<BoardReVo> selectBoardRepleList(int board_no);
	
	public int insertBoardReply(BoardReVo boardreVo);
	
	public int updateBoardReply(BoardReVo boardreVo);
	
	public int deleteBoardReply(int board_re_no);						//게시글 해당 댓글 삭제
	
	public int selectReplyCount(int board_no);							//리스트에 댓글수 출력
	
	public void deleteBoardRe(int board_no);							//게시글 번호로 삭제시킴으로 전체 댓글 삭제
	
	//테스트
	public BoardReVo selectCheckReply(BoardReVo boardReVo);
	
}
