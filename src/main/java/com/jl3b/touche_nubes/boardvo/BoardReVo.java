package com.jl3b.touche_nubes.boardvo;

import java.util.Date;

public class BoardReVo {
	
	private int board_re_no;
	private int board_no;
	private int member_no;
	private String board_re_content;
	private Date board_re_wdate;
	
	public BoardReVo() {
		super();
	}
	
	public BoardReVo(int board_re_no, int board_no, int member_no, String board_re_content, Date board_re_wdate) {
		super();
		this.board_re_no = board_re_no;
		this.board_no = board_no;
		this.member_no = member_no;
		this.board_re_content = board_re_content;
		this.board_re_wdate = board_re_wdate;
	}
	
	public int getBoard_re_no() {
		return board_re_no;
	}
	public void setBoard_re_no(int board_re_no) {
		this.board_re_no = board_re_no;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getBoard_re_content() {
		return board_re_content;
	}
	public void setBoard_re_content(String board_re_content) {
		this.board_re_content = board_re_content;
	}
	public Date getBoard_re_wdate() {
		return board_re_wdate;
	}
	public void setBoard_re_wdate(Date board_re_wdate) {
		this.board_re_wdate = board_re_wdate;
	}
	
	
}
