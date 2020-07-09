package com.jl3b.touche_nubes.center.mapper;

import java.util.List;

import com.jl3b.touche_nubes.centervo.CenterImgVo;

public interface CenterImgSQLMapper {
	
	public void insertCenterInfoImg(CenterImgVo centerImgVo);		//센터 정보 이미지
	public List<CenterImgVo> selectCenterImgAll(int center_no);		//상세페이지에서 이미지 전부 다
	public CenterImgVo selectCenterImg(int center_no);				//리스트에서 이미지 하나만
}
