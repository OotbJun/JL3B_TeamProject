# JL3B_TeamProject
스프링으로 진행한 최종 웹 팀프로젝트(Touche Nubes) : WAS(아파트 웹사이트)



06/22



1. 센터로그인 선거탭 접근 제한

2. 입주민, 센터 회원 아이디찾기, 비밀번호 변경 등 쿼리

3. 뒷페이지에 있는 글 읽고, 목록으로 누르면 그 페이지에 머물러 있어야 하는데 1페이지로 가는 현상 고침

4. 로그인 페이지 - 입주민, 센터 선택해서 로그인

5. 입주민, 센터 회원가입 알림 다시 수정

6. 센터 상세보기 페이지(pr, about, 리뷰 출력)

7. 센터 리뷰 작성

8. 아이디 찾기

9. 비밀번호 암호화

10. 각 게시판 수정, 삭제 버튼 url 안뜨게, 그리고 주소창으로 들어가도 안되게 예외처리

11. 인증 테이블 추가<br>
--인증<br>
DROP TABLE JL3B_RESI_Auth;<br>
CREATE TABLE JL3B_RESI_Auth( <br>
auth_no NUMBER(8) PRIMARY KEY,<br>
resi_no NUMBER(8), <br>
auth_certification VARCHAR2(4),<br>
auth_key VARCHAR2(100) );<br>
DROP SEQUENCE JL3B_RESI_Auth_seq;<br>
CREATE SEQUENCE JL3B_RESI_Auth_seq;<br>

12. 모든 페이지 반응형으로

13. 센터 이미지 업로드

14. 일단 센터 이미지 출력도 되긴 함.
