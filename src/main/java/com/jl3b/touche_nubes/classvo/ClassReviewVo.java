package com.jl3b.touche_nubes.classvo;

import java.util.Date;

public class ClassReviewVo {

	private int review_no;
	private int dayclass_no;
	private int resi_no;
	private String review_comment;
	private Date review_wdate;

	public ClassReviewVo() {
		super();
	}

	public ClassReviewVo(int review_no, int dayclass_no, int resi_no, String review_comment, Date review_wdate) {
		super();
		this.review_no = review_no;
		this.dayclass_no = dayclass_no;
		this.resi_no = resi_no;
		this.review_comment = review_comment;
		this.review_wdate = review_wdate;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public int getDayclass_no() {
		return dayclass_no;
	}

	public void setDayclass_no(int dayclass_no) {
		this.dayclass_no = dayclass_no;
	}

	public int getResi_no() {
		return resi_no;
	}

	public void setResi_no(int resi_no) {
		this.resi_no = resi_no;
	}

	public String getReview_comment() {
		return review_comment;
	}

	public void setReview_comment(String review_comment) {
		this.review_comment = review_comment;
	}

	public Date getReview_wdate() {
		return review_wdate;
	}

	public void setReview_wdate(Date review_wdate) {
		this.review_wdate = review_wdate;
	}
}
