package com.jl3b.touche_nubes.membervo;

import java.util.Date;

public class CenterVo {
	
	private int center_no;
	private String npki_key;
	private String center_id;
	private String center_pw;
	private String center_name;
	private String center_mail;
	private String center_pr;
	private String center_about;
	private Date center_jdate;

	
	public CenterVo() {
		super();
	}

	public CenterVo(int center_no, String npki_key, String center_id, String center_pw, String center_name,
			String center_mail, String center_pr, String center_about, Date center_jdate) {
		super();
		this.center_no = center_no;
		this.npki_key = npki_key;
		this.center_id = center_id;
		this.center_pw = center_pw;
		this.center_name = center_name;
		this.center_mail = center_mail;
		this.center_pr = center_pr;
		this.center_about = center_about;
		this.center_jdate = center_jdate;
	}

	public int getCenter_no() {
		return center_no;
	}

	public void setCenter_no(int center_no) {
		this.center_no = center_no;
	}

	public String getNpki_key() {
		return npki_key;
	}

	public void setNpki_key(String npki_key) {
		this.npki_key = npki_key;
	}

	public String getCenter_id() {
		return center_id;
	}

	public void setCenter_id(String center_id) {
		this.center_id = center_id;
	}

	public String getCenter_pw() {
		return center_pw;
	}

	public void setCenter_pw(String center_pw) {
		this.center_pw = center_pw;
	}

	public String getCenter_name() {
		return center_name;
	}

	public void setCenter_name(String center_name) {
		this.center_name = center_name;
	}

	public String getCenter_mail() {
		return center_mail;
	}

	public void setCenter_mail(String center_mail) {
		this.center_mail = center_mail;
	}

	public String getCenter_pr() {
		return center_pr;
	}

	public void setCenter_pr(String center_pr) {
		this.center_pr = center_pr;
	}

	public String getCenter_about() {
		return center_about;
	}

	public void setCenter_about(String center_about) {
		this.center_about = center_about;
	}

	public Date getCenter_jdate() {
		return center_jdate;
	}

	public void setCenter_jdate(Date center_jdate) {
		this.center_jdate = center_jdate;
	}
	
}
