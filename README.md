# JL3B_TeamProject
스프링으로 진행한 최종 웹 팀프로젝트(Touche Nubes) : WAS(아파트 웹사이트)




07/09




1. 스타트데이트 오늘 날짜로

2. 예약 지난 날짜 출력 안됨

3. 클래스 정보 리스트로 출력(info_title, info_content)

4. 센터 리스트 페이지 수정

5. 센터 상세 페이지 수정

--센터 강의<br>
DROP TABLE JL3B_lesson;<br>
CREATE TABLE JL3B_lesson(<br>
   LESSON_NO NUMBER(7) PRIMARY KEY,<br>
   INFO_NO NUMBER(7),<br>
   LESSON_DATE DATE,<br>
   LESSON_TIME VARCHAR2(30),<br>
   LESSON_PEOPLE NUMBER(3),<br>
   LESSON_HORSEHEAD VARCHAR2(20),<br>
   CENTER_NO NUMBER(7)<br>
);<br>
DROP SEQUENCE JL3B_lesson_SEQ;<br>
CREATE SEQUENCE JL3B_lesson_SEQ;<br>
