package com.jl3b.touche_nubes.admin.mapper;

import com.jl3b.touche_nubes.membervo.AdminVo;
import com.jl3b.touche_nubes.membervo.MemberVo;

public interface AdminSQLMapper {
	
	public AdminVo selectAdminNo(int admin_no);				//관리자 넘버 담기
	public AdminVo selectAdminByIdAndPw(AdminVo adminVo); 	//관리자 로그인
	public void deleteRe(int board_re_no);                 	//자유게시판 댓글 삭제
	public MemberVo selectMemberAll();						//모든 회원 출력
}
