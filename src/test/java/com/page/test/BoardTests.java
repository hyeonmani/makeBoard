package com.page.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.page.domain.BoardVO;
import com.page.mapper.BoardMapper;
import com.page.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardTests {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
	@Test
	public void testGetList() {
		//mapper.getList().forEach(board -> log.info(board));
	}
	
	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setTitle("테스트 게시글");
		board.setContent("테스트용 게시글 내용");
		board.setId("bbb");
		
		service.regist(board);
		
		log.info(board.getBno() + "번 게시글 생성");
	}
	
	@Test
	public void testRead() {
		BoardVO board = mapper.read(1);
		
		log.info(board);
	
	}
	
	@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();
		board.setBno(3);
		board.setTitle("수정된 제목");
		board.setContent("수정된 내용");
		board.setId("bbb");
		
		mapper.update(board);
		
		log.info(board.getBno() + "번 게시물 수정완료");
	}
	
	@Test
	public void testDelete() {
		BoardVO board = new BoardVO();
		log.info(board.getBno() + "번 게시물 삭제");
		mapper.delete(3); 
	}
}
