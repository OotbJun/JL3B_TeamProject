package com.jl3b.touche_nubes.centervo;

public class CenterInfoVo {

	private int info_no;
	private int center_no;
	private String info_pr;
	private String info_about;

	public CenterInfoVo() {
		super();
	}

	public CenterInfoVo(int info_no, int center_no, String info_pr, String info_about) {
		super();
		this.info_no = info_no;
		this.center_no = center_no;
		this.info_pr = info_pr;
		this.info_about = info_about;
	}

	public int getInfo_no() {
		return info_no;
	}

	public void setInfo_no(int info_no) {
		this.info_no = info_no;
	}

	public int getCenter_no() {
		return center_no;
	}

	public void setCenter_no(int center_no) {
		this.center_no = center_no;
	}

	public String getInfo_pr() {
		return info_pr;
	}

	public void setInfo_pr(String info_pr) {
		this.info_pr = info_pr;
	}

	public String getInfo_about() {
		return info_about;
	}

	public void setInfo_about(String info_about) {
		this.info_about = info_about;
	}
}
