package com.page.domain;

import lombok.Data;

@Data
public class PagingVO {

	private int pageNum;
	private int amount;
	
	// 기본값 1page 10항목
	public PagingVO() {
		this(1, 10);
	}

	public PagingVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
}
