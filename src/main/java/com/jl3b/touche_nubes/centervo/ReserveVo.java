package com.jl3b.touche_nubes.centervo;



public class ReserveVo {

	private int reserve_no;
	private int member_no;
	private int lesson_no;

	public ReserveVo() {
		super();
	}

	public ReserveVo(int reserve_no, int member_no, int lesson_no) {
		super();
		this.reserve_no = reserve_no;
		this.member_no = member_no;
		this.lesson_no = lesson_no;
	}

	public int getReserve_no() {
		return reserve_no;
	}

	public void setReserve_no(int reserve_no) {
		this.reserve_no = reserve_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getLesson_no() {
		return lesson_no;
	}

	public void setLesson_no(int lesson_no) {
		this.lesson_no = lesson_no;
	}
}
