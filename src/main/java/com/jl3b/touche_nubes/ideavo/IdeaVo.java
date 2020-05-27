package com.jl3b.touche_nubes.ideavo;

import java.util.Date;

public class IdeaVo {
	
	private int idea_no;
	private int resi_no;
	private String horsehead_sort;
	private String idea_title;
	private String idea_content;
	private int idea_hits;
	private Date idea_wdate;
	private String idea_a_title;
	private String idea_a_content;
	private int idea_a_hits;
	private Date idea_a_wdate;
	
	public IdeaVo() {
		super();
	}
	
	public IdeaVo(int idea_no, int resi_no, String horsehead_sort, String idea_title, String idea_content,
			int idea_hits, Date idea_wdate, String idea_a_title, String idea_a_content, int idea_a_hits,
			Date idea_a_wdate) {
		super();
		this.idea_no = idea_no;
		this.resi_no = resi_no;
		this.horsehead_sort = horsehead_sort;
		this.idea_title = idea_title;
		this.idea_content = idea_content;
		this.idea_hits = idea_hits;
		this.idea_wdate = idea_wdate;
		this.idea_a_title = idea_a_title;
		this.idea_a_content = idea_a_content;
		this.idea_a_hits = idea_a_hits;
		this.idea_a_wdate = idea_a_wdate;
	}
	
	public int getIdea_no() {
		return idea_no;
	}
	public void setIdea_no(int idea_no) {
		this.idea_no = idea_no;
	}
	public int getResi_no() {
		return resi_no;
	}
	public void setResi_no(int resi_no) {
		this.resi_no = resi_no;
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
	public String getIdea_a_title() {
		return idea_a_title;
	}
	public void setIdea_a_title(String idea_a_title) {
		this.idea_a_title = idea_a_title;
	}
	public String getIdea_a_content() {
		return idea_a_content;
	}
	public void setIdea_a_content(String idea_a_content) {
		this.idea_a_content = idea_a_content;
	}
	public int getIdea_a_hits() {
		return idea_a_hits;
	}
	public void setIdea_a_hits(int idea_a_hits) {
		this.idea_a_hits = idea_a_hits;
	}
	public Date getIdea_a_wdate() {
		return idea_a_wdate;
	}
	public void setIdea_a_wdate(Date idea_a_wdate) {
		this.idea_a_wdate = idea_a_wdate;
	}
	
	
}
