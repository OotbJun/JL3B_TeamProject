package com.jl3b.touche_nubes.classvo;

public class DayClassTimeVo {

	private int dayclass_time_no;
	private int dayclass_no;
	private String dayclass_time_zone;

	public DayClassTimeVo() {
		super();
	}

	public DayClassTimeVo(int dayclass_time_no, int dayclass_no, String dayclass_time_zone) {
		super();
		this.dayclass_time_no = dayclass_time_no;
		this.dayclass_no = dayclass_no;
		this.dayclass_time_zone = dayclass_time_zone;
	}

	public int getDayclass_time_no() {
		return dayclass_time_no;
	}

	public void setDayclass_time_no(int dayclass_time_no) {
		this.dayclass_time_no = dayclass_time_no;
	}

	public int getDayclass_no() {
		return dayclass_no;
	}

	public void setDayclass_no(int dayclass_no) {
		this.dayclass_no = dayclass_no;
	}

	public String getDayclass_time_zone() {
		return dayclass_time_zone;
	}

	public void setDayclass_time_zone(String dayclass_time_zone) {
		this.dayclass_time_zone = dayclass_time_zone;
	}

}
