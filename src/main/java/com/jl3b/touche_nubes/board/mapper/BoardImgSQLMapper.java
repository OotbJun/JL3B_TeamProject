package com.jl3b.touche_nubes.board.mapper;

import java.util.List;

import com.jl3b.touche_nubes.boardvo.BoardImgVo;

public interface BoardImgSQLMapper {
	
	public void insertBoardImg(BoardImgVo boaradimgVo);
	   
	public List<BoardImgVo> selectBoardByNo(int board_no);
	
}
