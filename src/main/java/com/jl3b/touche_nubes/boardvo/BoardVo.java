package com.jl3b.touche_nubes.boardvo;

import java.util.Date;

public class BoardVo {
	
	private int board_no;
	private int resi_no;
	private String horsehead_sort;
	private String board_title;
	private String board_content;
	private int board_hits;
	private Date board_wdate;
	
	public BoardVo() {
		super();
	}
	
	public BoardVo(int board_no, int resi_no, String horsehead_sort, String board_title, String board_content,
			int board_hits, Date board_wdate) {
		super();
		this.board_no = board_no;
		this.resi_no = resi_no;
		this.horsehead_sort = horsehead_sort;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_hits = board_hits;
		this.board_wdate = board_wdate;
	}
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
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
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public int getBoard_hits() {
		return board_hits;
	}
	public void setBoard_hits(int board_hits) {
		this.board_hits = board_hits;
	}
	public Date getBoard_wdate() {
		return board_wdate;
	}
	public void setBoard_wdate(Date board_wdate) {
		this.board_wdate = board_wdate;
	}
	
	
}
