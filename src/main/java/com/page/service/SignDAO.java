package com.page.service;

import org.springframework.stereotype.Service;

import com.page.domain.MemberVO;
import com.page.mapper.SignMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class SignDAO implements SignService {

	private SignMapper mapper;

	@Override
	public void createMember(MemberVO member) {
		log.info(member.getId() + ", 회원가입 완료");
		mapper.joinMember(member);
	}

	@Override
	public MemberVO loginMember(MemberVO member) {
		log.info(member.getId() + " 로그인");
		return mapper.login(member);
	}

	@Override
	public int checkMember(MemberVO member) {
		int count = mapper.checkID(member);
		return count;
	}
}
