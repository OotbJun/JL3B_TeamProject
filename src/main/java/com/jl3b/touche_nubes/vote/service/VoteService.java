package com.jl3b.touche_nubes.vote.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jl3b.touche_nubes.member.mapper.MemberSQLMapper;
import com.jl3b.touche_nubes.membervo.ResiVo;
import com.jl3b.touche_nubes.vote.mapper.VoteSQLMapper;
import com.jl3b.touche_nubes.votevo.CandyVo;
import com.jl3b.touche_nubes.votevo.VoteVo;

@Service
public class VoteService {
	
	@Autowired
	private VoteSQLMapper voteSQLMapper;
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	//후보 등록
	public void writeCandy(CandyVo candyVo) {
		voteSQLMapper.insertCandy(candyVo);
	}
	
	//후보 수정
	public void changeCandy(CandyVo candyVo) {
		voteSQLMapper.updateCandy(candyVo);
	}
	
	//후보 삭제
	public void deleteCandy(int no) {
		voteSQLMapper.deleteCandy(no);
	}
	
	//투표
	public void takeVote(VoteVo voteVo) {
		voteSQLMapper.insertVote(voteVo);
	}
	
	//후보자 리스트
	public List<Map<String, Object>> candyList(int election_round){
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<CandyVo> candyList = null;
		
		for(CandyVo candyVo : candyList) {
			ResiVo resiVo = memberSQLMapper.selectResiByNo(candyVo.getResi_no());
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("resiVo", resiVo);
			map.put("candyVo", candyVo);
			
			list.add(map);
		}
		return list;
	}
	
	
}
