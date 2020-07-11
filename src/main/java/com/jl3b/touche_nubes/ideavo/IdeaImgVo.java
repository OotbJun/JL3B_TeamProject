package com.jl3b.touche_nubes.ideavo;

import java.util.Date;

public class IdeaImgVo {

	private int idea_img_no;
	private int idea_no;
	private String idea_img_title;
	private String idea_img_path;
	private Date idea_img_udate;

	public IdeaImgVo() {
		super();
	}

	public IdeaImgVo(int idea_img_no, int idea_no, String idea_img_title, String idea_img_path, Date idea_img_udate) {
		super();
		this.idea_img_no = idea_img_no;
		this.idea_no = idea_no;
		this.idea_img_title = idea_img_title;
		this.idea_img_path = idea_img_path;
		this.idea_img_udate = idea_img_udate;
	}

	public int getIdea_img_no() {
		return idea_img_no;
	}

	public void setIdea_img_no(int idea_img_no) {
		this.idea_img_no = idea_img_no;
	}

	public int getIdea_no() {
		return idea_no;
	}

	public void setIdea_no(int idea_no) {
		this.idea_no = idea_no;
	}

	public String getIdea_img_title() {
		return idea_img_title;
	}

	public void setIdea_img_title(String idea_img_title) {
		this.idea_img_title = idea_img_title;
	}

	public String getIdea_img_path() {
		return idea_img_path;
	}

	public void setIdea_img_path(String idea_img_path) {
		this.idea_img_path = idea_img_path;
	}

	public Date getIdea_img_udate() {
		return idea_img_udate;
	}

	public void setIdea_img_udate(Date idea_img_udate) {
		this.idea_img_udate = idea_img_udate;
	}

}
