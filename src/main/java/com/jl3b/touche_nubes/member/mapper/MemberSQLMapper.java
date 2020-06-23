package com.jl3b.touche_nubes.member.mapper;

import com.jl3b.touche_nubes.membervo.MemberVo;

import org.apache.ibatis.annotations.Param;

import com.jl3b.touche_nubes.membervo.CenterVo;
import com.jl3b.touche_nubes.membervo.MemberAuthVo;

public interface MemberSQLMapper {
	
	///////입주민
	public void insertMember(MemberVo memberVo);
	public MemberVo selectMemberByIdAndPw(MemberVo memberVo);
	public MemberVo selectMemberByNo(int no);
	public MemberVo selectMemberById(String id);
	public MemberVo selectMemberByNpki(String key);		 			//인증번호 중복방지
	public String existNpki(String key);							//인증키 확인
	public String existEmail(String member_mail);					//이메일 확인
	public String searchMemberId(@Param("member_rname") String member_rname,@Param("npki_key") String npki_key);	//아이디 찾기
	public MemberVo conditionMemberPw(MemberVo memberVo);			//비밀번호 변경 조건
	public void updateMemberPw(MemberVo memberVo);					//입주민 회원 비밀번호 변경
	public int creatKey();											//인증키
	public void insertAuth(MemberAuthVo memberAuthVo);  	        //인증 시작 
	public void updateAuth(String key);         		            //인증 완료 
	public MemberAuthVo authByMemberNo(int member_no);      	    //이후에 사용 예정 
	
	
	//////센터
	public void insertCenter(CenterVo centerVo);					//센터가입
	public CenterVo selectCenterByNpki(String key);	 				//인증번호 중복방지
	public CenterVo selectCenterByNo(int center_no);				//센터 확인
	public CenterVo selectCenterByIdAndPw(CenterVo centerVo);		//센터 로그인
	public String selectCenterById(String center_id);   			//아이디 중복확인
    public String existCenterEmail(String center_mail);	      		//이메일 중복확인
    public String findCenterId(CenterVo centerVo);					//센터 아이디 찾기
    public CenterVo conditionCenterPw(CenterVo centerVo);			//센터 비밀번호 변경 조건
    public void updateCenterPw(CenterVo centerVo);					//센터 회원 비밀번호 변경
	
    
	
	//관리자
	public MemberVo selectMemberAll();							//전체 회원 목록 출력
	public void updateMemberGrade(MemberVo memberVo);				//등급변경(등업, 블랙리스트 등)
	

}