package com.jl3b.touche_nubes.board.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.config.ScheduledTask;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jl3b.touche_nubes.board.service.BoardService;
import com.jl3b.touche_nubes.boardvo.BoardImgVo;
import com.jl3b.touche_nubes.boardvo.BoardLikeVo;
import com.jl3b.touche_nubes.boardvo.BoardReVo;
import com.jl3b.touche_nubes.boardvo.BoardVo;
import com.jl3b.touche_nubes.chat.service.ChatService;
import com.jl3b.touche_nubes.chatvo.ChatVo;
import com.jl3b.touche_nubes.horseheadvo.HorseheadVo;
import com.jl3b.touche_nubes.ideavo.IdeaImgVo;
import com.jl3b.touche_nubes.ideavo.IdeaLikeVo;
import com.jl3b.touche_nubes.ideavo.IdeaVo;
import com.jl3b.touche_nubes.member.service.MemberServiceImpl;
import com.jl3b.touche_nubes.membervo.AdminVo;
import com.jl3b.touche_nubes.membervo.MemberVo;
import com.jl3b.touche_nubes.noticevo.NoticeVo;

@Controller
@RequestMapping("/board/*")
public class BoardController {
   
   @Autowired
   private BoardService boardService;
   @Autowired
   private ChatService chatService;
   
   private String y = null;
   
   //걍 메인 테스트용
   @RequestMapping("/main.do")
   public String main(Model model, HttpSession session, ChatVo chatVo) {
      //boardService.test();
      try{
         int chat_no = chatService.newChatNo();						//메인페이지에서 채팅창 입장시 챗넘버 MAX값 뽑아서
         model.addAttribute("chat_no", chat_no);					//넘겨준다.
         //System.out.println("asd" + chatVo.getChat_no());
      }catch(Exception e) {
         e.printStackTrace();
      }
      
      
      if(session.getAttribute("sessionUser") != null) {				//예외처리
         MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");			//세션값 MemberVo에 담고
         chatVo.setMember_no(memberVo.getMember_no());								//다시 ChatVo에 담겨진 멤버 넘버, 멤버 네임 세팅
         chatVo.setMember_rname(memberVo.getMember_rname());
         chatService.enterChat(chatVo);												//채팅방 입장 메서드 호출(insert ~~님이 입장하셨습니다.)
      }
      
      return "board/main";
   }
   
   /////////////////////////////////////공지사항
   //글쓰기
   @RequestMapping("/notice_write.do")
   public String writeNotice() {      
      return "board/notice_write";
   }
   @RequestMapping("/notice_write_process.do")
   public String writeNoticeProcess(NoticeVo noticeVo, HttpSession session, Model model) {
      
      MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");	//noticeVo등 해당 Vo에 멤버 넘버값이 필요하기 때문에 세션 값 뽑아와서 담아주는 작업
      noticeVo.setMember_no(memberVo.getMember_no());
      boardService.writeNotice(noticeVo);
      
      model.addAttribute("sessionUser", memberVo);

      return "redirect:./notice.do";
   }
   
   //공지 리스트
   @RequestMapping("/notice.do")
   public String notice(@RequestParam(defaultValue = "notice_title")String searchOption, String searchWord, Model model, HttpSession session,
            @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
      
      if(session.getAttribute("sessionUser") != null) {							//등업 한 후 로그아웃 없이 바로 공지 글 쓸 수 있게
         MemberVo memberData = (MemberVo)session.getAttribute("sessionUser");	//현재 로그인 돼있는 정보 담고
         MemberVo updateData = boardService.updateSession(memberData);			//로그인 된 정보로 셀렉트 해줘서 업데이트된 정보(당선되고 등급이 올라간 상태)를 다시 담아준다
         session.setAttribute("sessionUser", updateData);                     	//세션값 다시 세팅, 즉 로그아웃 없이 등급업 된 상태로 바뀌는 거
         System.out.println("갱신 테스트");
      }
      
      
      if(currentPage <= 0) {			//페이지가 없으면 최소 1로 되게끔
         currentPage = 1;
      }
      
      List<Map<String, Object>> list = boardService.noticeList(searchOption, searchWord, currentPage);	//검색 옵션, 검색어, 페이지 넘겨준다(쿼리보면 이해될듯).
      
      //총 게시글 수
      int totalCount = boardService.noticeSearchCount(searchOption, searchWord);		//검색을 해도 페이징처리 해야되니깐 매개변수 넘겨준다
      
      //페이지 짜르는 거 할 거야
      int beginPage = ((currentPage-1) / 5) * 5 + 1;		//currentPage값이 그대로 나옴(1이면 1, 10이면 10)
      int endPage = ((currentPage-1) / 5 + 1 ) * 5;			//currentPage값 + 4
      
      if(endPage > (totalCount-1)/10 + 1) {					//endPage값이 총게시글 수보다 크면 endPage 유지
         endPage = (totalCount-1)/10 + 1;
      }
      
      model.addAttribute("beginPage", beginPage);
      model.addAttribute("endPage", endPage);
      model.addAttribute("currentPage", currentPage);
      model.addAttribute("totalCount", totalCount);
      model.addAttribute("noticeList", list);
      model.addAttribute("searchWord", searchWord);
      model.addAttribute("searchOption", searchOption);
      
      
      
      return "board/notice";
   }
   
   //글 하나 읽기
   @RequestMapping("/notice_read.do")
   public String readNotice(int notice_no, Model model, HttpServletRequest request, HttpServletResponse response,
         @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {      
      
      
      
      //쿠키 이용해서 조회수 중복 방지
      boolean isRead = false;                        	 //디폴트는 false로 세팅
      
      Cookie[] cookies = request.getCookies();         	 //배열로 쿠키값 담아준다
      
      for(Cookie cookie : cookies) {
         String name = cookie.getName();         		 //쿠키네임 가져와서
         if(name.startsWith("read_notice_no")) {         //네임이 read_notice_no로 시작된다면
            int no = Integer.parseInt(name.substring(name.indexOf("|")+1));     //파이프+1 자리부터 잘라서 parseInt로 String값을 int로 변환 후(비교해야 되니까) 변수에 담아준다.
            																	//indexOf : 문자열의 위치 리턴, substring : 문자열 자름
            if(no == notice_no) {                  //변수가 notice_no와 같다면 트루로 변환, 즉 한번이라도 읽은 넘버는 true로
               isRead = true;
            }
         }
      }
      
      Cookie cookie = new Cookie("read_notice_no|" + notice_no, "aaaa");      //키에 notice_no 붙여주고, 값은 쓸모 없어서 대충
      response.addCookie(cookie);                                    	//쿠키 넣어준다
      
      if(!isRead) {
         boardService.updateNoticeReadCount(notice_no);                 //isRead가 false면 조회수 증가
      }
      
      y="read";
      Map<String, Object> map = boardService.viewNotice(notice_no, y);
      
      model.addAttribute("readNotice", map);
      model.addAttribute("currentPage", currentPage);
      
      return "board/notice_read";
   }
   
   //글삭제
   @RequestMapping("/notice_delete_process.do")
   public String deleteNotice(NoticeVo noticeVo, HttpSession session) {
      
      boardService.deleteNotice(noticeVo, session);		//예외처리 위하여 세션도 넘김
      
      return "redirect:./notice.do";
   }
   
   //글수정
   @RequestMapping("/notice_change.do")
   public String changeNotice(int notice_no, Model model, HttpSession session,
         @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {      
      
      y=null;
      model.addAttribute("readNotice", boardService.viewNotice(notice_no, y));	//수정페이지 들어가면 원글 남아있어야 하니까 메서드 호출해서 모델에 담아준다
      model.addAttribute("currentPage", currentPage);
      
      return "board/notice_change";
   }
   @RequestMapping("/notice_change_process.do")
   public String changeNoticeProcess(NoticeVo noticeVo, HttpSession session,
         @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {                  
      
      boardService.changeNotice(noticeVo, session);		//이것도 예외처리 때문에 세션도 넘긴다
      
      return "redirect:./notice_read.do?notice_no="+noticeVo.getNotice_no()+"&currentPage="+currentPage;	//수정페이지에 currentPage 매개변수가 세팅 돼 있어서 같이 넘겨줘야 한다
   }
   
   
   ///////////////////////////////////자게
   @RequestMapping("/board.do")
   public String board(@RequestParam(defaultValue = "board_title")String searchOption, String searchWord,Model model,
            @RequestParam(value="currPage", required = false, defaultValue ="1")int currPage) {
         
      List<Map<String, Object>> list = boardService.boardList(searchOption, searchWord, currPage);      //그냥 자게
      List<Map<String, Object>> list2 = boardService.boardNoticeList(searchWord,currPage);            	//상단 고정 공지
      boardService.changeHot();                                                         				//인기글 업데이트
      List<Map<String, Object>> list3 = boardService.boardHotList(searchWord, currPage);               	//인기글 고정
      
      
      
      int totalCount = boardService.getBoardDataCount(searchOption, searchWord);
      int beginPage = ((currPage-1)/5) *5 +1;
      int endPage = ((currPage-1)/5+1) * (5);
      
      if(endPage>(totalCount-1)/10+1) {
         endPage=((totalCount-1))/10+1;   
      }
      model.addAttribute("beginPage", beginPage);
      model.addAttribute("endPage", endPage);
      model.addAttribute("totalCount", totalCount);
      model.addAttribute("currPage", currPage);
      model.addAttribute("boardList", list);
      model.addAttribute("boardNoticeList",list2);      //공지 고정
      model.addAttribute("boardHotList",list3);         //인기글 고정
      model.addAttribute("searchWord", searchWord);
      model.addAttribute("searchOption", searchOption);
      
      
      
      return "board/board";
   }
   
   //글쓰기
   @RequestMapping("/board_write.do")
   public String writeBoard() {
      return "board/board_write";
   }
   @RequestMapping("/board_write_process.do")
      public String writeBoardProcess(MultipartFile [] boardImgList,BoardVo boardVo, HttpSession session) {
         // Vo 객체에는 필요한 정보들을 불러낼 수 있기 때문에 사용한다.
         // session.getAttribute 는 오브젝트파일로 받기 때문에 ResiVo로 형변환 한다.
         String RootFolderName = "/var/storage/";						//저장 폴더 생성
         Date today = new Date();										//오늘 날짜 생성
         SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd");
         String todayFolder = df.format(today);							//포맷에 맞게 날짜 세팅
         String SaveFolderName = RootFolderName + todayFolder;			//폴더 + 날짜
         File SaveFolder = new File (SaveFolderName);					//즉 /var/storage/2020/00/00
      
         if(!SaveFolder.exists()){										//폴더 존재하지 않으면
            SaveFolder.mkdirs();										//폴더 생성
         
         }
         List<BoardImgVo> BoardImgList = new ArrayList<BoardImgVo>();
         
         for(MultipartFile file :boardImgList ) {						//리스트에 파일 담아준다
            if(file.getSize() <=0) {									//단 파일크기가 0보다 작을시 즉 업로드 안할 경우 그냥 컨티뉴
               continue;
            }
         //파일명 랜덤 이름 
         String SaveFileTitle = UUID.randomUUID().toString();
         String oriFileTitle = file.getOriginalFilename();
         SaveFileTitle += "_" + System.currentTimeMillis();				//파일 랜덤 이름 + 현재 시간
         SaveFileTitle += oriFileTitle.substring(oriFileTitle.lastIndexOf("."));	//파일 원래 이름 자른다 .JPG 앞으로
         String SaveRealPath = SaveFolderName + "/" + SaveFileTitle;	//경로는 폴더 이름 + 파일 이름

         try {
            
            file.transferTo(new File(SaveRealPath));			//저장된 경로에 파일 생성
            
         }catch(IOException e) {
            e.printStackTrace();
         }
         
            // DB에 담을 Vo객체를 생성 
            BoardImgVo boardImgVo = new BoardImgVo();
            boardImgVo.setBoard_img_title(todayFolder+"/"+SaveFileTitle);			//파일 제목 설정
            boardImgVo.setBoard_img_path(SaveRealPath);								//파일 경로 설정
            BoardImgList.add(boardImgVo);											//설정된 VO값 리스트에 담아준다
         }
         
         MemberVo memberVo = (MemberVo) session.getAttribute("sessionUser");

         boardVo.setMember_no(memberVo.getMember_no());
      
         boardService.writeBoard(boardVo,BoardImgList);
      
         return "redirect:./board.do";
      }
   
   //글 하나 읽기
   @RequestMapping("/board_read.do")
   public String readBoard(int board_no, Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response,
         @RequestParam(value="currPage", required = false, defaultValue ="1")int currPage) {
      
      //쿠키 사용해서 조회수 중복 방지
      boolean isRead = false;
      
      Cookie[] cookies = request.getCookies();
      
      for(Cookie cookie : cookies) {
         String name = cookie.getName();
         if(name.startsWith("read_board_no")) {
            int no = Integer.parseInt(name.substring(name.indexOf("|")+1));
            
            if(no == board_no) {
               isRead = true;
            }
         }
      }
      Cookie cookie = new Cookie("read_board_no|"+board_no , "xxxxx");
      response.addCookie(cookie);

      if(!isRead) {
         boardService.updateBoardReadCount(board_no);
      }

      y="read";
       
      Map<String, Object> map = boardService.viewBoard(board_no, session, y);
      List<Map<String, Object>> boardReplList = boardService.getReplyList(board_no);		//댓글 리스트
      
      model.addAttribute("readBoard", map);
      model.addAttribute("boardReplList",boardReplList);
      model.addAttribute("currPage", currPage);
      
      return "board/board_read";
   }
   
   //글삭제
   @RequestMapping("/board_delete_process.do")
   public String deleteBoard(BoardVo boardVo, HttpSession session) {
      boardService.deleteBoard(boardVo, session);         //게시글 삭제
//      boardService.deleteBoardImg(board_no);      //게시글 이미지 삭제
//      boardService.deleteBoardRe(board_no);      //게시글 댓글 삭제

      return "redirect:./board.do";
   }
   
   //글수정
   @RequestMapping("/board_change.do")
   public String changeBoard(int board_no, Model model, HttpSession session,
         @RequestParam(value="currPage", required = false, defaultValue ="1")int currPage) {
      y=null;
      model.addAttribute("readBoard", boardService.viewBoard(board_no, session, y));
      model.addAttribute("currPage", currPage);
      
      return "board/board_change";
   }
   @RequestMapping("/board_change_process.do")
   public String updateContentProcess(BoardVo boardVo, HttpSession session,
         @RequestParam(value="currPage", required = false, defaultValue ="1")int currPage) {
      boardService.changeBoard(boardVo, session);
      return "redirect:./board_read.do?board_no="+boardVo.getBoard_no()+"&currPage="+currPage;
   }
   
   //이미지 삭제
   @RequestMapping("/delete_board_img.do")
   public String deleteBoardImg(int board_no) {
      boardService.deleteBoardImg(board_no);
      return "redirect:./board_read.do?board_no="+board_no ;
   }
   
   ////////////////////////////////// 주민청원게시판
   //주민청원게시판 리스트
   
   @RequestMapping("/idea.do")
   public String idea(@RequestParam(defaultValue = "idea_title")String searchOption,String searchWord, Model model,
         @RequestParam(value = "currPage", required = false, defaultValue = "1") int currPage) {

      List<Map<String, Object>> list = boardService.ideaList(searchOption,searchWord, currPage);
      List<Map<String, Object>> list2 = boardService.boardNoticeList(searchWord,currPage);      //공지 상단 고정
      
      int totalCount = boardService.getIdeaDataCount(searchOption,searchWord);
      int beginPage = ((currPage - 1) / 5) * 5 + 1;
      int endPage = ((currPage - 1) / 5 + 1) * (5);

      if (endPage > (totalCount - 1) / 10 + 1) {
         endPage = ((totalCount - 1)) / 10 + 1;
      }
      model.addAttribute("beginPage", beginPage);
      model.addAttribute("endPage", endPage);
      model.addAttribute("totalCount", totalCount);
      model.addAttribute("currPage", currPage);
      model.addAttribute("ideaList", list);
      model.addAttribute("ideaNoticeList",list2);
      model.addAttribute("searchOption",searchOption);
      model.addAttribute("searchWord",searchWord);
      

      return "board/idea";
   }
   
   //청원글쓰기
   @RequestMapping("/idea_write.do")
   public String writeidea(Model model) {

      return "board/idea_write";
   }
   //청원글쓰기 프로세스
   @RequestMapping("/idea_write_process.do")
   public String writeideaProcess(MultipartFile[] ideaImgList, IdeaVo ideaVo, HttpSession session) {
      // Vo 객체에는 필요한 정보들을 불러낼 수 있기 때문에 사용한다.
      // session.getAttribute 는 오브젝트파일로 받기 때문에 ResiVo로 형변환 한다.
      String RootFolderName = "/var/storage/";
      Date today = new Date();
      SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd");
      String todayFolder = df.format(today);
      String SaveFolderName = RootFolderName + todayFolder;
      File SaveFolder = new File(SaveFolderName);

      if (!SaveFolder.exists()) {
         SaveFolder.mkdirs();
      }
      
      List<IdeaImgVo> IdeaImgList = new ArrayList<IdeaImgVo>();
      
      for (MultipartFile file : ideaImgList) {
         if (file.getSize() <= 0) {
            continue;
         }
         // 파일명 랜덤 이름
         String SaveFileTitle = UUID.randomUUID().toString();
         String oriFileTitle = file.getOriginalFilename();
         SaveFileTitle += "_" + System.currentTimeMillis();
         SaveFileTitle += oriFileTitle.substring(oriFileTitle.lastIndexOf("."));
         String SaveRealPath = SaveFolderName + "/" + SaveFileTitle;

         try {
            file.transferTo(new File(SaveRealPath));
         } catch (IOException e) {
            e.printStackTrace();
         }

         // DB에 담을 Vo객체를 생성
         IdeaImgVo ideaImgVo = new IdeaImgVo();
         ideaImgVo.setIdea_img_title(todayFolder + "/" + SaveFileTitle);
         ideaImgVo.setIdea_img_path(SaveRealPath);
         IdeaImgList.add(ideaImgVo);
      }
      
      MemberVo memberVo = (MemberVo) session.getAttribute("sessionUser");
      ideaVo.setMember_no(memberVo.getMember_no());
      boardService.writeIdea(ideaVo, IdeaImgList);

      return "redirect:./idea.do";
   }

   //청원글읽기
   @RequestMapping("/idea_read.do")
   public String readidea(int idea_no, Model model, IdeaLikeVo ideaLikeVo, HttpServletRequest request, HttpServletResponse response,
         @RequestParam(value = "currPage", required = false, defaultValue = "1") int currPage) {
      
      //쿠키 이용 조회수 중복 방지
      boolean isRead = false;
      
      Cookie[] cookies = request.getCookies();
      
      for(Cookie cookie : cookies) {
         String name = cookie.getName();
         if(name.startsWith("read_idea_no")) {
            int no = Integer.parseInt(name.substring(name.indexOf("|")+1));
            
            if(no == idea_no) {
               isRead = true;
            }
         }
      }
      
      Cookie cookie = new Cookie("read_idea_no|"+idea_no , "xxxxx");
      response.addCookie(cookie);
      
      if(!isRead) {
         boardService.updateIdeaReadCount(idea_no);
      }
      y="read";
      Map<String, Object> map = boardService.viewIdea(idea_no, y);
      
      model.addAttribute("readIdea", map);
      model.addAttribute("currPage", currPage);

      return "board/idea_read";
   }
   
   //글삭제
   @RequestMapping("/idea_delete_process.do")
   public String deleteIdea(IdeaVo ideaVo, HttpSession session) {

      boardService.deleteIdea(ideaVo, session);

      return "redirect:./idea.do";
   }

   // 글수정
   @RequestMapping("/idea_change.do")
   public String changeIdea(int idea_no, Model model, 
         @RequestParam(value = "currPage", required = false, defaultValue = "1") int currPage) {
      y=null;
      model.addAttribute("readIdea", boardService.viewIdea(idea_no, y));
      model.addAttribute("currPage", currPage);

      return "board/idea_change";
   }
   @RequestMapping("/idea_change_process.do")
   public String updateIdeaProcess(IdeaVo ideaVo) {
      boardService.changeIdea(ideaVo);
      return "redirect:./idea.do";
   }
   
   //청원글답변달기
   @RequestMapping("/idea_answer.do")
   public String answerIdea(IdeaVo ideaVo, Model model, HttpSession session) {
      
      if(session.getAttribute("sessionUser") == null) {
         return "board/board_fail";
      }
      y=null;
      model.addAttribute("readIdea", boardService.viewIdea(ideaVo.getIdea_no(), y));

      return "board/idea_answer";
   }
   @RequestMapping("/idea_answer_process.do")
   public String answerIdeaProcess(IdeaVo ideaVo, HttpSession session) {
      
      MemberVo memberVo = (MemberVo) session.getAttribute("sessionUser");
      //AdminVo adminVo = (AdminVo)session.getAttribute("sessionAdmin");
      
      ideaVo.setMember_no(memberVo.getMember_no());
      //ideaVo.setAdmin_no(adminVo.getAdmin_no());
      
      boardService.answerIdea(ideaVo, session);

      return "redirect:./idea.do";
   }
   
}