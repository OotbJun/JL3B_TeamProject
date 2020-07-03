package com.jl3b.touche_nubes.admin.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jl3b.touche_nubes.admin.mapper.AdminSQLMapper;
import com.jl3b.touche_nubes.member.mapper.MemberSQLMapper;
import com.jl3b.touche_nubes.member.mapper.NpkiSQLMapper;
import com.jl3b.touche_nubes.membervo.AdminVo;
import com.jl3b.touche_nubes.membervo.CenterVo;
import com.jl3b.touche_nubes.membervo.MemberVo;
import com.jl3b.touche_nubes.membervo.NpkiVo;
import com.jl3b.touche_nubes.vote.mapper.VoteSQLMapper;

@Service
public class AdminService {
	
	@Autowired
	private AdminSQLMapper adminSQLMapper;
	@Autowired
	private NpkiSQLMapper npkiSQLMapper;
	@Autowired
	private VoteSQLMapper voteSQLMapper;
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	//관리자 로그인
	public AdminVo login(AdminVo adminVo) {
		return adminSQLMapper.selectAdminByIdAndPw(adminVo);
	}
	
	//자게 댓글 삭제
	public void deleteRe(int board_re_no) {
      adminSQLMapper.deleteRe(board_re_no);
	}
	
   //---------------------------------------회원관리
	public List<MemberVo> memberlist(){
      
		List<MemberVo> memberList= adminSQLMapper.memberlist();
   
		return memberList;
   
	}
   
	public List<CenterVo>centerlist(){
      
		List<CenterVo> centerList = adminSQLMapper.centerlist();
		return centerList;
	}
	
	//npki키 생성
	public void createNpki(NpkiVo npkiVo) {
		npkiSQLMapper.insertNpki(npkiVo);
	}
	
	//npki키 삭제
	public void removeNpki(int npki_no) {
		npkiSQLMapper.deleteNpki(npki_no);
	}
	
	//npki키 리스트
	public List<NpkiVo> npkiList() {
		
		List<NpkiVo> npkiList = npkiSQLMapper.selectNpkiAll();
		
		return npkiList;
		
	}
	
	//사용중 입주민 npki
	public List<NpkiVo> memberUseNpki() {
		List<NpkiVo> npkiList = npkiSQLMapper.selectMemberIng();
		return npkiList;
	}
	//사용중 센터 npki
	public List<NpkiVo> centerUseNpki() {
		List<NpkiVo> npkiList = npkiSQLMapper.selectCenterIng();
		return npkiList;
	}
	//미사용 입주민 npki
	public List<NpkiVo> memberUnusedNpki() {
		List<NpkiVo> npkiList = npkiSQLMapper.selectMemberUnused();
		return npkiList;
	}
	//미사용 센터 npki
	public List<NpkiVo> centerUnusedNpki() {
		List<NpkiVo> npkiList = npkiSQLMapper.selectCenterUnused();
		return npkiList;
	}
	
	
	//선거 개시
	//@Scheduled(cron = "0 0/3 * * * *")
	public void startElection() {
		System.out.println("타이머 테스트");
		voteSQLMapper.insertElection();
	}
	
	//회원 탈퇴 처리
	public void memberDrop(int member_no) {
		memberSQLMapper.memberDrop(member_no);
	}
	
	//센터 회원 탈퇴
	public void centerDrop(int center_no) {
		memberSQLMapper.centerDrop(center_no);
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
