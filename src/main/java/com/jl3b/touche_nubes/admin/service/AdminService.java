package com.jl3b.touche_nubes.admin.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jl3b.touche_nubes.admin.mapper.AdminSQLMapper;
import com.jl3b.touche_nubes.membervo.AdminVo;

@Service
public class AdminService {
	
	@Autowired
	private AdminSQLMapper adminSQLMapper;
	
	//관리자 로그인
	public AdminVo login(AdminVo adminVo) {
		return adminSQLMapper.selectAdminByIdAndPw(adminVo);
	}
	
	//자게 댓글 삭제
	public void deleteRe(int board_re_no) {
      adminSQLMapper.deleteRe(board_re_no);
	}
	
		// 관리자로그아웃
		//페이지 이동없이 로그아웃
//		response.setContentType("text/html;charset=utf-8");
//		PrintWriter out = response.getWriter();
//		out.println("<script>");
//		out.println("location.href=document.referrer;");
//		out.println("</script>");
//		out.close();
	
	
	//-----------------------------------------공지사항
	
}
