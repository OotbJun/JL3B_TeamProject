package com.jl3b.touche_nubes.boardvo;

public class BoardLikeVo {
	
	private int board_like_no;
	private int board_no;
	private int resi_no;
	private String board_like;
	
	public BoardLikeVo() {
		super();
	}
	
	public BoardLikeVo(int board_like_no, int board_no, int resi_no, String board_like) {
		super();
		this.board_like_no = board_like_no;
		this.board_no = board_no;
		this.resi_no = resi_no;
		this.board_like = board_like;
	}
	public int getBoard_like_no() {
		return board_like_no;
	}
	public void setBoard_like_no(int board_like_no) {
		this.board_like_no = board_like_no;
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
	public String getBoard_like() {
		return board_like;
	}
	public void setBoard_like(String board_like) {
		this.board_like = board_like;
	}
	
}
