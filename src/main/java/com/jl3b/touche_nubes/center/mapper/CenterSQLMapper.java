package com.jl3b.touche_nubes.center.mapper;


import java.util.List;
import java.util.Map;

import com.jl3b.touche_nubes.centervo.ReserveVo;
import com.jl3b.touche_nubes.centervo.CenterReviewVo;
import com.jl3b.touche_nubes.centervo.LessonVo;
import com.jl3b.touche_nubes.centervo.LessonInfoVo;
import com.jl3b.touche_nubes.membervo.CenterVo;

public interface CenterSQLMapper {
	
	//클래스 정보
	public int createCenterKey();									//파일업로드용
	public CenterVo selectCenterInfoByNo(int center_no);			//센터 보기
	public List<CenterVo> selectCenterInfoAll();					//센터 리스트
	

	//센터 리뷰
	public void insertCenterReview(CenterReviewVo centerReviewVo);		//클래스 리뷰 등록
	public void updateCenterReview(CenterReviewVo centerReviewVo);		//클래스 리뷰 수정
	public void deleteCenterReview(int review_no);						//클래스 리뷰 삭제
	public CenterReviewVo selectCenterReviewByNo(int review_no);		//클래스 리뷰 보기
	public List<CenterReviewVo> selectCenterReviewAll(int center_no);	//클래스 리뷰 전체보기
	
	//예약
	public void insertReserve(ReserveVo reserveVo);						//프로그램 예약하기
	public void deleteReserve(ReserveVo reserveVo);						//예약 취소
	public List<ReserveVo> readmember(int lesson_no);					//예약자 확인		
	public int countbyReserve(int lesson_no);							//예약자 수 확인selectReserverCount
	public ReserveVo checkReserve(ReserveVo reserveVo);					//예약 체크
	public List<ReserveVo> readlesson(int member_no);					//예약내역 확인
	
	//강의 정보
	public void insertlessonInfo(LessonInfoVo lessonInfoVo);			//강의 정보 등록
	public LessonInfoVo selectlessonInfoByNo(int no);					//정보확인
	public List<LessonInfoVo> selectInfo(int no);
	public LessonInfoVo selectLessonInfoByCenterNo(int center_no);		//센터 넘버로 뽑기
	
	//강의
	public void insertlesson(LessonVo LessonVo);						//시간대 등록
	public int createKey();												//가상 키 생성
	public List<LessonVo> selectList(int no);							//센터 강의목록 노출
	public void updateHorsehead(LessonVo lessonVo);						//말머리 수정
	public void deleteHorsehead(LessonVo lessonVo);						//말머리 마감->예약
	public void deleteLesson(int lesson_no);							//강의 삭제
	
	public int horsePeople(int no);										//lesson_people 수 조회
	
	
	
	///////////테스트
	public List<ReserveVo> reserveMember(int lesson_no);
	public String resultHorsehead(int lesson_no);
	//public String infoTitle(int lesson_no);
	public List<Map<String, Object>> reviewList(int center_no);			//리뷰 출력 뭔가 될듯
	public CenterReviewVo checkReview(CenterReviewVo centerReviewVo);
	
}
	

