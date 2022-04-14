package com.page.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private String id;
	private String title;
	private int bno;
	private String content;
	private Date regdate;
	private Date updatedate;
	
}
