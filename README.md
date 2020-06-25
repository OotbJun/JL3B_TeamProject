# JL3B_TeamProject
스프링으로 진행한 최종 웹 팀프로젝트(Touche Nubes) : WAS(아파트 웹사이트)




06/25



1. 청원에 답변에 답변 못하게끔 버튼 없앰

2. 비밀번호 변경 -> 비밀번호 자릿수 제한

3. jsp 최소 글자수 채워야 글 등록됨

4. 단순 글읽기 , 글 수정 시 내용 불러오기 할 때 <br>태그 처리하기
------> 보드 서비스 메소드는 수정완료
------> 찬용이꺼 합칠때, 보드 컨트롤러. 어드민컨트롤러 최상단 변수 선언된 것 유지
	+ 글읽기, 글수정 메소드 내에 있는 view~ 에 변수 y 넣어주는 코드 유지

private String y = null;
- 공지사항 수정
model.addAttribute("readNotice", boardService.viewNotice(notice_no, y));
- 공지사항 보기
  y="read";
      Map<String, Object> map = boardService.viewNotice(notice_no, y);

-자게 글보기
 y="read";
      Map<String, Object> map = boardService.viewBoard(board_no, session,y);
-자게 글수정
 model.addAttribute("readBoard", boardService.viewBoard(board_no, session, y));

-청원글보기
 y="read";
      Map<String, Object> map = boardService.viewIdea(idea_no,y);
-청원글수정
 model.addAttribute("readIdea", boardService.viewIdea(idea_no,y));

5. 자게 게시글 삭제 -> 컨펌으로

6. 자게 글쓰기 -> 컨펌

7. 자게 글수정 -> 컨펌

8. 관리자 페이지 다수

9. 센터 가입시 이미지 하나만 올라가게

10. 비밀번호 변경 가능
