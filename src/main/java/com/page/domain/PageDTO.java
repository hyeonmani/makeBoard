package com.page.domain;

import lombok.Data;

@Data
public class PageDTO {

	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private PagingVO paging;
	
	public PageDTO(PagingVO paging, int total) {
		this.paging = paging;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(paging.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		int realEnd = (int)(Math.ceil((total * 1.0) / paging.getAmount()));
		if(realEnd < this.endPage){
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
