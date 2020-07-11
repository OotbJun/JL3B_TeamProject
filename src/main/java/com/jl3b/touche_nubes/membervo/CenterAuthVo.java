package com.jl3b.touche_nubes.membervo;

public class CenterAuthVo {
	
	private int center_auth_no;
	private int center_no;
	private String center_auth_certification;
	private String center_auth_key;
	
	public CenterAuthVo() {
		super();
	}

	public CenterAuthVo(int center_auth_no, int center_no, String center_auth_certification, String center_auth_key) {
		super();
		this.center_auth_no = center_auth_no;
		this.center_no = center_no;
		this.center_auth_certification = center_auth_certification;
		this.center_auth_key = center_auth_key;
	}

	public int getCenter_auth_no() {
		return center_auth_no;
	}

	public void setCenter_auth_no(int center_auth_no) {
		this.center_auth_no = center_auth_no;
	}

	public int getCenter_no() {
		return center_no;
	}

	public void setCenter_no(int center_no) {
		this.center_no = center_no;
	}

	public String getCenter_auth_certification() {
		return center_auth_certification;
	}

	public void setCenter_auth_certification(String center_auth_certification) {
		this.center_auth_certification = center_auth_certification;
	}

	public String getCenter_auth_key() {
		return center_auth_key;
	}

	public void setCenter_auth_key(String center_auth_key) {
		this.center_auth_key = center_auth_key;
	}
}	
