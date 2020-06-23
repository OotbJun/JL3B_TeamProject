package com.jl3b.touche_nubes.centervo;

import java.util.Date;

public class CenterReviewVo {

	private int review_no;
	private int center_no;
	private int member_no;
	private String review_comment;
	private Date review_wdate;

	public CenterReviewVo() {
		super();
	}

	public CenterReviewVo(int review_no, int center_no, int member_no, String review_comment, Date review_wdate) {
		super();
		this.review_no = review_no;
		this.center_no = center_no;
		this.member_no = member_no;
		this.review_comment = review_comment;
		this.review_wdate = review_wdate;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public int getCenter_no() {
		return center_no;
	}

	public void setCenter_no(int center_no) {
		this.center_no = center_no;
	}

	public int getmember_no() {
		return member_no;
	}

	public void setmember_no(int member_no) {
		this.member_no = member_no;
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
