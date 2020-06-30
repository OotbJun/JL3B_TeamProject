package com.jl3b.touche_nubes.chatvo;

import java.util.Date;

public class ChatVo {
	
	private int chat_no;
	private int member_no;
	private String chat_content;
	private Date chat_date;
	private String member_rname;
	
	public ChatVo() {
		super();
	}

	public ChatVo(int chat_no, int member_no, String chat_content, Date chat_date, String member_rname) {
		super();
		this.chat_no = chat_no;
		this.member_no = member_no;
		this.chat_content = chat_content;
		this.chat_date = chat_date;
		this.member_rname = member_rname;
	}

	public int getChat_no() {
		return chat_no;
	}

	public void setChat_no(int chat_no) {
		this.chat_no = chat_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getChat_content() {
		return chat_content;
	}

	public void setChat_content(String chat_content) {
		this.chat_content = chat_content;
	}

	public Date getChat_date() {
		return chat_date;
	}

	public void setChat_date(Date chat_date) {
		this.chat_date = chat_date;
	}

	public String getMember_rname() {
		return member_rname;
	}

	public void setMember_rname(String member_rname) {
		this.member_rname = member_rname;
	}
}
