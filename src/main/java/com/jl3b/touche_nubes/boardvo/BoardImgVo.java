package com.jl3b.touche_nubes.boardvo;

import java.util.Date;

public class BoardImgVo {
	
	private int board_img_no;
	private int board_no;
	private String board_img_title;
	private String board_img_path;
	private Date board_img_udate;
	
	public BoardImgVo() {
		super();
	}
	
	public BoardImgVo(int board_img_no, int board_no, String board_img_title, String board_img_path,
			Date board_img_udate) {
		super();
		this.board_img_no = board_img_no;
		this.board_no = board_no;
		this.board_img_title = board_img_title;
		this.board_img_path = board_img_path;
		this.board_img_udate = board_img_udate;
	}
	public int getBoard_img_no() {
		return board_img_no;
	}
	public void setBoard_img_no(int board_img_no) {
		this.board_img_no = board_img_no;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getBoard_img_title() {
		return board_img_title;
	}
	public void setBoard_img_title(String board_img_title) {
		this.board_img_title = board_img_title;
	}
	public String getBoard_img_path() {
		return board_img_path;
	}
	public void setBoard_img_path(String board_img_path) {
		this.board_img_path = board_img_path;
	}
	public Date getBoard_img_udate() {
		return board_img_udate;
	}
	public void setBoard_img_udate(Date board_img_udate) {
		this.board_img_udate = board_img_udate;
	}
	
}
