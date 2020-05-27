package com.jl3b.touche_nubes.classvo;

import java.util.Date;

public class DayClassVo {

	private int dayclass_no;
	private int class_info_no;
	private String horsehead_sort;
	private String dayclass_title;
	private String dayclass_content;
	private int dayclass_seat;
	private int dayclass_fee;
	private Date dayclass_wdate;

	public DayClassVo() {
		super();
	}

	public DayClassVo(int dayclass_no, int class_info_no, String horsehead_sort, String dayclass_title,
			String dayclass_content, int dayclass_seat, int dayclass_fee, Date dayclass_wdate) {
		super();
		this.dayclass_no = dayclass_no;
		this.class_info_no = class_info_no;
		this.horsehead_sort = horsehead_sort;
		this.dayclass_title = dayclass_title;
		this.dayclass_content = dayclass_content;
		this.dayclass_seat = dayclass_seat;
		this.dayclass_fee = dayclass_fee;
		this.dayclass_wdate = dayclass_wdate;
	}

	public int getDayclass_no() {
		return dayclass_no;
	}

	public void setDayclass_no(int dayclass_no) {
		this.dayclass_no = dayclass_no;
	}

	public int getClass_info_no() {
		return class_info_no;
	}

	public void setClass_info_no(int class_info_no) {
		this.class_info_no = class_info_no;
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

	public int getDayclass_fee() {
		return dayclass_fee;
	}

	public void setDayclass_fee(int dayclass_fee) {
		this.dayclass_fee = dayclass_fee;
	}

	public Date getDayclass_wdate() {
		return dayclass_wdate;
	}

	public void setDayclass_wdate(Date dayclass_wdate) {
		this.dayclass_wdate = dayclass_wdate;
	}

}
