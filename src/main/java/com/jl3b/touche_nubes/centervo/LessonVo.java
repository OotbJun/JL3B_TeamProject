package com.jl3b.touche_nubes.centervo;

import java.util.Date;

public class LessonVo {
	
	private int lesson_no;
	private int info_no;
	private Date lesson_date;
	private String lesson_time;
	private int lesson_people;
	private String lesson_horsehead;
	
	public LessonVo() {
		super();
	}

	public LessonVo(int lesson_no, int info_no, Date lesson_date, String lesson_time, int lesson_people,
			String lesson_horsehead) {
		super();
		this.lesson_no = lesson_no;
		this.info_no = info_no;
		this.lesson_date = lesson_date;
		this.lesson_time = lesson_time;
		this.lesson_people = lesson_people;
		this.lesson_horsehead = lesson_horsehead;
	}

	public int getLesson_no() {
		return lesson_no;
	}

	public void setLesson_no(int lesson_no) {
		this.lesson_no = lesson_no;
	}

	public int getInfo_no() {
		return info_no;
	}

	public void setInfo_no(int info_no) {
		this.info_no = info_no;
	}

	public Date getLesson_date() {
		return lesson_date;
	}

	public void setLesson_date(Date lesson_date) {
		this.lesson_date = lesson_date;
	}

	public String getLesson_time() {
		return lesson_time;
	}

	public void setLesson_time(String lesson_time) {
		this.lesson_time = lesson_time;
	}

	public int getLesson_people() {
		return lesson_people;
	}

	public void setLesson_people(int lesson_people) {
		this.lesson_people = lesson_people;
	}

	public String getLesson_horsehead() {
		return lesson_horsehead;
	}

	public void setLesson_horsehead(String lesson_horsehead) {
		this.lesson_horsehead = lesson_horsehead;
	}
}
