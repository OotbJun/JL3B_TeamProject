package com.jl3b.touche_nubes.member.mapper;

import java.util.List;

import com.jl3b.touche_nubes.membervo.NpkiVo;

public interface NpkiSQLMapper {
	
	public String selectNpki(String npki_key);			//npki키가 있는지 조회
	public void insertNpki(NpkiVo npkiVo);				//관리자가 새로운 npki키 생성
	public void deleteNpki(int npki_no);				//npki키 삭제
	public List<NpkiVo> selectNpkiAll();				//npki키 리스트
	 
	
}
