# JL3B_TeamProject
스프링으로 진행한 최종 웹 팀프로젝트(Touche Nubes) : WAS(아파트 웹사이트)




06/24



1. 마이페이지

2. 비밀번호 확인 -> 정보 변경

3. 비밀번호 변경 -> 아직 안됨.

4. 비밀번호 찾기 -> 메일로 임시 비밀번호 발급

5. 관리자 페이지 -> 매퍼, 서비스, 컨트롤러까지 완성(jsp 필요함)

6. 게시판 뷰 줄바꿈 가능

7. jsp 전면 수정

8. 예약 관련 테이블, vo 수정

--레슨 정보<br>
DROP TABLE JL3B_lessonInfo;<br>
CREATE TABLE JL3B_lessonInfo(<br>
    INFO_NO NUMBER(7) PRIMARY KEY,<br>
    CENTER_NO NUMBER(7) NOT NULL,<br>
    INFO_TITLE VARCHAR2(50) NOT NULL,<br>
    INFO_CONTENT VARCHAR2(1000) NOT NULL<br>
);<br>
DROP SEQUENCE  JL3B_lessonInfo_seq;<br>
CREATE SEQUENCE  JL3B_lessonInfo_seq;<br>
<br>

--프로그램 예약<br>
DROP TABLE JL3B_RESERVE;<br>
CREATE TABLE  JL3B_RESERVE(<br>
    RESERVE_NO NUMBER(7) PRIMARY KEY,<br>
    MEMBER_NO NUMBER(7) NOT NULL,<br>
    LESSON_NO NUMBER(7) NOT NULL<br>
);<br>
DROP SEQUENCE JL3B_RESERVE_SEQ;<br>
CREATE SEQUENCE JL3B_RESERVE_SEQ;<br>
<br>

--레슨<br>
DROP TABLE JL3B_lesson;<br>
CREATE TABLE JL3B_lesson(<br>
   LESSON_NO NUMBER(7) PRIMARY KEY,<br>
   INFO_NO NUMBER(7),<br>
   LESSON_DATE DATE,<br>
   LESSON_TIME VARCHAR2(30),<br>
   LESSON_PEOPLE NUMBER(3),<br>
   LESSON_HORSEHEAD VARCHAR2(20)<br>
);<br>
DROP SEQUENCE JL3B_lesson_SEQ;<br>
CREATE SEQUENCE JL3B_lesson_SEQ;<br>
