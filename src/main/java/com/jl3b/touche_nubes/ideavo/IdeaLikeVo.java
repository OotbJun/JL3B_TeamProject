package com.jl3b.touche_nubes.ideavo;

public class IdeaLikeVo {

	private int idea_like_no;
	private int resi_no;
	private int idea_no;
	private String idea_like;

	public IdeaLikeVo() {
		super();
	}

	public IdeaLikeVo(int idea_like_no, int resi_no, int idea_no, String idea_like) {
		super();
		this.idea_like_no = idea_like_no;
		this.resi_no = resi_no;
		this.idea_no = idea_no;
		this.idea_like = idea_like;
	}

	public int getIdea_like_no() {
		return idea_like_no;
	}

	public void setIdea_like_no(int idea_like_no) {
		this.idea_like_no = idea_like_no;
	}

	public int getResi_no() {
		return resi_no;
	}

	public void setResi_no(int resi_no) {
		this.resi_no = resi_no;
	}

	public int getIdea_no() {
		return idea_no;
	}

	public void setIdea_no(int idea_no) {
		this.idea_no = idea_no;
	}

	public String getIdea_like() {
		return idea_like;
	}

	public void setIdea_like(String idea_like) {
		this.idea_like = idea_like;
	}

}
