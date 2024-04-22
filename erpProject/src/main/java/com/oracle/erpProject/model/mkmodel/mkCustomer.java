package com.oracle.erpProject.model.mkmodel;

import java.util.Date;

import lombok.Data;

@Data
public class mkCustomer {

	private int cust_no;				// 거래처 번호
	private int emp_no;				// 사원번호
	private String emp_name;    //사원 이름 
	private int cust_bcomm;		// 거래처 대분류
	private int cust_scomm;		// 거래처 중분류
	private String cust_type;		// 거래처 유형
	private String cust_name;		// 거래처 상호명
	private String cust_b_num;			// 거래처 사업자 번호
	private String cust_tel;			// 거래처 전화번호
	private String cust_email;		// 거래서 이메일
	private int cust_status;			// 거래처 상태
	private int cust_isdeleted;		// 거래처 삭제여부
	private Date wdate;				// 거래처 입력 일자 
	private String cust_boss;
	private String cust_status_content;
	//comm
	private int comm_bcd;
	private int comm_mcd;
	private String comm_content;
	
	// 조회용
	private String search;   	   private String keyword;
	private String pageNum;  
	private int start; 		 	   private int end;
	// Page 정보
	private String currentPage;
	
	

}
