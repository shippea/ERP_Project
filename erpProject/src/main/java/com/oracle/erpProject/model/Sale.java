package com.oracle.erpProject.model;

import java.util.Date;

import lombok.Data;

@Data
public class Sale {
	private String s_date; 		//매출일자
	private int cust_no;		//거래처코드
	private String s_title;		//판매제목
	private int s_status;		//판매상태
	private String s_note;		//비고
	private int s_manager;		//판매담당자 코드
	private Date s_wdate;		//판매날짜입력
	

	
}
