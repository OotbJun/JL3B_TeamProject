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
      voteSQLMapper.insertElection();
      
   }
   
   //매일 상태 업데이트
   @Scheduled(cron = "0 0 12 * * *")
   public void gang() {
      System.out.println("투표 상태 갱신 테스트");
      
      //////////
      try {
         int round = voteSQLMapper.selectNewRound();                  //최신 회차 담아주고
         voteSQLMapper.updateVoteIng();                           //투표기간으로 자동 갱신
         voteSQLMapper.updateElectionEnd();                        //선거기간 끝으로 자동 갱신
         
         ElectionVo electionVo = new ElectionVo();                  //이러면 되지 않을까?
         
         electionVo.setElection_round(round);                     //where절 해당 회차
         CandyVo candyVo = new CandyVo();                        //테스트!
         candyVo.setCandy_no(electionVo.getCandy_no());
         
         
         if(voteSQLMapper.selectResultWinner() != null) {
            electionVo.setCandy_no(voteSQLMapper.selectResultWinner());      //당선인
         }
         
         if(voteSQLMapper.voteEnd() != null) {
            
            voteSQLMapper.updateWinner(electionVo);                                                //선거테이블 당선인 수정
            voteSQLMapper.updateGrade(voteSQLMapper.selectCandyByNo(electionVo.getCandy_no()).getMember_no());   //레지테이블 등급 변경
            
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
      int candyKey = voteSQLMapper.createCandyKey();
      candyVo.setCandy_no(candyKey);
      
      if(voteSQLMapper.candyAble() != null) {            //기간이 맞는지 확인 후 맞다면 후보등록 가능
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
   public void changeCandy(CandyVo candyVo) {
      voteSQLMapper.updateCandy(candyVo);
   }
   
   //후보 삭제
   public void deleteCandy(int no) {
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
         MemberVo memberVo = memberSQLMapper.selectMemberByNo(candyVo.getMember_no());
         candyVo.setCandy_intro(candyVo.getCandy_intro().replaceAll("<script>", "&lt;script&gt;"));
         candyVo.setCandy_intro(candyVo.getCandy_intro().replaceAll("</script>", "&lt;/script&gt;"));
         CandyImgVo candyImgList = voteImgSQLMapper.selectCandyByNo(candyVo.getCandy_no());   //리스트에 이미지 출력
         
         
         
         
         
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
   
//   //당선인 수정(선거테이블)
//   public void changeWinner() {
//      
//      int round = voteSQLMapper.selectNewRound();
//      
//      ElectionVo electionVo = voteSQLMapper.voteEnd();      //이러면 되지 않을까?
//      electionVo.setElection_round(round);
//      
//      if(voteSQLMapper.voteEnd() != null) {
//         voteSQLMapper.updateWinner(electionVo);
//      }
//   }
   
   
   //test
   public CandyVo check(int member_no, int election_round) {
      return voteSQLMapper.check(member_no, election_round);
   }
}