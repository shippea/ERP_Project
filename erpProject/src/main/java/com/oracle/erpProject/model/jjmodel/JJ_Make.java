package com.oracle.erpProject.model.jjmodel;

import lombok.Data;

@Data
public class JJ_Make {
	private int m_num;					// 작업지시번호   ***
	private String m_status;			// 작업지시상태	(0. 작업요청, 1. 영업생산요청, 2. 생산중, 3. 생산완료, 4. 수불완료)
	private String m_manager;			// 작업지시담당자   ***
	private String m_sdate;				// 작업지시일자
	private String m_due_date;			// 작업완료일자
	private String m_isDeleted;			// 삭제여부
	private String m_note;				// 비고
	
	// 조회용
	private String search;				private String keyword;					
	private int start;					private int end;
	private String p_name;				// Product의 제품명 조회
	
  	// Page 정보
    private String currentPage;
    
    //make_detail
    private int md_num;					// 작업순번
    private int f_id;					// 공장코드
    private int p_itemcode;				// 제품코드
    private String md_worker;			// 작업자
    private int md_quantity;			// 지시수량
    private int md_pro_quantity;		// 생산수량
    private int rnpc_gubun;				// 수불마감구분
    private int md_worker_num;			// 작업인원
    private String md_note;				// 비고
    private String s_date;				// 매출일자
    private int cust_no;				// 거래처 코드
	
}
