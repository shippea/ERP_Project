package com.oracle.erpProject.model.lhsmodel;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Stock {
	
	private String st_year_month;
	private int st_begin_end;
	private int p_itemcode;
	private int st_quantity;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String st_regdate;
	
	// Paging
    private String 	pageNum;  			private String 	currentPage;		
    private int 	start;              private int 	end;
  	private int 	prevPage;		  	private int 	nextPage;
	private String gubun;
	
  	// 0401 현승 - 월 재고조회 파라미터 (lhsListStock)
  	private String p_name;
  	private String st_begin_end_gubun;
  	
  	// 0402 현승 - 기초재고등록 폼 파라미터 (lhsFormRegistStockBegin)
  	private String st_year_month_day;
}
