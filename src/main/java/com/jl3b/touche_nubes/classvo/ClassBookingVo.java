package com.jl3b.touche_nubes.classvo;

public class ClassBookingVo {

	private int booking_no;
	private int resi_no;
	private int dayclass_no;

	public ClassBookingVo() {
		super();
	}

	public ClassBookingVo(int booking_no, int resi_no, int dayclass_no) {
		super();
		this.booking_no = booking_no;
		this.resi_no = resi_no;
		this.dayclass_no = dayclass_no;
	}

	public int getBooking_no() {
		return booking_no;
	}

	public void setBooking_no(int booking_no) {
		this.booking_no = booking_no;
	}

	public int getResi_no() {
		return resi_no;
	}

	public void setResi_no(int resi_no) {
		this.resi_no = resi_no;
	}

	public int getDayclass_no() {
		return dayclass_no;
	}

	public void setDayclass_no(int dayclass_no) {
		this.dayclass_no = dayclass_no;
	}

}
