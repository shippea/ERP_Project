package com.oracle.erpProject.model;


import java.util.Date;

import lombok.Data;

@Data
public class Buying {

	private String buy_date;				// 구매일자		
	private int cust_no;						// 거래처 코드
	private int emp_no;						// 사원번호
	private String buy_title;				// 구매 제목
	private int buy_status;					// 구매 상태
	private String buy_manager;			// 구매 담당자
	private String buy_note;				// 비고
	private Date buy_wdate;				//구매입력날짜
									// 데이트는 sql. date 아니고, utill.date 로 입력 
	

	// 조회용 수불 마감
	private String d_year_month;	// 년월일
	private int d_cubun;					// 수불마감구분
	
	// 조회용
	private String buy_status_detail; //  구매 상태 이름 
	private int productCnt; // 총 구매한 제품의 타입 수 
	private String emp_name; // 거래처 담당자 이름
	private String cust_name; // 거래처 
	private int p_itemcode;		// 제품코드
	private String p_name;				// 제품 이름 
	private int bd_cnt;			// 구매수량
	private int bd_price;		// 구매가격
	private int totalMoney; // 총금액
	private int totalCnt; // 제품 전체 총 수량
	private String managerName; // 구매 담당자
	private String buyProduct; // 구매 제품
	
	
	// 페이징
	private int start;
	private int end;
	private String currentPage;
	private int pageBlock;
	private int rowPage;
	private int startPage;			private int endPage;
	private int total;				private int totalPage;
	
	
}
