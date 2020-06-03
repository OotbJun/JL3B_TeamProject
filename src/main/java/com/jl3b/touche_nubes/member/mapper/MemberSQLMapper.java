package com.jl3b.touche_nubes.member.mapper;

import com.jl3b.touche_nubes.membervo.ResiVo;
import com.jl3b.touche_nubes.membervo.TeacherVo;

public interface MemberSQLMapper {
	
	public void insertResi(ResiVo resiVo);
	
	public ResiVo selectResiByIdAndPw(ResiVo resiVo);
	
	public ResiVo selectResiByNo(int no);
	
	public ResiVo selectResiById(String id);
	
	public void insertTeacher(TeacherVo teacherVo);
	
}
