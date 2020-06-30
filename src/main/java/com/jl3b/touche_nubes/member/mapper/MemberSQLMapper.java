package com.jl3b.touche_nubes.member.mapper;

import com.jl3b.touche_nubes.membervo.MemberVo;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jl3b.touche_nubes.boardvo.BoardVo;
import com.jl3b.touche_nubes.ideavo.IdeaVo;
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
	public String conditionMemberPw(@Param("member_id") String member_id,@Param("member_mail") String member_mail);//비밀번호 변경 조건
	public void updateMemberPw(@Param("member_pw")String member_pw ,@Param("member_id") String member_id,@Param("member_mail") String member_mail);//입주민 회원 비밀번호 변경
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
    public void deleteCenter(int center_no);						//관리자 권한 센터 삭제
    
	
	//관리자
	public MemberVo selectMemberAll();								//전체 회원 목록 출력
	public void updateMemberGrade(MemberVo memberVo);				//등급변경(등업, 블랙리스트 등)
	
	
	//마이페이지
    public MemberVo confirmPw(MemberVo membervo);                   //비밀번호 확인
    public void updateMypage(MemberVo membervo);                    //내 정보 수정(이름수정)
    public void updatePw(MemberVo membervo);                        //비밀번호 변경
    public List<BoardVo> selectMyBoard(int member_no);				//내가 쓴 글 내역(자게)
	

}