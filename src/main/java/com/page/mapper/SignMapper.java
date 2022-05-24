package com.page.mapper;

import com.page.domain.MemberVO;

public interface SignMapper {

	public void joinMember(MemberVO member);
	
	public MemberVO login(MemberVO member);
	
	public int checkID(MemberVO member);
}
