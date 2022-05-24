package com.page.service;

import java.util.List;

import com.page.domain.BoardVO;
import com.page.domain.PagingVO;

public interface BoardService {

//	public List<BoardVO> getList();

	public void regist(BoardVO board);

	public BoardVO get(int bno);

	public boolean modify(BoardVO board);
	// 정상 실행되면 1을 반환
	public boolean remove(int bno);
	
	public List<BoardVO> getListPage(PagingVO paging);
	
	public int totalCount(PagingVO paging);
}
