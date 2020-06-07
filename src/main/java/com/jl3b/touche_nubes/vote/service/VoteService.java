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
import com.jl3b.touche_nubes.vote.mapper.VoteImgSQLMapper;
import com.jl3b.touche_nubes.vote.mapper.VoteSQLMapper;
import com.jl3b.touche_nubes.votevo.CandyImgVo;
import com.jl3b.touche_nubes.votevo.CandyVo;
import com.jl3b.touche_nubes.votevo.VoteVo;

@Service
public class VoteService {
	
	@Autowired
	private VoteSQLMapper voteSQLMapper;
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	@Autowired
	private VoteImgSQLMapper voteImgSQLMapper;
	
	//후보 등록
	public void writeCandy(CandyVo candyVo, List<CandyImgVo> candyImgList) {
		int candyKey = voteSQLMapper.createCandyKey();
		candyVo.setCandy_no(candyKey);
		
		voteSQLMapper.insertCandy(candyVo);
		
		for(CandyImgVo candyImgVo : candyImgList) {			//이미지 등록
			candyImgVo.setCandy_no(candyKey);
			voteImgSQLMapper.insertCandyImg(candyImgVo);
		}
	}
	//후보 등록 중복방지 본인확인
	public CandyVo checkCandy(CandyVo candyVo) {
		return voteSQLMapper.selectCandyDupl(candyVo);
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
		
		candyList = voteSQLMapper.selectCandyList(election_round);
		
		
		for(CandyVo candyVo : candyList) {
			ResiVo resiVo = memberSQLMapper.selectResiByNo(candyVo.getResi_no());
			CandyImgVo candyImgList = voteImgSQLMapper.selectCandyByNo(candyVo.getCandy_no());	//리스트에 이미지 출력
			
			
			
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("resiVo", resiVo);
			map.put("candyVo", candyVo);
			map.put("candyImgList", candyImgList);
			
			
			list.add(map);
		}
		return list;
	}
	
	//최신 회차 출력
	public int newRound() {
		int round = voteSQLMapper.selectNewRound();
		return round;
	}
	
	//후보자 상세 페이지
	public Map<String, Object> viewCandy(int candy_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		CandyVo candyVo = voteSQLMapper.selectCandyByNo(candy_no);
		ResiVo resiVo = memberSQLMapper.selectResiByNo(candyVo.getResi_no());
		CandyImgVo candyImgList = voteImgSQLMapper.selectCandyByNo(candy_no);
		
		map.put("candyVo", candyVo);
		map.put("resiVo", resiVo);
		map.put("candyImgList", candyImgList);
		
		return map;
	}
	
	//선거 개시
	public void startElection() {
		voteSQLMapper.insertElection();
	}
	
	//투표 중복방지 본인확인
	public VoteVo checkVote(VoteVo voteVo) {
		return voteSQLMapper.selectVoteByNo(voteVo);
	}
	
	//후보자 각각 득표수
	public List<Map<String, Object>> resultVote(int election_round){
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<CandyVo> candyList = null;
		
		candyList = voteSQLMapper.selectCandyList(election_round);
		
		
		for(CandyVo candyVo : candyList) {
			ResiVo resiVo = memberSQLMapper.selectResiByNo(candyVo.getResi_no());
			CandyImgVo candyImgList = voteImgSQLMapper.selectCandyByNo(candyVo.getCandy_no());	//리스트에 이미지 출력
			
			int result = voteSQLMapper.selectEachNumberVote(candyVo.getCandy_no());
			
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("resiVo", resiVo);
			map.put("candyVo", candyVo);
			map.put("candyImgList", candyImgList);
			map.put("result", result);
			
			
			list.add(map);
		}
		return list;
	}
	
	
	
	
}
