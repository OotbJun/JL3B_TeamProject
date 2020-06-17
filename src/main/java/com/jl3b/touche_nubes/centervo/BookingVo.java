package com.jl3b.touche_nubes.centervo;

import java.util.Date;

public class BookingVo {

	private int booking_no;
	private int resi_no;
	private int prog_no;
	private Date booking_date;

	public BookingVo() {
		super();
	}

	public BookingVo(int booking_no, int resi_no, int prog_no, Date booking_date) {
		super();
		this.booking_no = booking_no;
		this.resi_no = resi_no;
		this.prog_no = prog_no;
		this.booking_date = booking_date;
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

	public int getProg_no() {
		return prog_no;
	}

	public void setProg_no(int prog_no) {
		this.prog_no = prog_no;
	}

	public Date getBooking_date() {
		return booking_date;
	}

	public void setBooking_date(Date booking_date) {
		this.booking_date = booking_date;
	}
}
