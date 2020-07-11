package com.jl3b.touche_nubes.votevo;

import java.util.Date;

public class ElectionVo {
	
	private int election_round;
	private int candy_no;
	private Date candy_startdate;
	private Date candy_enddate;
	private Date vote_startdate;
	private Date vote_enddate;
	private String election_status;
	
	public ElectionVo() {
		super();
	}

	public ElectionVo(int election_round, int candy_no, Date candy_startdate, Date candy_enddate, Date vote_startdate,
			Date vote_enddate, String election_status) {
		super();
		this.election_round = election_round;
		this.candy_no = candy_no;
		this.candy_startdate = candy_startdate;
		this.candy_enddate = candy_enddate;
		this.vote_startdate = vote_startdate;
		this.vote_enddate = vote_enddate;
		this.election_status = election_status;
	}

	public int getElection_round() {
		return election_round;
	}

	public void setElection_round(int election_round) {
		this.election_round = election_round;
	}

	public int getCandy_no() {
		return candy_no;
	}

	public void setCandy_no(int candy_no) {
		this.candy_no = candy_no;
	}

	public Date getCandy_startdate() {
		return candy_startdate;
	}

	public void setCandy_startdate(Date candy_startdate) {
		this.candy_startdate = candy_startdate;
	}

	public Date getCandy_enddate() {
		return candy_enddate;
	}

	public void setCandy_enddate(Date candy_enddate) {
		this.candy_enddate = candy_enddate;
	}

	public Date getVote_startdate() {
		return vote_startdate;
	}

	public void setVote_startdate(Date vote_startdate) {
		this.vote_startdate = vote_startdate;
	}

	public Date getVote_enddate() {
		return vote_enddate;
	}

	public void setVote_enddate(Date vote_enddate) {
		this.vote_enddate = vote_enddate;
	}

	public String getElection_status() {
		return election_status;
	}

	public void setElection_status(String election_status) {
		this.election_status = election_status;
	}
}
