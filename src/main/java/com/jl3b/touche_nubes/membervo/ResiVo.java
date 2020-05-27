package com.jl3b.touche_nubes.membervo;

import java.util.Date;

public class ResiVo {
	
	private int resi_no;
	private String npki_key;
	private String resi_id;
	private String resi_pw;
	private String resi_rname;
	private String resi_mail;
	private int grade;
	private int point;
	private Date jdate;
	
	public ResiVo() {
		super();
	}

	public ResiVo(int resi_no, String npki_key, String resi_id, String resi_pw, String resi_rname, String resi_mail,
			int grade, int point, Date jdate) {
		super();
		this.resi_no = resi_no;
		this.npki_key = npki_key;
		this.resi_id = resi_id;
		this.resi_pw = resi_pw;
		this.resi_rname = resi_rname;
		this.resi_mail = resi_mail;
		this.grade = grade;
		this.point = point;
		this.jdate = jdate;
	}

	public int getResi_no() {
		return resi_no;
	}

	public void setResi_no(int resi_no) {
		this.resi_no = resi_no;
	}

	public String getNpki_key() {
		return npki_key;
	}

	public void setNpki_key(String npki_key) {
		this.npki_key = npki_key;
	}

	public String getResi_id() {
		return resi_id;
	}

	public void setResi_id(String resi_id) {
		this.resi_id = resi_id;
	}

	public String getResi_pw() {
		return resi_pw;
	}

	public void setResi_pw(String resi_pw) {
		this.resi_pw = resi_pw;
	}

	public String getResi_rname() {
		return resi_rname;
	}

	public void setResi_rname(String resi_rname) {
		this.resi_rname = resi_rname;
	}

	public String getResi_mail() {
		return resi_mail;
	}

	public void setResi_mail(String resi_mail) {
		this.resi_mail = resi_mail;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getJdate() {
		return jdate;
	}

	public void setJdate(Date jdate) {
		this.jdate = jdate;
	}
	
	
}
