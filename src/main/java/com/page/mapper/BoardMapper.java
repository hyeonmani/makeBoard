package com.page.mapper;

import java.util.List;

import com.page.domain.BoardVO;
import com.page.domain.PagingVO;

public interface BoardMapper {

	//public List<BoardVO> getList();
	
	public void insert(BoardVO board);
	
	public void insertKnowBno(BoardVO board);
	
	public BoardVO read(int bno);
	
	public int delete(int bno);
	// 정상 실행되면 1을 반환
	public int update(BoardVO board);
	
	public List<BoardVO> listWithPaging(PagingVO paging);
	
	public int getTotalCount(PagingVO paging);
}
