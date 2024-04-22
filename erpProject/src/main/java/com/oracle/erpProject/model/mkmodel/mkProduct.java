package com.oracle.erpProject.model.mkmodel;

import java.util.Date;

import lombok.Data;

@Data
public class mkProduct {
	
		private int p_itemcode;				//제품 코드
		private int f_id;							// 공장 코드
		private String f_name;
		private int pro_category;			//제품 대분류	
		private int pro_midcategory;		//제품 중분류
		private String p_name;				// 제품명
		private String p_content;			// 제품내용
		private int p_buyprice;				//매입가격
		private int p_saleprice;				//매출가격
		private String p_image;				// 제품사진
		private Date p_enddate;			//판매종료일
		private Date p_update;				//수정날자
		private Date p_regdate;				//등록날자
		private String p_fac_gubun;		//공장구분
		private int p_isdeleted;				//취급여부 

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
