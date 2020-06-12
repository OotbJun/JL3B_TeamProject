package com.jl3b.touche_nubes.classvo;

import java.util.Date;

public class DayClassVo {

	private int dayclass_no;
	private int teacher_no;
	private String horsehead_sort;
	private String dayclass_title;
	private String dayclass_content;
	private int dayclass_seat;
	private Date dayclass_rdate;
	private Date dayclass_startdate;
	private Date dayclass_enddate;
	private String dayclass_status;

	public DayClassVo() {
		super();
	}

	public DayClassVo(int dayclass_no, int teacher_no, String horsehead_sort, String dayclass_title,
			String dayclass_content, int dayclass_seat, Date dayclass_rdate, Date dayclass_startdate,
			Date dayclass_enddate, String dayclass_status) {
		super();
		this.dayclass_no = dayclass_no;
		this.teacher_no = teacher_no;
		this.horsehead_sort = horsehead_sort;
		this.dayclass_title = dayclass_title;
		this.dayclass_content = dayclass_content;
		this.dayclass_seat = dayclass_seat;
		this.dayclass_rdate = dayclass_rdate;
		this.dayclass_startdate = dayclass_startdate;
		this.dayclass_enddate = dayclass_enddate;
		this.dayclass_status = dayclass_status;
	}

	public int getDayclass_no() {
		return dayclass_no;
	}

	public void setDayclass_no(int dayclass_no) {
		this.dayclass_no = dayclass_no;
	}

	public int getTeacher_no() {
		return teacher_no;
	}

	public void setTeacher_no(int teacher_no) {
		this.teacher_no = teacher_no;
	}

	public String getHorsehead_sort() {
		return horsehead_sort;
	}

	public void setHorsehead_sort(String horsehead_sort) {
		this.horsehead_sort = horsehead_sort;
	}

	public String getDayclass_title() {
		return dayclass_title;
	}

	public void setDayclass_title(String dayclass_title) {
		this.dayclass_title = dayclass_title;
	}

	public String getDayclass_content() {
		return dayclass_content;
	}

	public void setDayclass_content(String dayclass_content) {
		this.dayclass_content = dayclass_content;
	}

	public int getDayclass_seat() {
		return dayclass_seat;
	}

	public void setDayclass_seat(int dayclass_seat) {
		this.dayclass_seat = dayclass_seat;
	}

	public Date getDayclass_rdate() {
		return dayclass_rdate;
	}

	public void setDayclass_rdate(Date dayclass_rdate) {
		this.dayclass_rdate = dayclass_rdate;
	}

	public Date getDayclass_startdate() {
		return dayclass_startdate;
	}

	public void setDayclass_startdate(Date dayclass_startdate) {
		this.dayclass_startdate = dayclass_startdate;
	}

	public Date getDayclass_enddate() {
		return dayclass_enddate;
	}

	public void setDayclass_enddate(Date dayclass_enddate) {
		this.dayclass_enddate = dayclass_enddate;
	}

	public String getDayclass_status() {
		return dayclass_status;
	}

	public void setDayclass_status(String dayclass_status) {
		this.dayclass_status = dayclass_status;
	}
}
