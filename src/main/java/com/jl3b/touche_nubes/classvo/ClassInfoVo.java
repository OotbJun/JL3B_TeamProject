package com.jl3b.touche_nubes.classvo;

public class ClassInfoVo {

	private int class_info_no;
	private int teacher_no;
	private String class_info_pr;

	public ClassInfoVo() {
		super();
	}

	public ClassInfoVo(int class_info_no, int teacher_no, String class_info_pr) {
		super();
		this.class_info_no = class_info_no;
		this.teacher_no = teacher_no;
		this.class_info_pr = class_info_pr;
	}

	public int getClass_info_no() {
		return class_info_no;
	}

	public int getTeacher_no() {
		return teacher_no;
	}

	public String getClass_info_pr() {
		return class_info_pr;
	}

}
