package com.jl3b.touche_nubes.membervo;

import java.util.Date;

public class ResiVo {
	
	private int resi_no;
	private String npki_key;
	private String resi_id;
	private String resi_pw;
	private String resi_rname;
	private String resi_mail;
	private int resi_grade;
	private int resi_point;
	private Date resi_jdate;
	
	public ResiVo() {
		super();
	}

	public ResiVo(int resi_no, String npki_key, String resi_id, String resi_pw, String resi_rname, String resi_mail,
			int resi_grade, int resi_point, Date resi_jdate) {
		super();
		this.resi_no = resi_no;
		this.npki_key = npki_key;
		this.resi_id = resi_id;
		this.resi_pw = resi_pw;
		this.resi_rname = resi_rname;
		this.resi_mail = resi_mail;
		this.resi_grade = resi_grade;
		this.resi_point = resi_point;
		this.resi_jdate = resi_jdate;
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

	public int getResi_grade() {
		return resi_grade;
	}

	public void setResi_grade(int resi_grade) {
		this.resi_grade = resi_grade;
	}

	public int getResi_point() {
		return resi_point;
	}

	public void setResi_point(int resi_point) {
		this.resi_point = resi_point;
	}

	public Date getResi_jdate() {
		return resi_jdate;
	}

	public void setResi_jdate(Date resi_jdate) {
		this.resi_jdate = resi_jdate;
	}
	
}
