package com.jl3b.touche_nubes.membervo;

public class NpkiVo {
	
	private int npki_no;
	private String npki_key;
	private String npki_type;
	
	public NpkiVo() {
		super();
	}
	
	public NpkiVo(int npki_no, String npki_key, String npki_type) {
		super();
		this.npki_no = npki_no;
		this.npki_key = npki_key;
		this.npki_type = npki_type;
	}

	public int getNpki_no() {
		return npki_no;
	}

	public String getNpki_key() {
		return npki_key;
	}

	public String getNpki_type() {
		return npki_type;
	}
	
	
}
