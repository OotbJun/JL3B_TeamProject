package com.jl3b.touche_nubes.membervo;

import java.util.Date;

public class LogVo {
	
	private int log_no;
	private int resi_no;
	private Date log_ldate;
	
	public LogVo() {
		super();
	}
	
	public LogVo(int log_no, int resi_no, Date log_ldate) {
		super();
		this.log_no = log_no;
		this.resi_no = resi_no;
		this.log_ldate = log_ldate;
	}
	public int getLog_no() {
		return log_no;
	}
	public void setLog_no(int log_no) {
		this.log_no = log_no;
	}
	public int getResi_no() {
		return resi_no;
	}
	public void setResi_no(int resi_no) {
		this.resi_no = resi_no;
	}
	public Date getLog_ldate() {
		return log_ldate;
	}
	public void setLog_ldate(Date log_ldate) {
		this.log_ldate = log_ldate;
	}
	
	
}
