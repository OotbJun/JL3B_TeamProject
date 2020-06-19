# JL3B_TeamProject
스프링으로 진행한 최종 웹 팀프로젝트(Touche Nubes) : WAS(아파트 웹사이트)




06/19



1. CenterInfoVo 삭제

2. CenterVo 수정(info랑 합침)

3. info관련 쿼리 싹 다 변경

4. 센터 가입

5. 센터 초이스 페이지 없애고 바로 리스트로

--센터<br>
DROP TABLE JL3B_CENTER;<br>
CREATE TABLE JL3B_CENTER(<br>
    CENTER_NO NUMBER(7) PRIMARY KEY,<br>
    NPKI_KEY VARCHAR2(20),<br>
    CENTER_ID VARCHAR2(30) NOT NULL,<br>
    CENTER_PW VARCHAR2(20) NOT NULL,<br>
    CENTER_NAME VARCHAR2(30),<br>
    CENTER_MAIL VARCHAR2(50),<br>
    CENTER_PR VARCHAR2(100),<br>
    CENTER_ABOUT VARCHAR2(4000),<br>
    CENTER_JDATE DATE<br>
);<br>
DROP SEQUENCE JL3B_CENTER_SEQ;<br>
CREATE SEQUENCE JL3B_CENTER_SEQ;<br>
<br>
