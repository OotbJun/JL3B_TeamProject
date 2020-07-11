package com.jl3b.touche_nubes.votevo;

import java.util.Date;

public class CandyImgVo {
	
	private int candy_img_no;
	private int candy_no;
	private String candy_img_title;
	private String candy_img_path;
	private Date candy_img_udate;
	
	public CandyImgVo() {
		super();
	}

	public CandyImgVo(int candy_img_no, int candy_no, String candy_img_title, String candy_img_path,
			Date candy_img_udate) {
		super();
		this.candy_img_no = candy_img_no;
		this.candy_no = candy_no;
		this.candy_img_title = candy_img_title;
		this.candy_img_path = candy_img_path;
		this.candy_img_udate = candy_img_udate;
	}

	public int getCandy_img_no() {
		return candy_img_no;
	}

	public void setCandy_img_no(int candy_img_no) {
		this.candy_img_no = candy_img_no;
	}

	public int getCandy_no() {
		return candy_no;
	}

	public void setCandy_no(int candy_no) {
		this.candy_no = candy_no;
	}

	public String getCandy_img_title() {
		return candy_img_title;
	}

	public void setCandy_img_title(String candy_img_title) {
		this.candy_img_title = candy_img_title;
	}

	public String getCandy_img_path() {
		return candy_img_path;
	}

	public void setCandy_img_path(String candy_img_path) {
		this.candy_img_path = candy_img_path;
	}

	public Date getCandy_img_udate() {
		return candy_img_udate;
	}

	public void setCandy_img_udate(Date candy_img_udate) {
		this.candy_img_udate = candy_img_udate;
	}
	
}
