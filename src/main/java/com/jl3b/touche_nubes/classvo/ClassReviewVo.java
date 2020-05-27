package com.jl3b.touche_nubes.classvo;

import java.util.Date;

public class ClassReviewVo {

	private int class_review_no;
	private int class_info_no;
	private int resi_no;
	private String review_title;
	private String review_content;
	private int review_star;
	private Date review_wdate;

	public ClassReviewVo() {
		super();
	}

	public ClassReviewVo(int class_review_no, int class_info_no, int resi_no, String review_title,
			String review_content, int review_star, Date review_wdate) {
		super();
		this.class_review_no = class_review_no;
		this.class_info_no = class_info_no;
		this.resi_no = resi_no;
		this.review_title = review_title;
		this.review_content = review_content;
		this.review_star = review_star;
		this.review_wdate = review_wdate;
	}

	public int getClass_review_no() {
		return class_review_no;
	}

	public void setClass_review_no(int class_review_no) {
		this.class_review_no = class_review_no;
	}

	public int getClass_info_no() {
		return class_info_no;
	}

	public void setClass_info_no(int class_info_no) {
		this.class_info_no = class_info_no;
	}

	public int getResi_no() {
		return resi_no;
	}

	public void setResi_no(int resi_no) {
		this.resi_no = resi_no;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public int getReview_star() {
		return review_star;
	}

	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}

	public Date getReview_wdate() {
		return review_wdate;
	}

	public void setReview_wdate(Date review_wdate) {
		this.review_wdate = review_wdate;
	}

}
