package com.jl3b.touche_nubes.member.mapper;

import com.jl3b.touche_nubes.membervo.ResiVo;
import com.jl3b.touche_nubes.membervo.CenterVo;

public interface MemberSQLMapper {

	public void insertResi(ResiVo resiVo);

	public ResiVo selectResiByIdAndPw(ResiVo resiVo);
	public ResiVo selectResiByNo(int no);
	public ResiVo selectResiById(String id);
	public ResiVo selectResiByNpki(String key); 			//인증번호 중복방지
	public String existNpki(String key);					//인증키 확인
	public String existEmail(String resi_mail);				//이메일 확인
	
	
	//////센터
	public void insertCenter(CenterVo centerVo);					//센터가입
	public CenterVo selectCenterByNpki(String key);	 				//인증번호 중복방지
	public CenterVo selectCenterByNo(int center_no);				//센터 확인
	public CenterVo selectCenterByIdAndPw(CenterVo centerVo);		//센터 로그인
	public String selectCenterById(String center_id);   			//아이디 중복확인
    public String existCenterEmail(String center_mail);	      		//이메일 중복확인
	
	
	//관리자
	public ResiVo selectResiAll();							//전체 회원 목록 출력
	public void updateResiGrade(ResiVo resiVo);				//등급변경(등업, 블랙리스트 등)
	

}