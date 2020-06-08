# JL3B_TeamProject
스프링으로 진행한 최종 웹 팀프로젝트(Touche Nubes) : WAS(아파트 웹사이트)



06/08


1. vote_choice.jsp 수정

2. 테이블 구조 변경
--선거 회차<br>
DROP TABLE JL3B_ELECTION;<br>
CREATE TABLE JL3B_ELECTION(<br>
	ELECTION_ROUND NUMBER(7) PRIMARY KEY,<br>
	CANDY_NO NUMBER(7),<br>
	CANDY_STARTDATE DATE,<br>
	CANDY_ENDDATE DATE,<br>
    	VOTE_STARTDATE DATE,<br>
	VOTE_ENDDATE DATE,<br>
    	ELECTION_STATUS VARCHAR2(15)<br>
);<br>
DROP SEQUENCE JL3B_ELECTION_SEQ;<br>
CREATE SEQUENCE JL3B_ELECTION_SEQ;<br>
<br>
3. 선거 개시 스케줄링

4. 스케줄링 이용 자동 갱신(입후보기간, 투표기간) => 조건 실행

5. 투표기간 종료시 당선인 자동 수정

6. 투표기간 종료시 회원 테이블 등급 자동 수정
