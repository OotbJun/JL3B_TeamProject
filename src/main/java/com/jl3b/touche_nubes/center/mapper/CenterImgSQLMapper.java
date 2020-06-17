package com.jl3b.touche_nubes.center.mapper;

import java.util.List;

import com.jl3b.touche_nubes.centervo.CenterImgVo;

public interface CenterImgSQLMapper {
	
	public void insertCenterInfoImg(CenterImgVo centerImgVo);		//센터 정보 이미지
	public List<CenterImgVo> selectCenterInfoImg(int info_no);
	public CenterImgVo test(int info_no);
}
