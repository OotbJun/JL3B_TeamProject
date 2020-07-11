package com.jl3b.touche_nubes.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jl3b.touche_nubes.membervo.NpkiVo;

public interface NpkiSQLMapper {
	
	public String selectNpki(String npki_key);			//npki키가 있는지 조회
	public void insertNpki(@Param("npki_type")String npki_type, @Param("npki_key")String npki_key);				//관리자가 새로운 npki키 생성
	public void deleteNpki(int npki_no);				//npki키 삭제
	public List<NpkiVo> selectNpkiAll();				//npki키 리스트
	public List<NpkiVo> selectMemberIng();				//사용중 입주민 npki
	public List<NpkiVo> selectCenterIng();				//사용중 센터 npki
	public List<NpkiVo> selectMemberUnused();			//미사용 입주민 npki
	public List<NpkiVo> selectCenterUnused();			//미사용 센터 npki
}
