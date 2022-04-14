package com.page.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.page.domain.BoardVO;
import com.page.domain.PagingVO;
import com.page.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class BoardDAO implements BoardService {

	private BoardMapper mapper;
	
//	@Override
//	public List<BoardVO> getList() {
//		log.info("게시물 리스트");
//		return mapper.getList();
//	}
	
	@Override
	public void regist(BoardVO board) {
		log.info("게시물 등록 : " + board.getTitle());
		mapper.insertKnowBno(board);
	}

	@Override
	public BoardVO get(int bno) {
		log.info(bno + "번 게시물 불러오기");
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		log.info(board.getTitle() + "수정완료");
		return mapper.update(board) == 1;
	}
	// 정상 실행되면 1이 반환되어 true값이 return.
	@Override
	public boolean remove(int bno) {
		log.info(bno + "번 게시물 삭제");
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<BoardVO> getListPage(PagingVO paging) {
		return mapper.listWithPaging(paging);
	}

	@Override
	public int totalCount(PagingVO paging) {
		return mapper.getTotalCount(paging);
	}

}
