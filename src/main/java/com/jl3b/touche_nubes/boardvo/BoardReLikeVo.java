package com.jl3b.touche_nubes.boardvo;

public class BoardReLikeVo {
	
	private int re_like_no;
	private int board_re_no;
	private int resi_no;
	private String re_like;

	public BoardReLikeVo() {
		super();
	}
	
	public BoardReLikeVo(int re_like_no, int board_re_no, int resi_no, String re_like) {
		super();
		this.re_like_no = re_like_no;
		this.board_re_no = board_re_no;
		this.resi_no = resi_no;
		this.re_like = re_like;
	}
	public int getRe_like_no() {
		return re_like_no;
	}
	public void setRe_like_no(int re_like_no) {
		this.re_like_no = re_like_no;
	}
	public int getBoard_re_no() {
		return board_re_no;
	}
	public void setBoard_re_no(int board_re_no) {
		this.board_re_no = board_re_no;
	}
	public int getResi_no() {
		return resi_no;
	}
	public void setResi_no(int resi_no) {
		this.resi_no = resi_no;
	}
	public String getRe_like() {
		return re_like;
	}
	public void setRe_like(String re_like) {
		this.re_like = re_like;
	}
	
	
}
