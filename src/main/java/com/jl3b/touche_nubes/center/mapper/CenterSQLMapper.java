package com.jl3b.touche_nubes.center.mapper;

import java.util.List;

import com.jl3b.touche_nubes.centervo.BookingVo;
import com.jl3b.touche_nubes.centervo.CenterReviewVo;
import com.jl3b.touche_nubes.centervo.ProgTimeVo;
import com.jl3b.touche_nubes.centervo.ProgVo;
import com.jl3b.touche_nubes.membervo.CenterVo;

public interface CenterSQLMapper {
	
	//클래스 정보
	public int createCenterKey();									//파일업로드용
	public CenterVo selectCenterInfoByNo(int center_no);			//센터 보기
	public List<CenterVo> selectCenterInfoAll();					//센터 리스트
//	public void insertCenterInfo(CenterInfoVo centerInfoVo);		//클래스 정보 등록
//	public void updateCenterInfo(CenterInfoVo centerInfoVo);		//클래스 정보 수정
//	public void deleteCenterInfo(int info_no);						//클래스 정보 삭제
	
	//클래스 후기
	public void insertCenterReview(CenterReviewVo centerReviewVo);		//클래스 리뷰 등록
	public void updateCenterReview(CenterReviewVo centerReviewVo);		//클래스 리뷰 수정
	public void deleteCenterReview(int review_no);						//클래스 리뷰 삭제
	public CenterReviewVo selectCenterReviewByNo(int review_no);		//클래스 리뷰 보기
	public List<CenterReviewVo> selectCenterReviewAll(int center_no);	//클래스 리뷰 전체보기
	
	//예약
	public void insertBooking(BookingVo bookingVo);					//프로그램 예약하기
	public void deleteBooking(int booking_no);						//예약 취소
	public BookingVo selectBookingByResi(int resi_no);				//예약 조회(본인이 예약했던 내역)			
	public int selectBookingCount(int prog_no);						//인원 수 조회(예약 마감 활성화)
	
	//프로그램
	public void insertProg(ProgVo progVo);							//프로그램 등록
	public void updateProg(ProgVo progVo);							//프로그램 수정
	public void deleteProg(int prog_no);							//프로그램 삭제
	
	//프로그램 시간대
	public void insertTime(ProgTimeVo progTimeVo);					//시간대 등록
	public void minusSeat();										//예약되면 인원수 차감
	
}
