package com.jl3b.touche_nubes.admin.mapper;

import java.util.List;

import com.jl3b.touche_nubes.membervo.AdminVo;
import com.jl3b.touche_nubes.membervo.CenterVo;
import com.jl3b.touche_nubes.membervo.MemberVo;

public interface AdminSQLMapper {
	
	public AdminVo selectAdminNo(int admin_no);				//관리자 넘버 담기
	public AdminVo selectAdminByIdAndPw(AdminVo adminVo); 	//관리자 로그인
	public void deleteRe(int board_re_no);                 	//자유게시판 댓글 삭제
	public List<MemberVo> selectMemberAll();				//모든 회원 출력
	public List<MemberVo> memberlist();                  	//모든 회원 출력
	public List<CenterVo> centerlist();                  	//모든 센터회원 출력
	public void insertAdmin(String npki_key);               // 자동 어드민 회원가입 
}
