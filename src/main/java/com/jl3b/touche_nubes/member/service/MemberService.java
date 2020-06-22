package com.jl3b.touche_nubes.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jl3b.touche_nubes.center.mapper.CenterImgSQLMapper;
import com.jl3b.touche_nubes.center.mapper.CenterSQLMapper;
import com.jl3b.touche_nubes.centervo.CenterImgVo;
import com.jl3b.touche_nubes.member.mapper.MemberSQLMapper;
import com.jl3b.touche_nubes.member.mapper.NpkiSQLMapper;
import com.jl3b.touche_nubes.membervo.NpkiVo;
import com.jl3b.touche_nubes.membervo.ResiVo;
import com.jl3b.touche_nubes.votevo.CandyImgVo;
import com.jl3b.touche_nubes.membervo.CenterVo;

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
	public void joinResi(ResiVo resiVo) {
		
	      if(npkiSQLMapper.selectNpki(resiVo.getNpki_key()) == null) {
	         return;
	      }else {
	         String hashCode = ResiMessageDigest.digest(resiVo.getResi_pw());
	         resiVo.setResi_pw(hashCode);
	         int resi_key = memberSQLMapper.creatKey();   
	         resiVo.setResi_no(resi_key);
	         memberSQLMapper.insertResi(resiVo);
	      }
   }
	
	//인증번호가 맞는지 확인
	public String checkNpki(String npki_key) {			
		return npkiSQLMapper.selectNpki(npki_key);
		
	}
	
	//인증번호 중복 확인
	public ResiVo checkNpkiDupl(String npki_key) {			
		return memberSQLMapper.selectResiByNpki(npki_key);
	}
	
	//입주민 로그인
	public ResiVo loginResi(ResiVo resiVo) {   
		
       String hashCode = ResiMessageDigest.digest(resiVo.getResi_pw());
       resiVo.setResi_pw(hashCode);
       
       return memberSQLMapper.selectResiByIdAndPw(resiVo);
	}
	
	// 아이디 찾기
	public String get_searchId(String resi_rname, String npki_key) {
      return memberSQLMapper.searchResiId(resi_rname,npki_key);
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
		if (memberSQLMapper.selectResiById(id) == null) {
			return true;
		} else {
			return false;
		}

	}
	
	//인증번호 유효성검사
   public boolean confirmNpki(String npki_key) {
      if (memberSQLMapper.selectResiByNpki(npki_key)==null) {
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
   public boolean confirmEmail(String resi_mail) {
      if(memberSQLMapper.existEmail(resi_mail)!= null) {
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
