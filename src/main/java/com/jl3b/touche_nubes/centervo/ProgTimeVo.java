package com.jl3b.touche_nubes.centervo;

import java.util.Date;

public class ProgTimeVo {
	
	private int time_no;
	private int prog_no;
	private Date time_rdate;
	private String time_part;
	private int time_seat;
	
	public ProgTimeVo() {
		super();
	}

	public ProgTimeVo(int time_no, int prog_no, Date time_rdate, String time_part, int time_seat) {
		super();
		this.time_no = time_no;
		this.prog_no = prog_no;
		this.time_rdate = time_rdate;
		this.time_part = time_part;
		this.time_seat = time_seat;
	}

	public int getTime_no() {
		return time_no;
	}

	public void setTime_no(int time_no) {
		this.time_no = time_no;
	}

	public int getProg_no() {
		return prog_no;
	}

	public void setProg_no(int prog_no) {
		this.prog_no = prog_no;
	}

	public Date getTime_rdate() {
		return time_rdate;
	}

	public void setTime_rdate(Date time_rdate) {
		this.time_rdate = time_rdate;
	}

	public String getTime_part() {
		return time_part;
	}

	public void setTime_part(String time_part) {
		this.time_part = time_part;
	}

	public int getTime_seat() {
		return time_seat;
	}

	public void setTime_seat(int time_seat) {
		this.time_seat = time_seat;
	}
}
