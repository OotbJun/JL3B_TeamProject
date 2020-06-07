package com.jl3b.touche_nubes.vote.mapper;

import java.util.List;

import com.jl3b.touche_nubes.votevo.CandyVo;
import com.jl3b.touche_nubes.votevo.VoteVo;

public interface VoteSQLMapper {
	
	public void insertCandy(CandyVo candyVo);			//후보 등록
	public void updateCandy(CandyVo candyVo);			//후보 수정
	public void deleteCandy(int no);					//후보 삭제
	public void insertVote(VoteVo voteVo);				//투표
	public int selectResultWinner();					//당선인 출력
	public int selectNumberVote();						//다득표수
	public CandyVo selectCandyByNo(int no);				//후보자 상세 페이지
	
	//선거 개시
	public void updateWinner(int no);					//당선인 수정(선거 테이블)
	public void updateGrade(int no);					//당선인 등업(입주민 테이블)
	public void insertElection();						//선거 개시 등록
	
	public int selectNewRound();						//최신 회차 출력
	public List<CandyVo> selectCandyList(int no);		//후보리스트 출력
	public CandyVo selectRoundWinner(int no);			//해당 회차 당선인 출력
	
	public int createCandyKey();						//파일 업로드할 때 쓸거야~
	public VoteVo selectVoteByNo(VoteVo voteVo);		//투표 중복방지 본인확인
	public CandyVo selectCandyDupl(CandyVo candyVo);	//입후보 중복방지 본인확인
	
	public int selectEachNumberVote(int no);			//투표 결과 보기
}
