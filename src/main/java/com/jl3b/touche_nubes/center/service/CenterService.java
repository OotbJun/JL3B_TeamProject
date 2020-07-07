package com.jl3b.touche_nubes.center.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jl3b.touche_nubes.boardvo.BoardImgVo;
import com.jl3b.touche_nubes.center.mapper.CenterImgSQLMapper;
import com.jl3b.touche_nubes.center.mapper.CenterSQLMapper;
import com.jl3b.touche_nubes.centervo.CenterImgVo;
import com.jl3b.touche_nubes.centervo.CenterReviewVo;
import com.jl3b.touche_nubes.centervo.LessonInfoVo;
import com.jl3b.touche_nubes.centervo.LessonVo;
import com.jl3b.touche_nubes.centervo.ReserveVo;
import com.jl3b.touche_nubes.member.mapper.MemberSQLMapper;
import com.jl3b.touche_nubes.membervo.CenterVo;
import com.jl3b.touche_nubes.membervo.MemberVo;

@Service
public class CenterService {
	
	@Autowired
	private CenterSQLMapper centerSQLMapper;
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	@Autowired
	private CenterImgSQLMapper centerImgSQLMapper;
	
	
	//센터 정보 등록
//	public void writeCenterInfo(CenterInfoVo centerInfoVo, List<CenterImgVo> centerImgList) {
//
//		int centerInfoKey = centerSQLMapper.createCenterInfoKey();		//파일 업로드용 시퀀스 미리 생성
//		centerInfoVo.setInfo_no(centerInfoKey);
//		
//		centerSQLMapper.insertCenterInfo(centerInfoVo);
//		
//		for(CenterImgVo centerImgVo : centerImgList) {					//파일 업로드
//			centerImgVo.setInfo_no(centerInfoKey);
//			centerImgSQLMapper.insertCenterInfoImg(centerImgVo);
//		}
//	}
	
	//센터 정보 수정
//	public void modifyCenterInfo(CenterInfoVo centerInfoVo) {
//		centerSQLMapper.updateCenterInfo(centerInfoVo);
//	}
	
	//센터 정보 삭제
//	public void eraseCenterInfo(int info_no) {
//		centerSQLMapper.deleteCenterInfo(info_no);
//	}
	
	//센터 정보 상세보기
	public Map<String, Object> viewCenterInfo(int center_no) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		CenterVo centerVo = memberSQLMapper.selectCenterByNo(center_no);						//센터 pr, about
		List<CenterImgVo> centerImgList = centerImgSQLMapper.selectCenterImgAll(center_no);		//이미지 리스트
		CenterImgVo centerImgVo = centerImgSQLMapper.selectCenterImg(center_no);
		
		map.put("centerVo", centerVo);
		map.put("centerImgList", centerImgList);
		map.put("centerImgVo", centerImgVo);
		
		return map;
	}
	
	//센터 정보 상세보기 - 강의 목록
	public List<Map<String,Object>> viewLessonList(int center_no){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		
		List<LessonVo> lessonList = centerSQLMapper.selectList(center_no);	
		for(LessonVo lessonVo : lessonList) {
			CenterVo centerVo = memberSQLMapper.selectCenterByNo(center_no);
			LessonInfoVo lessonInfoVo = centerSQLMapper.selectlessonInfoByNo(lessonVo.getInfo_no());
			
			Map<String,Object> map = new HashMap<String,Object>();
			
			int people = centerSQLMapper.coutbyReserve(lessonVo.getLesson_no());
			
			map.put("lessonInfoVo", lessonInfoVo);
			map.put("centerVo", centerVo);
			map.put("lessonVo", lessonVo);
			map.put("people", people);
			
			list.add(map);
			}
		return list;
	}
	
	//센터 리뷰 페이지
	public List<Map<String, Object>> viewReviewList(int center_no) {

		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<CenterReviewVo> reviewList = centerSQLMapper.selectCenterReviewAll(center_no);
		
		
		for(CenterReviewVo centerReviewVo : reviewList) {
			MemberVo memberVo = memberSQLMapper.selectMemberByNo(centerReviewVo.getMember_no());
			
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("memberVo", memberVo);
			map.put("centerReviewVo", centerReviewVo);
			
			list.add(map);
		}
		return list;
	}
	
	//센터 이미지 업로드
	public void uploadCenterImg(List<CenterImgVo> centerImgList) {
		
		for(CenterImgVo centerImgVo : centerImgList) {
			centerImgSQLMapper.insertCenterInfoImg(centerImgVo);
		}
	}
	
	//센터 리스트
	public List<Map<String, Object>> centerList() {
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<CenterVo> centerList = centerSQLMapper.selectCenterInfoAll();
		
		for(CenterVo centerVo : centerList) {

			CenterImgVo centerImgList = centerImgSQLMapper.selectCenterImg(centerVo.getCenter_no());			//이미지 리스트 ㄴㄴ 그냥 vo로
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("centerVo", centerVo);
			map.put("centerImgList", centerImgList);
			
			list.add(map);
		}
		return list;
	}
	
	//센터 정보 불러오기
	public CenterVo getCenter(int center_no) {
		return centerSQLMapper.selectCenterInfoByNo(center_no);
	}
	
	///////////////////리뷰
	public void writeReview(CenterReviewVo centerReviewVo) {
		centerSQLMapper.insertCenterReview(centerReviewVo);
	}
	
	//강의 등록
	public void writeLesson(LessonInfoVo lessonInfoVo, Date [] lesson_date, String [] lesson_time, int[] lesson_people) {	//하나의 info에 여러개의 lesson을 넣으려고 lesson table 컬럼 값들을 하나씩 다 받아와줌
		 
		int lessonKey = centerSQLMapper.createKey();	//동시에 두 테이블에 insert해야 해서 미리 sequence값을 생성해서 set시켜줌
		lessonInfoVo.setInfo_no(lessonKey);	
		centerSQLMapper.insertlessonInfo(lessonInfoVo);	//우선 info table을 생성
		
		int count = lesson_date.length;	//배열을 돌리기 위해 변수값 중 아무거나 하나를 길이로 설정해줌
		
		for(int i = 0 ; i < count ; i++) {	
			
			LessonVo lessonVo = new LessonVo();	//값들을 받아줄 lessonVo 객체 생성
			lessonVo.setInfo_no(lessonKey);	//위에서 만들어준 lessonkey를 setting
			
			lessonVo.setLesson_date(lesson_date[i]);
			lessonVo.setLesson_time(lesson_time[i]);
			lessonVo.setLesson_people(lesson_people[i]);	//i번만큼 값을 돌려줌
			
			centerSQLMapper.insertlesson(lessonVo);	//lessonVo에 생성
			
		}
			
	}
	
	
	//말머리 바꾸기
	public void updateHorsehead(int lesson_people) {
		centerSQLMapper.updateHorsehead(lesson_people);
	}
	
	//예약
		public void create(ReserveVo ReserveVo) {	
			centerSQLMapper.insertReserve(ReserveVo);
		}
		
		//예약 취소
		public void delete(ReserveVo ReserveVo) {		
			centerSQLMapper.deleteReserve(ReserveVo);
		}
			
		//예약자 수 확인
		public int countbyReserve(int lesson_no) {
			return centerSQLMapper.coutbyReserve(lesson_no);
		}
		
		//예약자 조회
		public List<ReserveVo> readmember(int lesson_no) {
			return centerSQLMapper.readmember(lesson_no);		
		}
		
		//예약 게시물 조회
		public List<ReserveVo> readlesson(int member_no) {
			return centerSQLMapper.readlesson(member_no);
		}
		
		//예약 있는지 체크
		public ReserveVo check(ReserveVo ReserveVo) {
			return centerSQLMapper.checkReserve(ReserveVo);
		}

	
	
}
