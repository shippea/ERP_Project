package com.oracle.erpProject.model;

import lombok.Data;

@Data
public class Buying_detail {

	private String buy_date;		// 구매일자
	private int cust_no;				// 거래처코드
	private int p_itemcode;		// 제품코드
	private int bd_cnt;				// 구매수량
	private int bd_price;				// 구매가격
	
	
	// 조회용 수불 마감
	private String d_year_month;	// 년월일
	private int d_cubun;					// 수불마감구분
	
}