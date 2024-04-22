package com.oracle.erpProject.model;

import lombok.Data;

@Data
public class Sale_detail {
	private String s_date; 		//매출일자
	private int cust_no;		//거래처코드
	private int p_itemcode; 	//제품코드
	private int sd_cnt;			//판매수량
	private int sd_price;		//판매가격
	
	
}
