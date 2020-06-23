package com.jl3b.touche_nubes.ideavo;

import java.util.Date;

public class IdeaVo {
	
	private int idea_no;
	private int member_no;
	private int idea_gr_no;
	private String horsehead_sort;
	private String idea_title;
	private String idea_content;
	private int idea_hits;
	private Date idea_wdate;
	
	public IdeaVo() {
		super();
	}
	
	public IdeaVo(int idea_no, int member_no, int idea_gr_no, String horsehead_sort, String idea_title,
			String idea_content, int idea_hits, Date idea_wdate) {
		super();
		this.idea_no = idea_no;
		this.member_no = member_no;
		this.idea_gr_no = idea_gr_no;
		this.horsehead_sort = horsehead_sort;
		this.idea_title = idea_title;
		this.idea_content = idea_content;
		this.idea_hits = idea_hits;
		this.idea_wdate = idea_wdate;
	}
	
	public int getIdea_no() {
		return idea_no;
	}
	public void setIdea_no(int idea_no) {
		this.idea_no = idea_no;
	}
	public int getmember_no() {
		return member_no;
	}
	public void setmember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getIdea_gr_no() {
		return idea_gr_no;
	}
	public void setIdea_gr_no(int idea_gr_no) {
		this.idea_gr_no = idea_gr_no;
	}
	public String getHorsehead_sort() {
		return horsehead_sort;
	}
	public void setHorsehead_sort(String horsehead_sort) {
		this.horsehead_sort = horsehead_sort;
	}
	public String getIdea_title() {
		return idea_title;
	}
	public void setIdea_title(String idea_title) {
		this.idea_title = idea_title;
	}
	public String getIdea_content() {
		return idea_content;
	}
	public void setIdea_content(String idea_content) {
		this.idea_content = idea_content;
	}
	public int getIdea_hits() {
		return idea_hits;
	}
	public void setIdea_hits(int idea_hits) {
		this.idea_hits = idea_hits;
	}
	public Date getIdea_wdate() {
		return idea_wdate;
	}
	public void setIdea_wdate(Date idea_wdate) {
		this.idea_wdate = idea_wdate;
	}
	
}
