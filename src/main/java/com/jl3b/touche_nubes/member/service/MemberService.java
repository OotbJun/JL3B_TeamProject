package com.jl3b.touche_nubes.member.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jl3b.touche_nubes.member.mapper.MemberSQLMapper;
import com.jl3b.touche_nubes.member.mapper.NpkiSQLMapper;
import com.jl3b.touche_nubes.membervo.NpkiVo;
import com.jl3b.touche_nubes.membervo.ResiVo;
import com.jl3b.touche_nubes.membervo.CenterVo;

@Service
public class MemberService {
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	@Autowired
	private NpkiSQLMapper npkiSQLMapper;
	
	public void joinResi(ResiVo resiVo) {			
		if(npkiSQLMapper.selectNpki(resiVo.getNpki_key()) == null) {
			return;
		}else {
			memberSQLMapper.insertResi(resiVo);
		}
	}
	
	public String checkNpki(String npki_key) {			//인증번호가 맞는지 확인
		return npkiSQLMapper.selectNpki(npki_key);
		
	}
	
	public ResiVo checkNpkiDupl(String npki_key) {
		return memberSQLMapper.selectResiByNpki(npki_key);
	}
	
	
	public ResiVo loginResi(ResiVo resiVo) {
		return memberSQLMapper.selectResiByIdAndPw(resiVo);
	}
	
	public CenterVo loginCenter(CenterVo centerVo) {
		return memberSQLMapper.selectCenterByIdAndPw(centerVo);
	}
	
	public void joinCenter(CenterVo centerVo) {
		
		if(npkiSQLMapper.selectNpki(centerVo.getNpki_key()) == null) {
			return;
		}else {
			memberSQLMapper.insertCenter(centerVo);
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
}
