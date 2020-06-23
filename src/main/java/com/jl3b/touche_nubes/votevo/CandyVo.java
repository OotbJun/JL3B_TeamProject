package com.jl3b.touche_nubes.votevo;

public class CandyVo {
	
	private int candy_no;
	private int member_no;
	private int election_round;
	private String candy_intro;
	private String candy_content;
	
	public CandyVo() {
		super();
	}

	public CandyVo(int candy_no, int member_no, int election_round, String candy_intro, String candy_content) {
		super();
		this.candy_no = candy_no;
		this.member_no = member_no;
		this.election_round = election_round;
		this.candy_intro = candy_intro;
		this.candy_content = candy_content;
	}

	public int getCandy_no() {
		return candy_no;
	}

	public void setCandy_no(int candy_no) {
		this.candy_no = candy_no;
	}

	public int getmember_no() {
		return member_no;
	}

	public void setmember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getElection_round() {
		return election_round;
	}

	public void setElection_round(int election_round) {
		this.election_round = election_round;
	}

	public String getCandy_intro() {
		return candy_intro;
	}

	public void setCandy_intro(String candy_intro) {
		this.candy_intro = candy_intro;
	}

	public String getCandy_content() {
		return candy_content;
	}

	public void setCandy_content(String candy_content) {
		this.candy_content = candy_content;
	}
	
}
