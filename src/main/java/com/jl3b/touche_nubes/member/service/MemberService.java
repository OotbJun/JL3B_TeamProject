package com.jl3b.touche_nubes.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jl3b.touche_nubes.boardvo.BoardVo;
import com.jl3b.touche_nubes.center.mapper.CenterImgSQLMapper;
import com.jl3b.touche_nubes.center.mapper.CenterSQLMapper;
import com.jl3b.touche_nubes.centervo.CenterImgVo;
import com.jl3b.touche_nubes.ideavo.IdeaVo;
import com.jl3b.touche_nubes.member.mapper.MemberSQLMapper;
import com.jl3b.touche_nubes.member.mapper.NpkiSQLMapper;
import com.jl3b.touche_nubes.membervo.NpkiVo;
import com.jl3b.touche_nubes.membervo.MemberVo;
import com.jl3b.touche_nubes.votevo.CandyImgVo;
import com.jl3b.touche_nubes.membervo.CenterVo;
import com.jl3b.touche_nubes.membervo.MemberAuthVo;

@Service
public class MemberService {
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	@Autowired
	private NpkiSQLMapper npkiSQLMapper;
	@Autowired
	private CenterSQLMapper centerSQLMapper;
	@Autowired
	private CenterImgSQLMapper centerImgSQLMapper;
	
	//입주민 회원가입
	public void joinMember(MemberVo memberVo, MemberAuthVo memberAuthVo) {
		
		if(npkiSQLMapper.selectNpki(memberVo.getNpki_key()) == null) {
	         return;
	    }else {
	    	 //비밀번호 암호화 
	    	 String hashCode = MemberMessageDigest.digest(memberVo.getMember_pw());
	         memberVo.setMember_pw(hashCode);
	         
	         int member_key = memberSQLMapper.creatKey();   
	         
	         memberVo.setMember_no(member_key);
	         
	         memberSQLMapper.insertMember(memberVo);    
	         //인증
	         memberAuthVo.setMember_no(member_key);
	         memberSQLMapper.insertAuth(memberAuthVo);
	      }
	}
	
	//인증번호가 맞는지 확인
	public String checkNpki(String npki_key) {			
		return npkiSQLMapper.selectNpki(npki_key);
		
	}
	
	//인증번호 중복 확인
	public MemberVo checkNpkiDupl(String npki_key) {			
		return memberSQLMapper.selectMemberByNpki(npki_key);
	}
	
	//입주민 로그인
	public MemberVo loginMember(MemberVo memberVo) {   
		
       String hashCode = MemberMessageDigest.digest(memberVo.getMember_pw());
       memberVo.setMember_pw(hashCode);
       
       return memberSQLMapper.selectMemberByIdAndPw(memberVo);
	}
	
	// 아이디 찾기
	public String get_searchId(String member_rname, String npki_key) {
      return memberSQLMapper.searchMemberId(member_rname,npki_key);
	}
	
	public void certification(String key) {
	       memberSQLMapper.updateAuth(key);	
	}
	
	//마이페이지 비밀번호 확인
	public MemberVo confirmPw(MemberVo membervo) {
      
		String hashCode = MemberMessageDigest.digest(membervo.getMember_pw());
		membervo.setMember_pw(hashCode);
      
		return memberSQLMapper.confirmPw(membervo);
    }
	   
	//마이페이지 정보 수정
	public void updateMypageProcess(MemberVo membervo) {
		memberSQLMapper.updateMypage(membervo);
	}
	
	//멤버no 받아오는거
	public MemberVo updateSession(int member_no) {
		return memberSQLMapper.selectMemberByNo(member_no);
	}
   
	//비밀번호 변경 
	public void updatePw(MemberVo membervo) {
        String hashCode = MemberMessageDigest.digest(membervo.getMember_pw());
        membervo.setMember_pw(hashCode);
        memberSQLMapper.updatePw(membervo);
	}
	
	//비밀번호 찾기
	public String get_searchPw(String member_id,String member_mail) {
		return memberSQLMapper.conditionMemberPw(member_id, member_mail);
	}
	
	//임시 비밀번호 생성 
	public void get_changePw(String member_pw,String member_id, String member_mail) {
	    String hashCode = MemberMessageDigest.digest(member_pw);
		memberSQLMapper.updateMemberPw(hashCode, member_id, member_mail);
	}
	
	//내가 쓴 글 내역(자게)
	public BoardVo getMyBoard(int member_no) {
		return memberSQLMapper.selectMyBoard(member_no);
	}
	
	//내가 쓴 글 내역(청원)
	public IdeaVo getMyIdea(int member_no) {
		return memberSQLMapper.selectMyIdea(member_no);
	}
	
	
	
	////////////////////////////////////////////////센터
	//센터 로그인
	public CenterVo loginCenter(CenterVo centerVo) {		
		return memberSQLMapper.selectCenterByIdAndPw(centerVo);
	}
	
	//센터 회원가입
	public void joinCenter(CenterVo centerVo, List<CenterImgVo> centerImgList) {
		
		int centerKey = centerSQLMapper.createCenterKey();
		System.out.println(centerKey);
		centerVo.setCenter_no(centerKey);
		
		if(npkiSQLMapper.selectNpki(centerVo.getNpki_key()) == null) {
			return;
		}else {
			memberSQLMapper.insertCenter(centerVo);
		}
		
		for(CenterImgVo centerImgVo : centerImgList) {			//이미지 등록
			centerImgVo.setCenter_no(centerKey);
			centerImgSQLMapper.insertCenterInfoImg(centerImgVo);;
		}
	}
	
	//아이디 중복검사
	public boolean confrimId(String id) {
		if (memberSQLMapper.selectMemberById(id) == null) {
			return true;
		} else {
			return false;
		}

	}
	
	//인증번호 유효성검사
   public boolean confirmNpki(String npki_key) {
      if (memberSQLMapper.selectMemberByNpki(npki_key)==null) {
         return true;
      } else {
         return false;
      }
   }
   
   //인증번호 중복검사
   public boolean onlyNpki(String npki_key) {
      if (memberSQLMapper.existNpki(npki_key)!=null) {
         return true;
      } else {
         return false;
      }
   }
   
   //이메일 확인
   public boolean confirmEmail(String member_mail) {
      if(memberSQLMapper.existEmail(member_mail)== null) {
         return true;
      } else {
         return false;
      }   
	}
   
   // 센터 아이디 중복확인
   public boolean confirmCenterId(String center_id) {
      if (memberSQLMapper.selectCenterById(center_id) == null) {
         return true;
      } else {
         return false;
      }
   }

   // 센터 인증키 확인
   public boolean confirmCenterNpki(String npki_key) {
      if (memberSQLMapper.selectCenterByNpki(npki_key) == null) {
         return true;
      } else {
         return false;
      }
   }
   // 센터 이메일 확인
   public boolean confirmCenterEmail(String center_mail) {
      if (memberSQLMapper.selectCenterById(center_mail) == null) {
         return true;
      } else {
         return false;
      }
   }
}
