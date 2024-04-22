package com.oracle.erpProject.model.yhsmodel;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class YhsBoard {
	private int b_no;
	private int emp_no;
	private int b_category;
	private int board_mid;
	private String b_name; 
	private String b_content;
	private String b_file;
	private int b_hit;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date b_regdate;
	private int b_group;
	private int b_reply_no;
	private int b_indent;
	
	//조회용
	private String search;
	private String keyword;
	private String pageNum;
	private int start;
	private int end;
	
	//Page 정보
	private String currentPage;
	
	// 보드 타입
	private String boardType;
	

}
