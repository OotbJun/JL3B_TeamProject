package com.jl3b.touche_nubes.votevo;

import java.util.Date;

public class ElectionVo {
	
	private int election_round;
	private int candy_no;
	private Date election_startdate;
	private Date election_enddate;
	
	public ElectionVo() {
		super();
	}

	public ElectionVo(int election_round, int candy_no, Date election_startdate, Date election_enddate) {
		super();
		this.election_round = election_round;
		this.candy_no = candy_no;
		this.election_startdate = election_startdate;
		this.election_enddate = election_enddate;
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

	public Date getElection_startdate() {
		return election_startdate;
	}

	public void setElection_startdate(Date election_startdate) {
		this.election_startdate = election_startdate;
	}

	public Date getElection_enddate() {
		return election_enddate;
	}

	public void setElection_enddate(Date election_enddate) {
		this.election_enddate = election_enddate;
	}
	
}
