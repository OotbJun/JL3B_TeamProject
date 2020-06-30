package com.jl3b.touche_nubes.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jl3b.touche_nubes.admin.service.AdminService;
import com.jl3b.touche_nubes.board.service.BoardService;
import com.jl3b.touche_nubes.boardvo.BoardImgVo;
import com.jl3b.touche_nubes.boardvo.BoardVo;
import com.jl3b.touche_nubes.ideavo.IdeaImgVo;
import com.jl3b.touche_nubes.ideavo.IdeaLikeVo;
import com.jl3b.touche_nubes.ideavo.IdeaVo;
import com.jl3b.touche_nubes.membervo.AdminVo;
import com.jl3b.touche_nubes.membervo.MemberVo;
import com.jl3b.touche_nubes.noticevo.NoticeVo;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
   
   @Autowired
   private AdminService adminService;
   @Autowired
   private BoardService boardService;
   
   private String y = null;
   
   //관리자 로그인
   @RequestMapping("/login.do")
   public String login() {
      return "admin/login";
   }
   @RequestMapping("/login_process.do")
   public String loginProcess(AdminVo adminVo, HttpSession session) {
      
      AdminVo adminData = adminService.login(adminVo);
      
      
      if(adminData == null) {
         return "./member/login_fail";
      }else {
         session.setAttribute("sessionAdmin", adminData);
         System.out.println("관리자 로그인 " + adminData.getAdmin_name());
         return "redirect:./main.do";
      }
   }
   
   //관리자 로그아웃
   @RequestMapping("/logout_process.do")
   public String logoutProcess(HttpSession session) {
      session.invalidate();
      return "redirect:./main.do";
   }
   
   //관리자 메인
   @RequestMapping("/main.do")
   public String main() {
      return "admin/main";
   }
   
   //------------------------------------------------공지사항
   //공지사항 글쓰기
   @RequestMapping("/notice_write.do")
   public String writeNotice() {
      return "admin/notice_write";
   }
   @RequestMapping("/notice_write_process.do")
   public String writeNoticeProcess(NoticeVo noticeVo, HttpSession session) {
      
      AdminVo adminVo = (AdminVo)session.getAttribute("sessionAdmin");
      noticeVo.setAdmin_no(adminVo.getAdmin_no());
      boardService.writeNotice(noticeVo);
      
      return "redirect:./notice.do";
   }
   
   //공지사항 리스트
   @RequestMapping("/notice.do")
   public String notice(Model model, String searchOption, String searchWord, HttpSession session,
         @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
      
      if(currentPage <= 0) {
         currentPage = 1;
      }
      
      List<Map<String, Object>> list = boardService.noticeList(searchOption, searchWord, currentPage);
      
      //총 게시글 수
      int totalCount = boardService.noticeSearchCount(searchOption, searchWord);
      
      //페이지 짜르는 거 할 거야
      int beginPage = ((currentPage-1) / 5) * 5 + 1;
      int endPage = ((currentPage-1)/5+1)*5;
      
      if(endPage > (totalCount-1)/10 + 1) {
         endPage = (totalCount-1)/10 + 1;
      }
      
      model.addAttribute("beginPage", beginPage);
      model.addAttribute("endPage", endPage);
      model.addAttribute("currentPage", currentPage);
      model.addAttribute("totalCount", totalCount);
      model.addAttribute("noticeList", list);
      model.addAttribute("searchWord", searchWord);
      model.addAttribute("searchOption", searchOption);
      
      return "admin/notice";
   }
   
   //공지사항 글보기
   @RequestMapping("/notice_read.do")
   public String readNotice(int notice_no, Model model, HttpServletRequest request, HttpServletResponse response,
         @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
      
      //쿠키 이용해서 조회수 중복 방지
      boolean isRead = false;                        //디폴트는 false로 세팅
      
      Cookie[] cookies = request.getCookies();         //쿠키 배열 생성
      
      for(Cookie cookie : cookies) {
         String name = cookie.getName();               //네임 변수에 담아주고
         if(name.startsWith("read_notice_no")) {         //네임이 read_notice_no로 시작된다면
            int no = Integer.parseInt(name.substring(name.indexOf("|")+1));      //파이프+1 자리부터 잘라서 변수에 담아준다.
            
            if(no == notice_no) {                  //변수가 notice_no와 같다면 트루로 변환, 즉 한번이라도 읽은 넘버는 true로
               isRead = true;
            }
         }
      }
      
      Cookie cookie = new Cookie("read_notice_no|" + notice_no, "aaaa");      //키에 notice_no 붙여주고, 값은 쓸모 없어서 대충
      response.addCookie(cookie);                                    //쿠키 추가
      
      if(!isRead) {
         boardService.updateNoticeReadCount(notice_no);                  //isRead가 false면 조회수 증가
      }
      
      y="read";
      Map<String, Object> map = boardService.viewNotice(notice_no, y);
      
      model.addAttribute("readNotice", map);
      model.addAttribute("currentPage", currentPage);
      
      return "admin/notice_read";
   }
   
   //공지사항 삭제
   @RequestMapping("notice_delete_process.do")
   public String deleteNotice(NoticeVo noticeVo, HttpSession session) {
      
      boardService.deleteNotice(noticeVo, session);
      
      return "redirect:./notice.do";
   }
   
   //공지사항 수정
   @RequestMapping("/notice_change.do")
   public String changeNotice(int notice_no, Model model, HttpSession session,
         @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
      
      model.addAttribute("readNotice", boardService.viewNotice(notice_no, y));
      model.addAttribute("currentPage", currentPage);
      
      return "admin/notice_change";
   }
   @RequestMapping("/notice_change_process.do")
   public String changeNoticeProcess(NoticeVo noticeVo, HttpSession session,
         @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
      
      boardService.changeNotice(noticeVo, session);
      
      return "redirect:/admin/notice_read.do?notice_no="+noticeVo.getNotice_no()+"&currentPage="+currentPage;
   }
   
   
   //----------------------------------------자게
   //자게 리스트
   @RequestMapping("/board.do")
   public String board(@RequestParam(defaultValue = "board_title")String searchOption, String searchWord,Model model,
            @RequestParam(value="currPage", required = false, defaultValue ="1")int currPage) {
         
      List<Map<String, Object>> list = boardService.boardList(searchOption, searchWord, currPage);      //그냥 자게
      List<Map<String, Object>> list2 = boardService.boardNoticeList(searchWord,currPage);            //상단 고정 공지
      boardService.changeHot();                                                         //인기글 업데이트
      List<Map<String, Object>> list3 = boardService.boardHotList(searchWord, currPage);               //인기글 고정
      
      
      
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
      
      return "admin/board";
   }
   
   //자게 글쓰기
   @RequestMapping("/board_write.do")
   public String writeBoard() {
      return "board/board_write";
   }
   @RequestMapping("/board_write_process.do")
   public String writeBoardProcess(MultipartFile [] boardImgList, BoardVo boardVo, HttpSession session) {
      // Vo 객체에는 필요한 정보들을 불러낼 수 있기 때문에 사용한다.
      // session.getAttribute 는 오브젝트파일로 받기 때문에 ResiVo로 형변환 한다.
      String RootFolderName = "C:/upload/";
      Date today = new Date();
      SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd");
      String todayFolder = df.format(today);
         String SaveFolderName = RootFolderName + todayFolder;
         File SaveFolder = new File (SaveFolderName);
   
         if(!SaveFolder.exists()){
            SaveFolder.mkdirs();
      
         }
         List<BoardImgVo> BoardImgList = new ArrayList<BoardImgVo>();
      
         for(MultipartFile file :boardImgList ) {
            if(file.getSize() <=0) {
               continue;
        }
            //파일명 랜덤 이름 
            String SaveFileTitle = UUID.randomUUID().toString();
            String oriFileTitle = file.getOriginalFilename();
            SaveFileTitle += "_" + System.currentTimeMillis();
            SaveFileTitle += oriFileTitle.substring(oriFileTitle.lastIndexOf("."));
            String SaveRealPath = SaveFolderName + "/" + SaveFileTitle;

            try {
         
               file.transferTo(new File(SaveRealPath));
         
            }catch(IOException e) {
               e.printStackTrace();
            }
      
            // DB에 담을 Vo객체를 생성 
            BoardImgVo boardImgVo = new BoardImgVo();
            boardImgVo.setBoard_img_title(todayFolder+"/"+SaveFileTitle);
            boardImgVo.setBoard_img_path(SaveRealPath);
            BoardImgList.add(boardImgVo);
         }
      
         AdminVo adminVo = (AdminVo)session.getAttribute("sessionAdmin");

         boardVo.setAdmin_no(adminVo.getAdmin_no());
   
         boardService.writeBoard(boardVo, BoardImgList);
   
         return "redirect:./board.do";
   }
   
   //자게 글보기
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
      Map<String, Object> map = boardService.viewBoard(board_no, session,y);
      List<Map<String, Object>> boardReplList = boardService.getReplyList(board_no);
      
      model.addAttribute("readBoard", map);
      model.addAttribute("boardReplList",boardReplList);
      model.addAttribute("currPage", currPage);
      
      return "admin/board_read";
   }
   
   //자게 글삭제
   @RequestMapping("/board_delete_process.do")
   public String deleteBoard(BoardVo boardVo, HttpSession session) {
      
      boardService.deleteBoard(boardVo, session);   
      
      return "redirect:/admin/board.do";
   }
   
   //자게 글수정
   public String changeBoard(int board_no, Model model, HttpSession session,
         @RequestParam(value="currPage", required = false, defaultValue ="1")int currPage) {
      
      model.addAttribute("readBoard", boardService.viewBoard(board_no, session, y));
      model.addAttribute("currPage", currPage);
      
      return "admin/board_change";
   }
   @RequestMapping("/board_change_process.do")
   public String updateContentProcess(BoardVo boardVo, HttpSession session,
         @RequestParam(value="currPage", required = false, defaultValue ="1")int currPage) {
      boardService.changeBoard(boardVo, session);
      return "redirect:./board_read.do?board_no="+boardVo.getBoard_no()+"&currPage="+currPage;
   }
   
   //자게 댓글 삭제
   @RequestMapping("/board_delete_re_process.do")
   public String deleteRe(int board_re_no, int board_no,
         @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
      adminService.deleteRe(board_re_no);
      
      return "redirect:/admin/board_read.do?board_no="+board_no+"&currentPage="+currentPage;
   }
   
   
   //------------------------------------------건의사항
   //건의사항 리스트
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

      return "admin/idea";
   }

   //청원글쓰기
   @RequestMapping("/idea_write.do")
   public String writeidea(Model model) {
      return "admin/idea_write";
   }
   @RequestMapping("/idea_write_process.do")
   public String writeideaProcess(MultipartFile[] ideaImgList, IdeaVo ideaVo, HttpSession session) {
      // Vo 객체에는 필요한 정보들을 불러낼 수 있기 때문에 사용한다.
      // session.getAttribute 는 오브젝트파일로 받기 때문에 ResiVo로 형변환 한다.
      String RootFolderName = "C:/upload/";
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
      
      
      AdminVo adminVo = (AdminVo)session.getAttribute("sessionAdmin");
      ideaVo.setAdmin_no(adminVo.getAdmin_no());
      boardService.writeIdea(ideaVo, IdeaImgList);

      return "redirect:./idea.do";
   }
   
   //건의사항 글보기
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
      Map<String, Object> map = boardService.viewIdea(idea_no,y);
      
      model.addAttribute("readIdea", map);
      model.addAttribute("currPage", currPage);

      return "admin/idea_read";
   }

   //건의사항 글삭제
   @RequestMapping("/idea_delete_process.do")
   public String deleteIdea(IdeaVo ideaVo, HttpSession session) {

      boardService.deleteIdea(ideaVo, session);

      return "redirect:./idea.do";
   }
   
   //건의사항 글수정
   @RequestMapping("/idea_change.do")
   public String changeIdea(int idea_no, Model model, 
         @RequestParam(value = "currPage", required = false, defaultValue = "1") int currPage) {

      model.addAttribute("readIdea", boardService.viewIdea(idea_no,y));
      model.addAttribute("currPage", currPage);

      return "admin/idea_change";
   }
   @RequestMapping("/idea_change_process.do")
   public String updateIdeaProcess(IdeaVo ideaVo) {
      boardService.changeIdea(ideaVo);
      return "redirect:./idea.do";
   }
   
   //청원글답변달기
   @RequestMapping("/idea_answer.do")
   public String answerIdea(IdeaVo ideaVo, Model model, HttpSession session) {
      
      if(session.getAttribute("sessionAdmin") == null) {
         return "board/board_fail";
      }
      
      model.addAttribute("readIdea", boardService.viewIdea(ideaVo.getIdea_no(),y));

      return "admin/idea_answer";
   }
   @RequestMapping("/idea_answer_process.do")
   public String answerIdeaProcess(IdeaVo ideaVo, HttpSession session) {
      
      AdminVo adminVo = (AdminVo)session.getAttribute("sessionAdmin");
      ideaVo.setAdmin_no(adminVo.getAdmin_no());
      boardService.answerIdea(ideaVo, session);

      return "redirect:./idea.do";
   }


}