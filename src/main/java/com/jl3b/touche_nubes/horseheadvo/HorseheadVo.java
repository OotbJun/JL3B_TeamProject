package com.jl3b.touche_nubes.horseheadvo;

public class HorseheadVo {

	private int horsehead_no;
	private String horsehead_sort;
	private String horsehead_title;

	public HorseheadVo() {
		super();
	}

	public HorseheadVo(int horsehead_no, String horsehead_sort, String horsehead_title) {
		super();
		this.horsehead_no = horsehead_no;
		this.horsehead_sort = horsehead_sort;
		this.horsehead_title = horsehead_title;
	}

	public int getHorsehead_no() {
		return horsehead_no;
	}

	public void setHorsehead_no(int horsehead_no) {
		this.horsehead_no = horsehead_no;
	}

	public String getHorsehead_sort() {
		return horsehead_sort;
	}

	public void setHorsehead_sort(String horsehead_sort) {
		this.horsehead_sort = horsehead_sort;
	}

	public String getHorsehead_title() {
		return horsehead_title;
	}

	public void setHorsehead_title(String horsehead_title) {
		this.horsehead_title = horsehead_title;
	}

}
