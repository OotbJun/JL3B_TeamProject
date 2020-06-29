# JL3B_TeamProject
스프링으로 진행한 최종 웹 팀프로젝트(Touche Nubes) : WAS(아파트 웹사이트)




06/29




1. 일단 센터 예약 글쓰기 스크립트 부분 대충 끝낸듯

2. 관리자 페이지 쪼끔 수정(작성자 안나오는 거)

3. 각 게시판 스크립트 안 먹히게 막음

4. 자게 댓글 삭제(관리자)

5. 채팅 대충 도전중..


--채팅<br>
DROP TABLE JL3B_CHAT;<br>
CREATE TABLE JL3B_CHAT(<br>
	CHAT_NO NUMBER(7) PRIMARY KEY,<br>
	MEMBER_NO NUMBER(7),<br>
	CHAT_CONTENT VARCHAR2(2000),<br>
	CHAT_DATE DATE<br>
);<br>
DROP SEQUENCE JL3B_CHAT_SEQ;<br>
CREATE SEQUENCE JL3B_CHAT_SEQ;<br>
