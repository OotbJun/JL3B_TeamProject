package com.jl3b.touche_nubes.centervo;

import java.util.Date;

public class ProgVo {

	private int prog_no;
	private int center_no;
	private String horsehead_sort;
	private String prog_title;
	private String prog_content;
	

	public ProgVo() {
		super();
	}

	public ProgVo(int prog_no, int center_no, String horsehead_sort, String prog_title, String prog_content) {
		super();
		this.prog_no = prog_no;
		this.center_no = center_no;
		this.horsehead_sort = horsehead_sort;
		this.prog_title = prog_title;
		this.prog_content = prog_content;
	}

	public int getProg_no() {
		return prog_no;
	}

	public void setProg_no(int prog_no) {
		this.prog_no = prog_no;
	}

	public int getCenter_no() {
		return center_no;
	}

	public void setCenter_no(int center_no) {
		this.center_no = center_no;
	}

	public String getHorsehead_sort() {
		return horsehead_sort;
	}

	public void setHorsehead_sort(String horsehead_sort) {
		this.horsehead_sort = horsehead_sort;
	}

	public String getProg_title() {
		return prog_title;
	}

	public void setProg_title(String prog_title) {
		this.prog_title = prog_title;
	}

	public String getProg_content() {
		return prog_content;
	}

	public void setProg_content(String prog_content) {
		this.prog_content = prog_content;
	}
}
