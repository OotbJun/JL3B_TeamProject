package com.jl3b.touche_nubes.centervo;



public class LessonInfoVo {

	private int info_no;
	private int center_no;
	private String info_title;
	private String info_content;
	

	public LessonInfoVo() {
		super();
	}

	public LessonInfoVo(int info_no, int center_no, String info_title, String info_content) {
		super();
		this.info_no = info_no;
		this.center_no = center_no;
		this.info_title = info_title;
		this.info_content = info_content;
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

	public String getInfo_title() {
		return info_title;
	}

	public void setInfo_title(String info_title) {
		this.info_title = info_title;
	}

	public String getInfo_content() {
		return info_content;
	}

	public void setInfo_content(String info_content) {
		this.info_content = info_content;
	}
}
