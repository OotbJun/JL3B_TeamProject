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

import com.jl3b.touche_nubes.admin.mapper.AdminSQLMapper;
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
import com.jl3b.touche_nubes.membervo.AdminVo;
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
   @Autowired
   private AdminSQLMapper adminSQLMapper;

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
	   
	   MemberVo memberVo = null;
	   																		//예외처리를 이렇게 해줘야 익셉션 안 뜨더라 이말이야~
	   if(session.getAttribute("sessionUser") != null) {					//분기를 나눠주고
		   memberVo = (MemberVo) session.getAttribute("sessionUser");
		   if(memberVo.getMember_grade() >= 2) {							//멤버 등급이 2등급 이상일 때 삭제 가능
 	 		  boardSQLMapper.deleteNoticeByNo(noticeVo.getNotice_no());  
 	 	  }
	   }
	   if(session.getAttribute("sessionAdmin") != null) {					//어드민이면 그냥 삭제
		   boardSQLMapper.deleteNoticeByNo(noticeVo.getNotice_no());
	   }
	   
   }

   // 글수정
   public void changeNotice(NoticeVo noticeVo, HttpSession session) {
	   
	   
//	   if(session.getAttribute("sesssionUser") != null || session.getAttribute("sessionAdmin") != null) {
//		   MemberVo memberVo = (MemberVo) session.getAttribute("sessionUser");
//		   AdminVo adminVo = (AdminVo) session.getAttribute("sessionAdmin");
//		   
//		   System.out.println(adminVo.getAdmin_name());
//		   
//		   if(memberVo.getMember_grade() >= 2) {
//			   boardSQLMapper.updateNoticeByNo(noticeVo);
//		   }
//		   if(adminVo != null) {
//			   boardSQLMapper.updateNoticeByNo(noticeVo);
//		   }
//		   
//	   }
	   
	   if(session.getAttribute("sessionUser") != null) {						//마찬가지로 분기를 나눠주고 조건을 걸어줘야 익셉션 안 뜬다
		   MemberVo memberVo = (MemberVo) session.getAttribute("sessionUser");
		   if(memberVo.getMember_grade() >= 2) {
			   boardSQLMapper.updateNoticeByNo(noticeVo);
		   }
	   }
	   if(session.getAttribute("sessionAdmin") != null) {
		   boardSQLMapper.updateNoticeByNo(noticeVo);
	   }
	   
//	   if(session.getAttribute("sessionAdmin") != null) {
//		   //AdminVo adminVo = (AdminVo) session.getAttribute("sessionAdmin");
//		   boardSQLMapper.updateNoticeByNo(noticeVo);
//	   }
      

//      if (adminVo.getAdmin_no() == noticeVo.getAdmin_no() && adminVo != null || memberVo.getMember_grade() >= 2) { // 예외처리
//         boardSQLMapper.updateNoticeByNo(noticeVo);
//      }
   }

   // 검색
   public int noticeSearchCount(String searchOption, String searchWord) {
      if (searchWord == null) {
         return boardSQLMapper.selectNoticeAllCount();									//총게시글 수
      } else {
         return boardSQLMapper.selectNoticeByKeywordCount(searchOption, searchWord);	//검색된 게시글 수
      }
   }

   // 공지 리스트
   public List<Map<String, Object>> noticeList(String searchOption, String keyword, int currentPage) {
      List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
      List<NoticeVo> noticeList = null;
      

      // 페이징 + 검색
      if (keyword == null) {
         noticeList = boardSQLMapper.selectNoticeAll(currentPage);									//그냥 전체 리스트
      } else {
         noticeList = boardSQLMapper.selectNoticeByKeyword(searchOption, keyword, currentPage);		//검색된 결과 리스트
      }

      // 담기
      for (NoticeVo noticeVo : noticeList) {
         MemberVo memberVo = memberSQLMapper.selectMemberByNo(noticeVo.getMember_no());		//멤버테이블에 있는 정보가 필요하기 때문에(작성자) noticeVo에 set된 멤버넘버 값으로 셀렉트
         AdminVo adminVo = adminSQLMapper.selectAdminNo(noticeVo.getAdmin_no());			//마찬가지
         noticeVo.setNotice_title(noticeVo.getNotice_title().replaceAll("<script>", "&lt;script&gt;"));		//스크립트 방지
         noticeVo.setNotice_title(noticeVo.getNotice_title().replaceAll("</script>", "&lt;/script&gt;"));
         Map<String, Object> map = new HashMap<String, Object>();

         map.put("memberVo", memberVo);
         map.put("noticeVo", noticeVo);
         map.put("adminVo", adminVo);

         list.add(map);
      }
      return list;
   }

   // 글보기
   public Map<String, Object> viewNotice(int notice_no, String y) {
      Map<String, Object> map = new HashMap<String, Object>();
//      boardSQLMapper.updateNoticeReadCount(notice_no); // 조회수 -> 쿠키 사용해서 쓸 거야~
      NoticeVo noticeVo = boardSQLMapper.selectNoticeByNo(notice_no);					//글 하나 뽑는 거
      MemberVo memberVo = memberSQLMapper.selectMemberByNo(noticeVo.getMember_no());	//작성자 때문에 회원 하나 뽑는 거
      AdminVo adminVo = adminSQLMapper.selectAdminNo(noticeVo.getAdmin_no());			//마찬가지 관리자 하나 뽑자
      if (y != null) {
         noticeVo.setNotice_title(noticeVo.getNotice_title().replaceAll("<script>", "&lt;script&gt;"));
         noticeVo.setNotice_title(noticeVo.getNotice_title().replaceAll("</script>", "&lt;/script&gt;"));
         noticeVo.setNotice_content(noticeVo.getNotice_content().replaceAll("<script>", "&lt;script&gt;"));
         noticeVo.setNotice_content(noticeVo.getNotice_content().replaceAll("</script>", "&lt;/script&gt;"));
         noticeVo.setNotice_content(noticeVo.getNotice_content().replaceAll("\n", "<br>"));
      } else {
         noticeVo.setNotice_content(noticeVo.getNotice_content());
      }

      // 말머리 출력
//      HorseheadVo horseheadVo = boardSQLMapper.selectNoticeHorsehead(noticeVo.getHorsehead_sort());
//      map.put("horseheadVo", horseheadVo);

      map.put("noticeVo", noticeVo);
      map.put("memberVo", memberVo);
      map.put("adminVo", adminVo);

      return map;
   }

   // 등업되면 로그아웃 없이 바로 글 쓸 수 있게
   public MemberVo updateSession(MemberVo memberVo) {
      return memberSQLMapper.selectMemberByNo(memberVo.getMember_no());		//순수하게 셀렉트 하나만 땡기는 메서드가 필요했다
   }

   //////////////////////////////////////////////// 자게
   // 글쓰기
   public void writeBoard(BoardVo boardVo, List<BoardImgVo> boardImgList) {
      int boardKey = boardSQLMapper.createBoardKey();

      boardVo.setBoard_no(boardKey);

      boardSQLMapper.insertBoard(boardVo);

      for (BoardImgVo boardImgVo : boardImgList) {

         boardImgVo.setBoard_no(boardKey);						//BOARD테이블 넘버와 IMG테이블 넘버가 같아야 하니까 미리 시퀀스 값 생성 후 세팅

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
         // boardlist = boardSQLMapper.selectBoardByTitle(keyword, currPage); //기존 제목으로만
         // 검색 뺌.
         boardlist = boardSQLMapper.selectBoardByKeyword(searchOption, keyword, currPage); // 검색 옵션 추가
      }

      for (BoardVo boardVo : boardlist) {

         MemberVo memberVo = memberSQLMapper.selectMemberByNo(boardVo.getMember_no());
         boardVo.setBoard_title(boardVo.getBoard_title().replaceAll("<script>", "&lt;script&gt;"));
         boardVo.setBoard_title(boardVo.getBoard_title().replaceAll("</script>", "&lt;/script&gt;"));

         int like = boardSQLMapper.selectLikeUpCount(boardVo.getBoard_no());				//리스트에서 좋아요 개수 출력
         int replyCount = boardReplSQLMapper.selectReplyCount(boardVo.getBoard_no());		//제목 옆에 댓글 개수 출력

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
         noticelist = boardSQLMapper.selectNoticeFix();					//똑같다 다만 rownum으로 최신순으로 자른 거
      } else {
         noticelist = boardSQLMapper.selectNoticeFix();
      }

      for (NoticeVo noticeVo : noticelist) {
         MemberVo memberVo = memberSQLMapper.selectMemberByNo(noticeVo.getMember_no());
         AdminVo adminVo = adminSQLMapper.selectAdminNo(noticeVo.getAdmin_no());
         noticeVo.setNotice_title(noticeVo.getNotice_title().replaceAll("<script>", "&lt;script&gt;"));
         noticeVo.setNotice_title(noticeVo.getNotice_title().replaceAll("</script>", "&lt;/script&gt;"));
         Map<String, Object> map2 = new HashMap<String, Object>();

         map2.put("memberVonotice", memberVo);
         map2.put("noticeVo", noticeVo);
         map2.put("adminVo", adminVo);

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
         boardVo.setBoard_title(boardVo.getBoard_title().replaceAll("<script>", "&lt;script&gt;"));
         boardVo.setBoard_title(boardVo.getBoard_title().replaceAll("</script>", "&lt;/script&gt;"));
         Map<String, Object> map = new HashMap<String, Object>();
         int replyCount = boardReplSQLMapper.selectReplyCount(boardVo.getBoard_no());
         int like = boardSQLMapper.selectLikeUpCount(boardVo.getBoard_no());

         map.put("memberVoHot", memberVo);
         map.put("boardVo", boardVo);
         map.put("replyCount", replyCount);
         map.put("like", like);

         list.add(map);
      }
      return list;
   }

   // 글 하나 보기 ////////////////////////테스트
   public Map<String, Object> viewBoard(int board_no, HttpSession session, String y) {

      Map<String, Object> map = new HashMap<String, Object>();

//      boardSQLMapper.updateBoardReadCount(board_no);                      // 조회수 -> 쿠키 사용해서 쓸 거야~

      BoardVo boardVo = boardSQLMapper.selectBoardByNo(board_no);
      MemberVo memberVo = memberSQLMapper.selectMemberByNo(boardVo.getMember_no());

      if (y != null) {
         boardVo.setBoard_content(boardVo.getBoard_content().replaceAll("\n", "<br>")); // 줄바꿈
         boardVo.setBoard_title(boardVo.getBoard_title().replaceAll("<script>", "&lt;script&gt;"));
         boardVo.setBoard_title(boardVo.getBoard_title().replaceAll("</script>", "&lt;/script&gt;"));
         boardVo.setBoard_content(boardVo.getBoard_content().replaceAll("<script>", "&lt;script&gt;"));
         boardVo.setBoard_content(boardVo.getBoard_content().replaceAll("</script>", "&lt;/script&gt;"));
         System.out.println("글보기 변수---------" + y);
      } else {
         boardVo.setBoard_content(boardVo.getBoard_content());
         System.out.println("글수정 변수---------" + y);
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

      MemberVo memberVo = (MemberVo) session.getAttribute("sessionUser");
      AdminVo adminVo = (AdminVo) session.getAttribute("sessionAdmin");

      if (adminVo != null) {
         boardSQLMapper.deleteBoardByNo(boardVo.getBoard_no());
      }

      if (memberVo != null) { // 예외처리
       
    	  if(memberVo.getMember_no() == boardVo.getMember_no() || memberVo.getMember_grade() >= 2) {
    		  boardSQLMapper.deleteBoardByNo(boardVo.getBoard_no()); 
    	  }
    	  
      }
   }

   // 글수정
   public void changeBoard(BoardVo boardVo, HttpSession session) {

      MemberVo memberVo = (MemberVo) session.getAttribute("sessionUser");

      if (memberVo.getMember_no() == boardVo.getMember_no() && memberVo != null) {
         boardSQLMapper.updateBoard(boardVo);
      }
   }

   ////////////////////////////////// 테스트
   // 총 게시글 수, 검색 게시글 수
   public int getBoardDataCount(String searchOption, String searchWord) {				//아마 페이징 때문에 + 검색 옵션도 바껴서 만든 걸로 기억
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

   public BoardLikeVo checkLike(BoardLikeVo boardLikeVo) { // 중복방지 본인확인
      return boardSQLMapper.selectLikeByNo(boardLikeVo);
   }

   public int upCount(int board_no) { // 좋아요 개수
      return boardSQLMapper.selectLikeUpCount(board_no);
   }

   public int downCount(int board_no) { // 싫어요 개수
      return boardSQLMapper.selectLikeDownCount(board_no);
   }

   public void cancelBoardLike(BoardLikeVo boardLikeVo) { // 추천 취소
      boardSQLMapper.deleteBoardLike(boardLikeVo);
   }

   // 댓글
   public List<Map<String, Object>> getReplyList(int board_no) {

      List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

      List<BoardReVo> boardReplyList = boardReplSQLMapper.selectBoardRepleList(board_no);

      for (BoardReVo boardReVo : boardReplyList) {

         MemberVo memberVo = memberSQLMapper.selectMemberByNo(boardReVo.getMember_no());
         boardReVo.setBoard_re_content(boardReVo.getBoard_re_content().replaceAll("<script>", "&lt;script&gt;"));
         boardReVo.setBoard_re_content(boardReVo.getBoard_re_content().replaceAll("</script>", "&lt;/script&gt;"));
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
      boardReplSQLMapper.deleteBoardRe(board_no);			//보드넘버로 삭제 시키기 때문에 해당 글에 달린 댓글 전체 삭제
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
         AdminVo adminVo = adminSQLMapper.selectAdminNo(noticeVo.getAdmin_no());
         noticeVo.setNotice_title(noticeVo.getNotice_title().replaceAll("<script>", "&lt;script&gt;"));
         noticeVo.setNotice_title(noticeVo.getNotice_title().replaceAll("</script>", "&lt;/script&gt;"));
         Map<String, Object> map2 = new HashMap<String, Object>();

         map2.put("memberVonotice", memberVo);
         map2.put("noticeVo", noticeVo);
         map2.put("adminVo", adminVo);
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
         AdminVo adminVo = adminSQLMapper.selectAdminNo(ideaVo.getAdmin_no());
         ideaVo.setIdea_title(ideaVo.getIdea_title().replaceAll("<script>", "&lt;script&gt;"));
         ideaVo.setIdea_title(ideaVo.getIdea_title().replaceAll("</script>", "&lt;/script&gt;"));

         int ideaLike = boardSQLMapper.selectIdeaLikeUpCount(ideaVo.getIdea_no());

         Map<String, Object> map = new HashMap<String, Object>();

         map.put("memberVo", memberVo);
         map.put("ideaVo", ideaVo);
         map.put("ideaLike", ideaLike);
         map.put("adminVo", adminVo);

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
      AdminVo adminVo = adminSQLMapper.selectAdminNo(ideaVo.getAdmin_no());

      if (y != null) {
         ideaVo.setIdea_content(ideaVo.getIdea_content().replaceAll("<script>", "&lt;script&gt;"));
         ideaVo.setIdea_content(ideaVo.getIdea_content().replaceAll("</script>", "&lt;/script&gt;"));
         ideaVo.setIdea_title(ideaVo.getIdea_title().replaceAll("<script>", "&lt;script&gt;"));
         ideaVo.setIdea_title(ideaVo.getIdea_title().replaceAll("</script>", "&lt;/script&gt;"));
         ideaVo.setIdea_content(ideaVo.getIdea_content().replaceAll("\n", "<br>")); // 줄바꿈
      } else {
         ideaVo.setIdea_content(ideaVo.getIdea_content()); // 줄바꿈
      }

      int upCount = boardSQLMapper.selectIdeaLikeUpCount(ideaVo.getIdea_no()); // 좋아요 개수

      List<IdeaImgVo> ideaImgList = boardImgSQLMapper.selectIdeaByNo(idea_no);

      map.put("memberVo", memberVo);
      map.put("ideaImgList", ideaImgList);
      map.put("ideaVo", ideaVo);
      map.put("upCount", upCount);
      map.put("adminVo", adminVo);

      return map;
   }

   // 글삭제
   public void deleteIdea(IdeaVo ideaVo, HttpSession session) {

      AdminVo adminVo = (AdminVo) session.getAttribute("sessionAdmin");

      if (adminVo != null) {
         boardSQLMapper.deleteIdeaByNo(ideaVo.getIdea_no());
      }

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

   public IdeaLikeVo checkLike(IdeaLikeVo ideaLikeVo) { // 중복방지 본인확인
      return boardSQLMapper.selectIdeaLikeByNo(ideaLikeVo);
   }

   public int recommendCount(int idea_no) { // 좋아요 개수
      return boardSQLMapper.selectIdeaLikeUpCount(idea_no);
   }

   public void cancelIdeaLike(IdeaLikeVo ideaLikeVo) { // 추천 취소
      boardSQLMapper.deleteIdeaLike(ideaLikeVo);
   }

   // 답글쓰기
   public void answerIdea(IdeaVo ideaVo, HttpSession session) {

      AdminVo adminVo = (AdminVo) session.getAttribute("sessionAdmin");
      
      

      if (adminVo != null) {
         boardSQLMapper.insertIdeaAnswer(ideaVo);
         boardSQLMapper.updateHorsehead();
      }

   }

   //// 본인확인
   public BoardReVo checkReply(BoardReVo boardReVo) {			//수정, 삭제를 위한 본인확인				
      return boardReplSQLMapper.selectCheckReply(boardReVo);
   }

   // 공지 조회수
   public void updateNoticeReadCount(int notice_no) {
      boardSQLMapper.updateNoticeReadCount(notice_no);
   }

   // 자게 조회수
   public void updateBoardReadCount(int board_no) {
      boardSQLMapper.updateBoardReadCount(board_no);
   }

   // 청원 조회수
   public void updateIdeaReadCount(int idea_no) {
      boardSQLMapper.updateIdeaReadCount(idea_no);
   }

}