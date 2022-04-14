package com.page.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.page.domain.MemberVO;
import com.page.mapper.SignMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class JoinMemberTest {

	@Setter(onMethod_ = @Autowired)
	private SignMapper mapper;
	
	@Test
	public void joinMemberTest() {
		MemberVO member = new MemberVO();
		member.setId("bbb");
		member.setPwd("2222");
		
		mapper.joinMember(member);
		
		log.info(member);
	}
}
