package com.jl3b.touche_nubes.board.mapper;

import java.util.List;

import com.jl3b.touche_nubes.boardvo.BoardImgVo;
import com.jl3b.touche_nubes.ideavo.IdeaImgVo;

public interface BoardImgSQLMapper {
	
	//////////////////////////////자게
	public void insertBoardImg(BoardImgVo boaradimgVo);
	public List<BoardImgVo> selectBoardByNo(int board_no);
	public int deleteBoardImg(int board_no);				//이미지 삭제
	
	
	//////////////////////////////청원
	public void insertIdeaImg(IdeaImgVo ideaimgVo);
	public List<IdeaImgVo> selectIdeaByNo(int idea_no);

}
