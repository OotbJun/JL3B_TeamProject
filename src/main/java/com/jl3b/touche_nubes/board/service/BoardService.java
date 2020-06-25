package com.jl3b.touche_nubes.board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jl3b.touche_nubes.board.mapper.BoardImgSQLMapper;
import com.jl3b.touche_nubes.board.mapper.BoardReplSQLMapper;
import com.jl3b.touche_nubes.board.mapper.BoardSQLMapper;
import com.jl3b.touche_nubes.boardvo.BoardImgVo;
import com.jl3b.touche_nubes.boardvo.BoardLikeVo;
import com.jl3b.touche_nubes.boardvo.BoardReVo;
import com.jl3b.touche_nubes.boardvo.BoardVo;
import com.jl3b.touche_nubes.horseheadvo.HorseheadVo;
import com.jl3b.touche_nubes.ideavo.IdeaImgVo;
import com.jl3b.touche_nubes.ideavo.IdeaLikeVo;
import com.jl3b.touche_nubes.ideavo.IdeaVo;
import com.jl3b.touche_nubes.member.mapper.MemberSQLMapper;
import com.jl3b.touche_nubes.membervo.CenterVo;
import com.jl3b.touche_nubes.membervo.MemberVo;
import com.jl3b.touche_nubes.noticevo.NoticeVo;

@Service
public class BoardService {

   @Autowired
   private BoardSQLMapper boardSQLMapper;
   @Autowired
   private MemberSQLMapper memberSQLMapper;
   @Autowired
   private BoardImgSQLMapper boardImgSQLMapper;
   @Autowired
   private BoardReplSQLMapper boardReplSQLMapper;

   // 말머리 선택
//   public HorseheadVo chooseHorsehead(String sort) {
//      return boardSQLMapper.selectNoticeHorsehead(sort);
//   }

   ////////////////////////////////////////// 공지사항
   // 글쓰기
   public void writeNotice(NoticeVo noticeVo) {
      boardSQLMapper.insertNotice(noticeVo);
   }

   // 글삭제
   public void deleteNotice(NoticeVo noticeVo, HttpSession session) {
      
      MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
      
      if(memberVo.getMember_no() == noticeVo.getMember_no() && memberVo != null || memberVo.getMember_grade() >= 2) {      //예외처리
         boardSQLMapper.deleteNoticeByNo(noticeVo.getNotice_no());            //권한 없이 주소창으로 입력시 삭제되는 거 막음.
      }
   }

   // 글수정
   public void changeNotice(NoticeVo noticeVo, HttpSession session) {
      
      MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
      
      if(memberVo.getMember_no() == noticeVo.getMember_no() && memberVo != null || memberVo.getMember_grade() >= 2) {      //예외처리
         boardSQLMapper.updateNoticeByNo(noticeVo);
      }
   }

   // 검색
   public int noticeSearchCount(String searchOption, String searchWord) {
      if (searchWord == null) {
         return boardSQLMapper.selectNoticeAllCount();
      } else {
         return boardSQLMapper.selectNoticeByKeywordCount(searchOption, searchWord);
      }
   }

   // 공지 리스트
   public List<Map<String, Object>> noticeList(String searchOption, String keyword, int currentPage) {
      List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
      List<NoticeVo> noticeList = null;

      // 페이징 + 검색
      if (keyword == null) {
         noticeList = boardSQLMapper.selectNoticeAll(currentPage);
      } else {
         noticeList = boardSQLMapper.selectNoticeByKeyword(searchOption, keyword, currentPage);
      }

      // 담기
      for (NoticeVo noticeVo : noticeList) {
         MemberVo memberVo = memberSQLMapper.selectMemberByNo(noticeVo.getMember_no());

         Map<String, Object> map = new HashMap<String, Object>();

         map.put("memberVo", memberVo);
         map.put("noticeVo", noticeVo);

         list.add(map);
      }
      return list;
   }

   // 글보기
   public Map<String, Object> viewNotice(int notice_no, String y) {
      Map<String, Object> map = new HashMap<String, Object>();
//      boardSQLMapper.updateNoticeReadCount(notice_no); // 조회수 -> 쿠키 사용해서 쓸 거야~
      NoticeVo noticeVo = boardSQLMapper.selectNoticeByNo(notice_no);
      MemberVo memberVo = memberSQLMapper.selectMemberByNo(noticeVo.getMember_no());
      if(y!=null) {
         noticeVo.setNotice_content(noticeVo.getNotice_content().replaceAll("\n","<br>"));   
      }else {
         noticeVo.setNotice_content(noticeVo.getNotice_content());
      }

      // 말머리 출력
//      HorseheadVo horseheadVo = boardSQLMapper.selectNoticeHorsehead(noticeVo.getHorsehead_sort());
//      map.put("horseheadVo", horseheadVo);

      map.put("noticeVo", noticeVo);
      map.put("memberVo", memberVo);

      return map;
   }
   
   //등업되면 로그아웃 없이 바로 글 쓸 수 있게
   public MemberVo updateSession(MemberVo memberVo) {
      return memberSQLMapper.selectMemberByNo(memberVo.getMember_no());
   }

   //////////////////////////////////////////////// 자게
   // 글쓰기
   public void writeBoard(BoardVo boardVo, List<BoardImgVo> boardImgList) {
      int boardKey = boardSQLMapper.createBoardKey();

      boardVo.setBoard_no(boardKey);

      boardSQLMapper.insertBoard(boardVo);

      for (BoardImgVo boardImgVo : boardImgList) {

         boardImgVo.setBoard_no(boardKey);

         boardImgSQLMapper.insertBoardImg(boardImgVo);
      }
   }

   // 자게 글 리스트
   public List<Map<String, Object>> boardList(String searchOption, String keyword, int currPage) { 

      List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

      List<BoardVo> boardlist = null;

      if (keyword == null) {
         boardlist = boardSQLMapper.selectBoardAll(currPage);
      } else {
         // boardlist = boardSQLMapper.selectBoardByTitle(keyword, currPage);               //기존 제목으로만 검색 뺌.
         boardlist = boardSQLMapper.selectBoardByKeyword(searchOption, keyword, currPage);      //검색 옵션 추가
      }

      for (BoardVo boardVo : boardlist) {

         MemberVo memberVo = memberSQLMapper.selectMemberByNo(boardVo.getMember_no());

         
         int like = boardSQLMapper.selectLikeUpCount(boardVo.getBoard_no());
         int replyCount = boardReplSQLMapper.selectReplyCount(boardVo.getBoard_no());

         Map<String, Object> map = new HashMap<String, Object>();

         map.put("memberVo", memberVo);
         map.put("like", like);
         map.put("boardVo", boardVo);
         map.put("replyCount", replyCount);

         list.add(map);
      }
      return list;
   }

   // 상단 고정 공지
   public List<Map<String, Object>> boardNoticeList(String searchWord, int currPage) {
      List<Map<String, Object>> list2 = new ArrayList<Map<String, Object>>();
      List<NoticeVo> noticelist = null;
      if (searchWord == null) {
         noticelist = boardSQLMapper.selectNoticeFix();
      } else {
         noticelist = boardSQLMapper.selectNoticeFix();
      }

      for (NoticeVo noticeVo : noticelist) {
         MemberVo memberVo = memberSQLMapper.selectMemberByNo(noticeVo.getMember_no());
         Map<String, Object> map2 = new HashMap<String, Object>();

         map2.put("memberVonotice", memberVo);
         map2.put("noticeVo", noticeVo);
         list2.add(map2);
      }

      return list2;
   }

   // 인기글 고정
   public List<Map<String, Object>> boardHotList(String searchWord, int currPage) {
      List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
      List<BoardVo> hotList = null;
      if (searchWord == null) {
         hotList = boardSQLMapper.selectHotFix();
      } else {
         hotList = boardSQLMapper.selectHotFix();
      }

      for (BoardVo boardVo : hotList) {
         MemberVo memberVo = memberSQLMapper.selectMemberByNo(boardVo.getMember_no());
         Map<String, Object> map = new HashMap<String, Object>();
         int replyCount = boardReplSQLMapper.selectReplyCount(boardVo.getBoard_no());

         map.put("memberVoHot", memberVo);
         map.put("boardVo", boardVo);
         map.put("replyCount", replyCount);

         list.add(map);
      }
      return list;
   }

   // 글 하나 보기                                                ////////////////////////테스트
   public Map<String, Object> viewBoard(int board_no, HttpSession session, String y) {

      Map<String, Object> map = new HashMap<String, Object>();

//      boardSQLMapper.updateBoardReadCount(board_no);                      // 조회수 -> 쿠키 사용해서 쓸 거야~
      
      
      
      BoardVo boardVo = boardSQLMapper.selectBoardByNo(board_no);
      MemberVo memberVo = memberSQLMapper.selectMemberByNo(boardVo.getMember_no());
      
      if(y!=null) {
         boardVo.setBoard_content(boardVo.getBoard_content().replaceAll("\n","<br>"));   //줄바꿈
         System.out.println("글보기 변수---------"+y);   
      } else { 
         boardVo.setBoard_content(boardVo.getBoard_content());
         System.out.println("글수정 변수---------"+y);
      }
      List<BoardImgVo> boardImgList = boardImgSQLMapper.selectBoardByNo(board_no);
      int replyCount = boardReplSQLMapper.selectReplyCount(boardVo.getBoard_no());
      int upCount = boardSQLMapper.selectLikeUpCount(boardVo.getBoard_no());
      int downCount = boardSQLMapper.selectLikeDownCount(boardVo.getBoard_no());
      

      map.put("memberVo", memberVo);
      map.put("replyCount", replyCount);
      map.put("boardImgList", boardImgList);
      map.put("boardVo", boardVo);
      map.put("upCount", upCount);
      map.put("downCount", downCount);

      return map;
   }

   // 글삭제
   public void deleteBoard(BoardVo boardVo, HttpSession session) {
      
      MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
      
      if(memberVo.getMember_no() == boardVo.getMember_no() && memberVo != null || memberVo.getMember_grade() >= 2) {      //예외처리
         boardSQLMapper.deleteBoardByNo(boardVo.getBoard_no());                        //권한 없이 주소창으로 입력시 삭제되는 거 막음.
      }
   }

   // 글수정
   public void changeBoard(BoardVo boardVo, HttpSession session) {
      
      MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
      
      System.out.println("멤버 넘버 : "+memberVo.getMember_no());
      System.out.println("보드 멤버 넘버 : "+boardVo.getMember_no());
      
      
      if(memberVo.getMember_no() == boardVo.getMember_no() && memberVo != null) {
         boardSQLMapper.updateBoard(boardVo);
      }
   }

   ////////////////////////////////// 테스트
   // 총 게시글 수, 검색 게시글 수
   public int getBoardDataCount(String searchOption, String searchWord) {
      if (searchWord == null) {
         return boardSQLMapper.selectBoardAllCount();
      } else {
         return boardSQLMapper.selectBoardByKeywordCount(searchOption, searchWord);
      }
   }

   public void changeHot() { // 인기글로 가버려~~
      boardSQLMapper.updateHot();
   }

   // 추천
   public void chooseLike(BoardLikeVo boardLikeVo) {
      boardSQLMapper.insertBoardLike(boardLikeVo);
   }
   public BoardLikeVo checkLike(BoardLikeVo boardLikeVo) {    // 중복방지 본인확인
      return boardSQLMapper.selectLikeByNo(boardLikeVo);
   }
   public int upCount(int board_no) {                      // 좋아요 개수
      return boardSQLMapper.selectLikeUpCount(board_no);
   }
   public int downCount(int board_no) {                   // 싫어요 개수
      return boardSQLMapper.selectLikeDownCount(board_no);
   }
   public void cancelBoardLike(BoardLikeVo boardLikeVo) {      //추천 취소
      boardSQLMapper.deleteBoardLike(boardLikeVo);
   }
   

   // 댓글
   public List<Map<String, Object>> getReplyList(int board_no) {

      List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

      List<BoardReVo> boardReplyList = boardReplSQLMapper.selectBoardRepleList(board_no);
      
      for (BoardReVo boardReVo : boardReplyList) {

         MemberVo memberVo = memberSQLMapper.selectMemberByNo(boardReVo.getMember_no());
         Map<String, Object> map = new HashMap<String, Object>();

         map.put("boardReVo", boardReVo);
         map.put("memberVo", memberVo);

         list.add(map);
      }
      return list;
   }

   // 댓글 입력
   public int insertRepl(BoardReVo boardReVo) {
      return boardReplSQLMapper.insertBoardReply(boardReVo);
   }
   
   // 댓글 수정
   public int changeRepl(BoardReVo boardReVo) {
      return boardReplSQLMapper.updateBoardReply(boardReVo);
   }

   // 해당 댓글만 삭제
   public int deleteRepl(int board_re_no) {
      return boardReplSQLMapper.deleteBoardReply(board_re_no);
   }
   
   

   // 이미지 삭제
   public int deleteBoardImg(int board_no) {
      return boardImgSQLMapper.deleteBoardImg(board_no);
   }

   // 게시글 번호로 삭제시킴으로 전체 댓글 삭제
   public void deleteBoardRe(int board_no) {
      boardReplSQLMapper.deleteBoardRe(board_no);
   }

   //////////////////////////////////////////////////////////////////////// 청원
   // 글쓰기
   public void writeIdea(IdeaVo ideaVo, List<IdeaImgVo> ideaImgList) {
      int ideaKey = boardSQLMapper.createIdeaKey();

      ideaVo.setIdea_no(ideaKey);

      boardSQLMapper.insertIdea(ideaVo);

      for (IdeaImgVo ideaImgVo : ideaImgList) {

         ideaImgVo.setIdea_no(ideaKey);

         boardImgSQLMapper.insertIdeaImg(ideaImgVo);
      }
   }

   // 공지사항 고정
   public List<Map<String, Object>> ideaNoticeList(String searchWord, int currPage) {
      List<Map<String, Object>> list2 = new ArrayList<Map<String, Object>>();
      List<NoticeVo> noticelist = null;
      if (searchWord == null) {
         noticelist = boardSQLMapper.selectNoticeIdeaFix();
      } else {
         noticelist = boardSQLMapper.selectNoticeIdeaFix();
      }

      for (NoticeVo noticeVo : noticelist) {
         MemberVo memberVo = memberSQLMapper.selectMemberByNo(noticeVo.getMember_no());
         Map<String, Object> map2 = new HashMap<String, Object>();

         map2.put("memberVonotice", memberVo);
         map2.put("noticeVo", noticeVo);
         list2.add(map2);
      }

      return list2;
   }

   // 글 리스트
   public List<Map<String, Object>> ideaList(String searchOption, String keyword, int currPage) {

      List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
      List<IdeaVo> idealist = null;

      if (keyword == null) {
         idealist = boardSQLMapper.selectIdeaAll(currPage);
      } else {
         idealist = boardSQLMapper.selectIdeaByKeyword(searchOption, keyword, currPage);
      }

      for (IdeaVo ideaVo : idealist) {

         MemberVo memberVo = memberSQLMapper.selectMemberByNo(ideaVo.getMember_no());

         int ideaLike = boardSQLMapper.selectIdeaLikeUpCount(ideaVo.getIdea_no());

         Map<String, Object> map = new HashMap<String, Object>();

         map.put("memberVo", memberVo);
         map.put("ideaVo", ideaVo);
         map.put("ideaLike", ideaLike);

         list.add(map);
      }
      return list;
   }

   // 글보기
   public Map<String, Object> viewIdea(int idea_no, String y) {

      Map<String, Object> map = new HashMap<String, Object>();

//      boardSQLMapper.updateIdeaReadCount(idea_no);                // 조회수 -> 쿠키 사용해서 쓸 거야~
      IdeaVo ideaVo = boardSQLMapper.selectIdeaByNo(idea_no);
      MemberVo memberVo = memberSQLMapper.selectMemberByNo(ideaVo.getMember_no());
      if (y!=null) {
         ideaVo.setIdea_content(ideaVo.getIdea_content().replaceAll("\n","<br>"));      //줄바꿈   
      } else {
         ideaVo.setIdea_content(ideaVo.getIdea_content());      //줄바꿈
      }
      
      int upCount = boardSQLMapper.selectIdeaLikeUpCount(ideaVo.getIdea_no()); // 좋아요 개수

      List<IdeaImgVo> ideaImgList = boardImgSQLMapper.selectIdeaByNo(idea_no);

      map.put("memberVo", memberVo);
      map.put("ideaImgList", ideaImgList);
      map.put("ideaVo", ideaVo);
      map.put("upCount", upCount);

      return map;
   }

   // 글삭제
   public void deleteIdea(int idea_no) {
      boardSQLMapper.deleteIdeaByNo(idea_no);
   }

   // 글수정
   public void changeIdea(IdeaVo ideaVo) {
      boardSQLMapper.updateIdea(ideaVo);
   }

   // 총 게시글 수, 검색 게시글 수
   public int getIdeaDataCount(String searchOption, String searchWord) {
      if (searchWord == null) {
         return boardSQLMapper.selectIdeaAllCount();
      } else {
         return boardSQLMapper.selectIdeaByKeywordCount(searchOption, searchWord);
      }
   }

   // 추천
   public void chooseLike(IdeaLikeVo ideaLikeVo) {
      boardSQLMapper.insertIdeaLike(ideaLikeVo);
   }
   public IdeaLikeVo checkLike(IdeaLikeVo ideaLikeVo) {       // 중복방지 본인확인
      return boardSQLMapper.selectIdeaLikeByNo(ideaLikeVo);
   }
   public int recommendCount(int idea_no) {                // 좋아요 개수
      return boardSQLMapper.selectIdeaLikeUpCount(idea_no);
   }
   public void cancelIdeaLike(IdeaLikeVo ideaLikeVo) {         //추천 취소
      boardSQLMapper.deleteIdeaLike(ideaLikeVo);
   }

   // 답글쓰기
   public void answerIdea(IdeaVo ideaVo) {
      boardSQLMapper.insertIdeaAnswer(ideaVo);
      boardSQLMapper.updateHorsehead();
   }
   
   
   
   
   
   ////테스트
   public BoardReVo checkReply(BoardReVo boardReVo) {
      return boardReplSQLMapper.selectCheckReply(boardReVo);
   }

   
   //공지 조회수
   public void updateNoticeReadCount(int notice_no) {
      boardSQLMapper.updateNoticeReadCount(notice_no);
   }
   //자게 조회수
   public void updateBoardReadCount(int board_no) {
      boardSQLMapper.updateBoardReadCount(board_no);
   }
   //청원 조회수
   public void updateIdeaReadCount(int idea_no) {
      boardSQLMapper.updateIdeaReadCount(idea_no);
   }

}