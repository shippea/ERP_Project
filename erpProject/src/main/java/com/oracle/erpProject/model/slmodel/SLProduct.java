package com.oracle.erpProject.model.slmodel;

import java.util.Date;

import lombok.Data;

@Data
public class SLProduct {
	
		private int p_itemcode;				//제품 코드
		private int f_id;							// 공장 코드
		private int pro_category;			//제품 대분류	
		private int pro_midcategory;		//제품 중분류
		private String p_name;				// 제품명
		private String p_content;			// 제품내용
		private int p_buyprice;				//매입가격
		private int p_saleprice;				//매출가격
		private String p_image;				// 제품사진
		private Date p_enddate;			//판매종료일
		private Date p_udtdatd;				//수정날자
		private Date p_regdate;				//등록날자
		private String p_fac_gubun;		//공장구분
		private int p_isdeleted;				//취급여부 


		
	//조회용 stock
	private String st_year_month; 
	private int st_quantity; // 재고 수량 
	private int st_begin_end;
	private String f_name;
		
		
}
