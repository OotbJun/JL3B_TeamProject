package com.jl3b.touche_nubes.votevo;

public class VoteVo {
	
	private int vote_no;
	private int resi_no;
	private int candy_no;
	private int election_round;
	
	public VoteVo() {
		super();
	}

	public VoteVo(int vote_no, int resi_no, int candy_no, int election_round) {
		super();
		this.vote_no = vote_no;
		this.resi_no = resi_no;
		this.candy_no = candy_no;
		this.election_round = election_round;
	}

	public int getVote_no() {
		return vote_no;
	}

	public void setVote_no(int vote_no) {
		this.vote_no = vote_no;
	}

	public int getResi_no() {
		return resi_no;
	}

	public void setResi_no(int resi_no) {
		this.resi_no = resi_no;
	}

	public int getCandy_no() {
		return candy_no;
	}

	public void setCandy_no(int candy_no) {
		this.candy_no = candy_no;
	}

	public int getElection_round() {
		return election_round;
	}

	public void setElection_round(int election_round) {
		this.election_round = election_round;
	}

}
