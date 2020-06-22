package com.jl3b.touche_nubes.membervo;

public class ResiAuthVo {
	
	private int auth_no;
	private int resi_no;
	private String auth_certification;
	private String auth_key;
	public ResiAuthVo() {
		super();
	}
	public ResiAuthVo(int auth_no, int resi_no, String auth_certification, String auth_key) {
		super();
		this.auth_no = auth_no;
		this.resi_no = resi_no;
		this.auth_certification = auth_certification;
		this.auth_key = auth_key;
	}
	public int getAuth_no() {
		return auth_no;
	}
	public void setAuth_no(int auth_no) {
		this.auth_no = auth_no;
	}
	public int getResi_no() {
		return resi_no;
	}
	public void setResi_no(int resi_no) {
		this.resi_no = resi_no;
	}
	public String getAuth_certification() {
		return auth_certification;
	}
	public void setAuth_certification(String auth_certification) {
		this.auth_certification = auth_certification;
	}
	public String getAuth_key() {
		return auth_key;
	}
	public void setAuth_key(String auth_key) {
		this.auth_key = auth_key;
	}
}
