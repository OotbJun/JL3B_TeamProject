package com.jl3b.touche_nubes.member.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jl3b.touche_nubes.boardvo.BoardVo;
import com.jl3b.touche_nubes.centervo.CenterImgVo;
import com.jl3b.touche_nubes.centervo.CenterReviewVo;
import com.jl3b.touche_nubes.centervo.LessonVo;
import com.jl3b.touche_nubes.centervo.ReserveVo;
import com.jl3b.touche_nubes.ideavo.IdeaVo;
import com.jl3b.touche_nubes.membervo.CenterAuthVo;
import com.jl3b.touche_nubes.membervo.CenterVo;
import com.jl3b.touche_nubes.membervo.MemberAuthVo;
import com.jl3b.touche_nubes.membervo.MemberVo;

public interface MemberService {

	//입주민 회원가입
	public void joinMember(MemberVo memberVo, MemberAuthVo memberAuthVo);
	
	//인증번호가 맞는지 확인
	public String checkNpki(String npki_key);
	
	//인증번호 중복 확인
	public MemberVo checkNpkiDupl(String npki_key);
	
	//입주민 로그인
	public MemberVo loginMember(MemberVo memberVo);
	
	// 아이디 찾기
	public String get_searchId(String member_rname, String npki_key);
	
	public void certification(String key);
	
	//마이페이지 비밀번호 확인
	public MemberVo confirmMemberPw(MemberVo membervo);
	
	//센터 비밀번호 확인
	public CenterVo confirmCenterPw(CenterVo centerVo);
	   
	//마이페이지 정보 수정
	public void updateMember(MemberVo membervo);
	
	//센터 정보 수정
	public void updateCenter(CenterVo centerVo);
	
	//멤버no 받아오는거
	public MemberVo updateSession(int member_no);
	
	//센터 no 받아오기
	public CenterVo updateCenterSession(int center_no);
   
	//비밀번호 변경 
	public void updatePw(MemberVo membervo);
	
	//센터 비밀번호 변경
	public void updateCenterPw(CenterVo centerVo);
	
	//비밀번호 찾기
	public String get_searchPw(String member_id,String member_mail);
	
	//임시 비밀번호 생성 
	public void get_changePw(String member_pw,String member_id, String member_mail);
	
	   //내가 쓴 글 내역(자게)
   public List<Map<String,Object>> getMyBoard(int member_no);

   // 내가 쓴글(청원)  
   public List<Map<String,Object>> getMyIdea(int member_no);
   
   
   //회원 탈퇴
   public void memberDrop(int member_no);
   
   //센터 회원 탈퇴
   public void centerDrop(int center_no);
	
	
	////////////////////////////////////////////////센터
   //센터 로그인
   public CenterVo loginCenter(CenterVo centerVo);
   
	//센터 회원가입
	public void joinCenter(CenterVo centerVo, List<CenterImgVo> centerImgList, CenterAuthVo centerAuthVo);
	// 센터 회원가입 인증
	public void certification_Center(String key);
	
	
	
	//아이디 중복검사
	public boolean confrimId(String id);
	
	//인증번호 유효성검사
   public boolean confirmNpki(String npki_key);
   
   //인증번호 중복검사
   public boolean onlyNpki(String npki_key);
   
   //이메일 확인
   public boolean confirmEmail(String member_mail);
   
   // 센터 아이디 중복확인
   public boolean confirmCenterId(String center_id);

   // 센터 인증키 확인
   public boolean confirmCenterNpki(String npki_key);
   // 센터 이메일 확인
   public boolean confirmCenterEmail(String center_mail);
   
   //날짜~~
   public String getMemberDate(int member_no);
   public String getCenterDate(int center_no);
   
   //나의 예약 내역
   public List<Map<String,Object>> getMyCenter(int member_no);
   
   //예약 취소하기
   public void deleteReserve(int[] lesson_no, int member_no, int[] lesson_people);
   
}
