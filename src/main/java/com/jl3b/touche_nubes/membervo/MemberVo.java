package com.jl3b.touche_nubes.membervo;

import java.util.Date;

public class MemberVo {
	
	private int member_no;
	private String npki_key;
	private String member_id;
	private String member_pw;
	private String member_rname;
	private String member_mail;
	private int member_grade;
	private int member_point;
	private Date member_jdate;
	
	public MemberVo() {
		super();
	}

	public MemberVo(int member_no, String npki_key, String member_id, String member_pw, String member_rname, String member_mail,
			int member_grade, int member_point, Date member_jdate) {
		super();
		this.member_no = member_no;
		this.npki_key = npki_key;
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_rname = member_rname;
		this.member_mail = member_mail;
		this.member_grade = member_grade;
		this.member_point = member_point;
		this.member_jdate = member_jdate;
	}

	public int getmember_no() {
		return member_no;
	}

	public void setmember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getNpki_key() {
		return npki_key;
	}

	public void setNpki_key(String npki_key) {
		this.npki_key = npki_key;
	}

	public String getmember_id() {
		return member_id;
	}

	public void setmember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getmember_pw() {
		return member_pw;
	}

	public void setmember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getmember_rname() {
		return member_rname;
	}

	public void setmember_rname(String member_rname) {
		this.member_rname = member_rname;
	}

	public String getmember_mail() {
		return member_mail;
	}

	public void setmember_mail(String member_mail) {
		this.member_mail = member_mail;
	}

	public int getmember_grade() {
		return member_grade;
	}

	public void setmember_grade(int member_grade) {
		this.member_grade = member_grade;
	}

	public int getmember_point() {
		return member_point;
	}

	public void setmember_point(int member_point) {
		this.member_point = member_point;
	}

	public Date getmember_jdate() {
		return member_jdate;
	}

	public void setmember_jdate(Date member_jdate) {
		this.member_jdate = member_jdate;
	}
	
}
