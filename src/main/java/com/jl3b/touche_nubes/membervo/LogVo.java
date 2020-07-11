package com.jl3b.touche_nubes.membervo;

import java.util.Date;

public class LogVo {
	
	private int log_no;
	private int member_no;
	private Date log_ldate;
	
	public LogVo() {
		super();
	}
	
	public LogVo(int log_no, int member_no, Date log_ldate) {
		super();
		this.log_no = log_no;
		this.member_no = member_no;
		this.log_ldate = log_ldate;
	}
	public int getLog_no() {
		return log_no;
	}
	public void setLog_no(int log_no) {
		this.log_no = log_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public Date getLog_ldate() {
		return log_ldate;
	}
	public void setLog_ldate(Date log_ldate) {
		this.log_ldate = log_ldate;
	}
	
	
}
