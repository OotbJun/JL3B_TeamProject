package com.jl3b.touche_nubes.membervo;

public class AdminVo {
	
	private int admin_no;
	private String npki_key;
	private String admin_id;
	private String admin_pw;
	private String admin_name;
	
	public AdminVo() {
		super();
	}

	public AdminVo(int admin_no, String npki_key, String admin_id, String admin_pw, String admin_name) {
		super();
		this.admin_no = admin_no;
		this.npki_key = npki_key;
		this.admin_id = admin_id;
		this.admin_pw = admin_pw;
		this.admin_name = admin_name;
	}

	public int getAdmin_no() {
		return admin_no;
	}

	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}

	public String getNpki_key() {
		return npki_key;
	}

	public void setNpki_key(String npki_key) {
		this.npki_key = npki_key;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_pw() {
		return admin_pw;
	}

	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = admin_pw;
	}

	public String getAdmin_name() {
		return admin_name;
	}

	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
}
