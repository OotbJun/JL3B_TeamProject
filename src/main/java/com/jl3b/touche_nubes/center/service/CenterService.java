package com.jl3b.touche_nubes.center.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jl3b.touche_nubes.boardvo.BoardImgVo;
import com.jl3b.touche_nubes.center.mapper.CenterImgSQLMapper;
import com.jl3b.touche_nubes.center.mapper.CenterSQLMapper;
import com.jl3b.touche_nubes.centervo.CenterImgVo;
import com.jl3b.touche_nubes.member.mapper.MemberSQLMapper;
import com.jl3b.touche_nubes.membervo.CenterVo;

@Service
public class CenterService {
	
	@Autowired
	private CenterSQLMapper centerSQLMapper;
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	@Autowired
	private CenterImgSQLMapper centerImgSQLMapper;
	
	
	//센터 정보 등록
//	public void writeCenterInfo(CenterInfoVo centerInfoVo, List<CenterImgVo> centerImgList) {
//
//		int centerInfoKey = centerSQLMapper.createCenterInfoKey();		//파일 업로드용 시퀀스 미리 생성
//		centerInfoVo.setInfo_no(centerInfoKey);
//		
//		centerSQLMapper.insertCenterInfo(centerInfoVo);
//		
//		for(CenterImgVo centerImgVo : centerImgList) {					//파일 업로드
//			centerImgVo.setInfo_no(centerInfoKey);
//			centerImgSQLMapper.insertCenterInfoImg(centerImgVo);
//		}
//	}
	
	//센터 정보 수정
//	public void modifyCenterInfo(CenterInfoVo centerInfoVo) {
//		centerSQLMapper.updateCenterInfo(centerInfoVo);
//	}
	
	//센터 정보 삭제
//	public void eraseCenterInfo(int info_no) {
//		centerSQLMapper.deleteCenterInfo(info_no);
//	}
	
	//센터 정보 상세보기
	public Map<String, Object> viewCenterInfo(int center_no) {
		
		Map<String, Object> map = new HashMap<String, Object>();
//		CenterVo centerVo = centerSQLMapper.selectCenterInfoByNo(center_no);
		CenterVo centerVo = memberSQLMapper.selectCenterByNo(center_no);
		
//		map.put("centerInfoVo", centerInfoVo);
		map.put("centerVo", centerVo);
		
		return map;
	}
	
	//센터 리스트
	public List<Map<String, Object>> centerList() {
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<CenterVo> centerList = centerSQLMapper.selectCenterInfoAll();
		
		for(CenterVo centerVo : centerList) {
//			centerVo = memberSQLMapper.selectCenterByNo(centerInfoVo.getCenter_no());
			
			//List<CenterImgVo> centerImgList = centerImgSQLMapper.selectCenterInfoImg(centerInfoVo.getInfo_no());	//이미지
			CenterImgVo centerImgList = centerImgSQLMapper.selectCenterInfoImg(centerVo.getCenter_no());			//이미지 리스트 ㄴㄴ 그냥 vo로
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("centerVo", centerVo);
			map.put("centerImgList", centerImgList);
			
			list.add(map);
		}
		return list;
	}
	
	//인포넘버값 받아오기
	public int getInfoNo() {
		return centerSQLMapper.selectInfoNo();
	}
	
	//정보등록 중복방지
//	public CenterInfoVo checkCenterInfo(int center_no) {
//		return centerSQLMapper.checkCenterInfo(center_no);
//	}
	
}
