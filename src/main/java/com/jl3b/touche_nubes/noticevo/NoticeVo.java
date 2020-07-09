package com.jl3b.touche_nubes.noticevo;

import java.util.Date;

public class NoticeVo {

	private int notice_no;
	private int admin_no;
	private int member_no;
	private String horsehead_sort;
	private String notice_title;
	private String notice_content;
	private int notice_hits;
	private Date notice_wdate;

	public NoticeVo() {
		super();
	}

	public NoticeVo(int notice_no, int admin_no, int member_no, String horsehead_sort, String notice_title,
			String notice_content, int notice_hits, Date notice_wdate) {
		super();
		this.notice_no = notice_no;
		this.admin_no = admin_no;
		this.member_no = member_no;
		this.horsehead_sort = horsehead_sort;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_hits = notice_hits;
		this.notice_wdate = notice_wdate;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public int getAdmin_no() {
		return admin_no;
	}

	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getHorsehead_sort() {
		return horsehead_sort;
	}

	public void setHorsehead_sort(String horsehead_sort) {
		this.horsehead_sort = horsehead_sort;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public int getNotice_hits() {
		return notice_hits;
	}

	public void setNotice_hits(int notice_hits) {
		this.notice_hits = notice_hits;
	}

	public Date getNotice_wdate() {
		return notice_wdate;
	}

	public void setNotice_wdate(Date notice_wdate) {
		this.notice_wdate = notice_wdate;
	}
}
