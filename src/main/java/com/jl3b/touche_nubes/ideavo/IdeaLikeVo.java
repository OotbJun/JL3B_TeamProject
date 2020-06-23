package com.jl3b.touche_nubes.ideavo;

public class IdeaLikeVo {

	private int idea_like_no;
	private int member_no;
	private int idea_no;
	private String idea_like;

	public IdeaLikeVo() {
		super();
	}

	public IdeaLikeVo(int idea_like_no, int member_no, int idea_no, String idea_like) {
		super();
		this.idea_like_no = idea_like_no;
		this.member_no = member_no;
		this.idea_no = idea_no;
		this.idea_like = idea_like;
	}

	public int getIdea_like_no() {
		return idea_like_no;
	}

	public void setIdea_like_no(int idea_like_no) {
		this.idea_like_no = idea_like_no;
	}

	public int getmember_no() {
		return member_no;
	}

	public void setmember_no(int member_no) {
		this.member_no = member_no;
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
