package com.jl3b.touche_nubes.centervo;

import java.util.Date;

public class CenterImgVo {
	
	private int center_img_no;
	private int center_no;
	private String center_img_title;
	private String center_img_path;
	private Date center_img_udate;
	
	public CenterImgVo() {
		super();
	}

	public CenterImgVo(int center_img_no, int center_no, String center_img_title, String center_img_path,
			Date center_img_udate) {
		super();
		this.center_img_no = center_img_no;
		this.center_no = center_no;
		this.center_img_title = center_img_title;
		this.center_img_path = center_img_path;
		this.center_img_udate = center_img_udate;
	}

	public int getCenter_img_no() {
		return center_img_no;
	}

	public void setCenter_img_no(int center_img_no) {
		this.center_img_no = center_img_no;
	}

	public int getCenter_no() {
		return center_no;
	}

	public void setCenter_no(int center_no) {
		this.center_no = center_no;
	}

	public String getCenter_img_title() {
		return center_img_title;
	}

	public void setCenter_img_title(String center_img_title) {
		this.center_img_title = center_img_title;
	}

	public String getCenter_img_path() {
		return center_img_path;
	}

	public void setCenter_img_path(String center_img_path) {
		this.center_img_path = center_img_path;
	}

	public Date getCenter_img_udate() {
		return center_img_udate;
	}

	public void setCenter_img_udate(Date center_img_udate) {
		this.center_img_udate = center_img_udate;
	}
}
