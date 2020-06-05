package com.jl3b.touche_nubes.vote.mapper;

import java.util.List;

import com.jl3b.touche_nubes.votevo.CandyImgVo;



public interface VoteImgSQLMapper {
	
	
	public void insertCandyImg(CandyImgVo candyImgVo);		//후보 이미지 등록
	public CandyImgVo selectCandyByNo(int candy_no);	//후보 이미지 출력
	
}
