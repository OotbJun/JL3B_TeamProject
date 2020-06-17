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
import com.jl3b.touche_nubes.centervo.CenterInfoVo;
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
	public void writeCenterInfo(CenterInfoVo centerInfoVo, List<CenterImgVo> centerImgList) {
		int centerInfoKey = centerSQLMapper.createCenterInfoKey();
		centerInfoVo.setInfo_no(centerInfoKey);
		
		centerSQLMapper.insertCenterInfo(centerInfoVo);
		
		for(CenterImgVo centerImgVo : centerImgList) {
			centerImgVo.setInfo_no(centerInfoKey);
			centerImgSQLMapper.insertCenterInfoImg(centerImgVo);
		}
	}
	
	//센터 정보 수정
	public void modifyCenterInfo(CenterInfoVo centerInfoVo) {
		centerSQLMapper.updateCenterInfo(centerInfoVo);
	}
	
	//센터 정보 삭제
	public void eraseCenterInfo(int info_no) {
		centerSQLMapper.deleteCenterInfo(info_no);
	}
	
	//센터 정보 상세보기
	public Map<String, Object> viewCenterInfo(int info_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		CenterInfoVo centerInfoVo = centerSQLMapper.selectCenterInfoByNo(info_no);
		CenterVo centerVo = memberSQLMapper.selectCenterByNo(centerInfoVo.getCenter_no());
		
		map.put("centerInfoVo", centerInfoVo);
		map.put("centerVo", centerVo);
		
		return map;
	}
	
	//센터 리스트
	public List<Map<String, Object>> centerList() {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<CenterInfoVo> centerList = centerSQLMapper.selectCenterInfoAll();
		
		
		
		
		for(CenterInfoVo centerInfoVo : centerList) {
			CenterVo centerVo = memberSQLMapper.selectCenterByNo(centerInfoVo.getCenter_no());
			
			
			
			//List<CenterImgVo> centerImgList = centerImgSQLMapper.selectCenterInfoImg(centerInfoVo.getInfo_no());	//이미지
			CenterImgVo centerImgList = centerImgSQLMapper.test(centerInfoVo.getInfo_no());
			
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("centerVo", centerVo);
			map.put("centerInfoVo", centerInfoVo);
			map.put("centerImgList", centerImgList);
			
			list.add(map);
		}
		
		
		return list;
	}
	
}
