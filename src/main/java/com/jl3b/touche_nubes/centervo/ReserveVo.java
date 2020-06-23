package com.jl3b.touche_nubes.centervo;

import java.util.Date;

public class ReserveVo {

	private int reserve_no;
	private int member_no;
	private int prog_no;
	private Date reserve_date;

	public ReserveVo() {
		super();
	}

	public ReserveVo(int reserve_no, int member_no, int prog_no, Date reserve_date) {
		super();
		this.reserve_no = reserve_no;
		this.member_no = member_no;
		this.prog_no = prog_no;
		this.reserve_date = reserve_date;
	}

	public int getreserve_no() {
		return reserve_no;
	}

	public void setreserve_no(int reserve_no) {
		this.reserve_no = reserve_no;
	}

	public int getmember_no() {
		return member_no;
	}

	public void setmember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getProg_no() {
		return prog_no;
	}

	public void setProg_no(int prog_no) {
		this.prog_no = prog_no;
	}

	public Date getreserve_date() {
		return reserve_date;
	}

	public void setreserve_date(Date reserve_date) {
		this.reserve_date = reserve_date;
	}
}
