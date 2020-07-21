package com.jl3b.touche_nubes.vote.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;


import com.jl3b.touche_nubes.member.mapper.MemberSQLMapper;
import com.jl3b.touche_nubes.membervo.MemberVo;
import com.jl3b.touche_nubes.vote.mapper.VoteImgSQLMapper;
import com.jl3b.touche_nubes.vote.mapper.VoteSQLMapper;
import com.jl3b.touche_nubes.votevo.CandyImgVo;
import com.jl3b.touche_nubes.votevo.CandyVo;
import com.jl3b.touche_nubes.votevo.ElectionVo;
import com.jl3b.touche_nubes.votevo.VoteVo;

@Service
public class VoteService {
   
   @Autowired
   private VoteSQLMapper voteSQLMapper;
   @Autowired
   private MemberSQLMapper memberSQLMapper;
   @Autowired
   private VoteImgSQLMapper voteImgSQLMapper;
   
   //public static VoteVo vote;
   
   //선거 개시
   //@Scheduled(cron = "0 0/3 * * * *")
   public void startElection() {
      System.out.println("타이머 테스트");
      voteSQLMapper.insertElection();						//선거 스타트(그냥 인서트) -> 처음부터 후보등록기간으로 세팅
   }
   
   //매일 상태 업데이트
   @Scheduled(cron = "0 0 12 * * *")						//초, 분, 시, 일, 월, 연도
   public void gang() {
      System.out.println("투표 상태 갱신 테스트");
      
      //////////트라이캐치 안쓰면 선거회차가 아예 없을경우 NULL값이라서 익셉션 뜬다.(생각해보면 Integer로 받으면 될 것 같기도 한데..)
      try {
         int round = voteSQLMapper.selectNewRound();              //최신 회차 담아주고(MAX값 셀렉트)
         voteSQLMapper.updateVoteIng();                           //날짜가 지났다면 투표기간으로 갱신
         voteSQLMapper.updateElectionEnd();                       //날짜가 지났다면 투표종료로 갱신
         
         ElectionVo electionVo = new ElectionVo();                  //이러면 되지 않을까?	-----	내가 이걸 뭔 정신에 했을까
         electionVo.setElection_round(round);                     	//where절 해당 회차
         CandyVo candyVo = new CandyVo();                        	//테스트!
         candyVo.setCandy_no(electionVo.getCandy_no());				//솔직히 필요 없을 것 같다
         
         
         if(voteSQLMapper.selectResultWinner() != null) {			//가장 많은 득표를 받은 사람이 존재하면
            electionVo.setCandy_no(voteSQLMapper.selectResultWinner());      //선거회차 테이블에 당선인으로 세팅
         }
         
         if(voteSQLMapper.voteEnd() != null) {						//최근 종료된 투표가 있다면
            
            voteSQLMapper.updateWinner(electionVo);                 //선거테이블 당선인 수정(해당 회차만)
            voteSQLMapper.updateGrade(voteSQLMapper.selectCandyByNo(electionVo.getCandy_no()).getMember_no());   //멤버테이블 등급 변경
            				//캔디테이블에서 선거회차테이블에 있는 캔디넘버로 당선인을 뽑아오고,
            				//캔디테이블에 멤버넘버 값이 있으니 뽑아온 당선인의 멤버넘버 값을 다시 담아주는 형태
            
//            ResiVo resiData = memberSQLMapper.selectResiByNo(candyVo.getResi_no());
//            System.out.println("레지넘버 : " + resiData.getResi_no());
//            session.setAttribute("sessionUser", resiData);      //로그아웃 없이 등급 수정
            
         }
      }catch(Exception e) {
         e.printStackTrace();
      }
   }
   
   //후보 등록
   public void writeCandy(CandyVo candyVo, List<CandyImgVo> candyImgList) {
      int candyKey = voteSQLMapper.createCandyKey();	//이미지랑 같이 인서트 돼야하니까
      candyVo.setCandy_no(candyKey);
      
      if(voteSQLMapper.candyAble() != null) {           //기간이 맞는지 확인 후 맞다면 후보등록 가능
         voteSQLMapper.insertCandy(candyVo);
      }
      
      for(CandyImgVo candyImgVo : candyImgList) {         //이미지 등록
         candyImgVo.setCandy_no(candyKey);
         voteImgSQLMapper.insertCandyImg(candyImgVo);
      }
   }
   
   //후보 등록 중복방지 본인확인
   public CandyVo checkCandy(CandyVo candyVo) {
      return voteSQLMapper.selectCandyDupl(candyVo);
   }
   
   //후보 수정
   public void changeCandy(CandyVo candyVo) {		//만들었는데 안 씀
      voteSQLMapper.updateCandy(candyVo);
   }
   
   //후보 삭제
   public void deleteCandy(int no) {				//만들었는데 안 씀
      voteSQLMapper.deleteCandy(no);
   }

   //투표
   public void takeVote(VoteVo voteVo) {
      
      if(voteSQLMapper.voteAble() != null) {         //투표 기간 맞는지 확인 후 맞으면 투표 가능
         voteSQLMapper.insertVote(voteVo);
      }
      
   }
   
   //후보자 리스트
   public List<Map<String, Object>> candyList(int election_round){
      List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
      List<CandyVo> candyList = null;
      
      candyList = voteSQLMapper.selectCandyList(election_round);
      
      
      for(CandyVo candyVo : candyList) {
         MemberVo memberVo = memberSQLMapper.selectMemberByNo(candyVo.getMember_no());			//후보자 정보 담아주고
         candyVo.setCandy_intro(candyVo.getCandy_intro().replaceAll("<script>", "&lt;script&gt;"));		//스크립트 방지
         candyVo.setCandy_intro(candyVo.getCandy_intro().replaceAll("</script>", "&lt;/script&gt;"));
         CandyImgVo candyImgList = voteImgSQLMapper.selectCandyByNo(candyVo.getCandy_no());   	//리스트에 이미지 출력
         
         Map<String, Object> map = new HashMap<String, Object>();
         map.put("memberVo", memberVo);
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
      MemberVo memberVo = memberSQLMapper.selectMemberByNo(candyVo.getMember_no());
      CandyImgVo candyImgList = voteImgSQLMapper.selectCandyByNo(candy_no);
      candyVo.setCandy_content(candyVo.getCandy_content().replaceAll("\n","<br>"));
      candyVo.setCandy_intro(candyVo.getCandy_intro().replaceAll("<script>", "&lt;script&gt;"));
      candyVo.setCandy_intro(candyVo.getCandy_intro().replaceAll("</script>", "&lt;/script&gt;"));
      candyVo.setCandy_content(candyVo.getCandy_content().replaceAll("<script>", "&lt;script&gt;"));
      candyVo.setCandy_content(candyVo.getCandy_content().replaceAll("</script>", "&lt;/script&gt;"));
      
      map.put("candyVo", candyVo);
      map.put("memberVo", memberVo);
      map.put("candyImgList", candyImgList);
      
      return map;
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
         MemberVo memberVo = memberSQLMapper.selectMemberByNo(candyVo.getMember_no());
         CandyImgVo candyImgList = voteImgSQLMapper.selectCandyByNo(candyVo.getCandy_no());   //리스트에 이미지 출력
         
         int result = voteSQLMapper.selectEachNumberVote(candyVo.getCandy_no());
         
         
         Map<String, Object> map = new HashMap<String, Object>();
         
         map.put("memberVo", memberVo);
         map.put("candyVo", candyVo);
         map.put("candyImgList", candyImgList);
         map.put("result", result);
         
         
         list.add(map);
      }
      return list;
   }
   
   //선거 상태 뽑기
   public String checkStatus(int round) {
      return voteSQLMapper.electionStatus(round);
   }
   
   //날짜 뽑자
   public ElectionVo checkElection(int round) {
	   return voteSQLMapper.selectElection(round);
   }
   
   
   //test	=====================	리뷰 준비하면서 보니까 굳이 필요없었네. 똑같은 쿼리 있었음...
   public CandyVo check(int member_no, int election_round) {
      return voteSQLMapper.check(member_no, election_round);
   }
}