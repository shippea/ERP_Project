package com.oracle.erpProject.model.slmodel;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class SLSale {
	private String s_date; 		//매출일자
	private int cust_no;		//거래처코드
	private int emp_no; 		//거래처 담당 직원 
	private String s_title;		//판매제목
	private int s_status;		//판매상태
	private String s_note;		//비고
	private String s_manager;		//판매담당자 코드
	private Date s_wdate;		//판매날짜입력
	

	// 리스트 조회용 컬럼
	private String emp_name; // 담당자 이름 
	private int dept_no; // 부서번호
	private String cust_name; // 거래처명 		
	private String sale_status_detail; // 판매 진행 상태
	private int productCnt; // 판매 제품 수
	private int totalMoney; // 판매 총 금액
	private int totalCnt; // 판매 제품 총 수량
	private String keyword; // 검색 키워드 
	
	private int p_itemcode;		// 제품코드
	private int f_id; // 공장 코드 
	private int p_saleprice;  // 판매 가격
	private String p_name; // 제품 이름 
	private int sd_price;
	private int sd_cnt;
	
	
	
	private List<SLSale_detail> productList;
	
	// 조회용 수불 마감
	private String rnpc_year_month_day;	// 년월일
	private int rnpc_gubun;					// 수불마감구분
	
	//조회용 stock
	private String st_year_month; 
	private int st_quantity; // 재고 수량 
	
	// 페이징
	private int start;
	private int end;
	private String currentPage;
	private int pageBlock;
	private int rowPage;
	private int startPage;			private int endPage;
	private int total;				private int totalPage;
	
	
	
	
	
}
