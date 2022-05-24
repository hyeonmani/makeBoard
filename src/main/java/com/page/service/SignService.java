package com.page.service;

import com.page.domain.MemberVO;

public interface SignService {

	public void createMember(MemberVO member);
	
	public MemberVO loginMember(MemberVO member);
	
	public int checkMember(MemberVO member);
}
