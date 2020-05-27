package com.jl3b.touche_nubes.membervo;

import java.util.Date;

public class TeacherVo {
	
	private int teacher_no;
	private String npki_key;
	private String teacher_id;
	private String teacher_pw;
	private String teacher_lesson;
	private String teacher_mail;
	private String teacher_bank;
	private Date teacher_jdate;
	
	public TeacherVo() {
		super();
	}

	public TeacherVo(int teacher_no, String npki_key, String teacher_id, String teacher_pw, String teacher_lesson,
			String teacher_mail, String teacher_bank, Date teacher_jdate) {
		super();
		this.teacher_no = teacher_no;
		this.npki_key = npki_key;
		this.teacher_id = teacher_id;
		this.teacher_pw = teacher_pw;
		this.teacher_lesson = teacher_lesson;
		this.teacher_mail = teacher_mail;
		this.teacher_bank = teacher_bank;
		this.teacher_jdate = teacher_jdate;
	}

	public int getTeacher_no() {
		return teacher_no;
	}

	public void setTeacher_no(int teacher_no) {
		this.teacher_no = teacher_no;
	}

	public String getNpki_key() {
		return npki_key;
	}

	public void setNpki_key(String npki_key) {
		this.npki_key = npki_key;
	}

	public String getTeacher_id() {
		return teacher_id;
	}

	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}

	public String getTeacher_pw() {
		return teacher_pw;
	}

	public void setTeacher_pw(String teacher_pw) {
		this.teacher_pw = teacher_pw;
	}

	public String getTeacher_lesson() {
		return teacher_lesson;
	}

	public void setTeacher_lesson(String teacher_lesson) {
		this.teacher_lesson = teacher_lesson;
	}

	public String getTeacher_mail() {
		return teacher_mail;
	}

	public void setTeacher_mail(String teacher_mail) {
		this.teacher_mail = teacher_mail;
	}

	public String getTeacher_bank() {
		return teacher_bank;
	}

	public void setTeacher_bank(String teacher_bank) {
		this.teacher_bank = teacher_bank;
	}

	public Date getTeacher_jdate() {
		return teacher_jdate;
	}

	public void setTeacher_jdate(Date teacher_jdate) {
		this.teacher_jdate = teacher_jdate;
	}
	
	
}
