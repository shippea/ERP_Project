package com.oracle.erpProject.model.lhsmodel;

import java.util.Date;

import lombok.Data;

@Data
public class RnP_closing {
	
	private String rnpc_year_month_day;
	private int rnpc_itemcode;
	private int rnpc_gubun;
	
	// 0404 - 현승 paging
    private String 	pageNum;  			private String 	currentPage;		
    private int 	start;              private int 	end;
  	private int 	prevPage;		  	private int 	nextPage;
  	private String gubun;
	
	// 0404 - 현승 수불 일일내역 조회 파라미터 (getListRnPCondBuy)
	private Date rnpc_date;
	private String rnpc_category;
	private String rnpc_p_name;
	private int rnpc_cnt;
	private String rnpc_manager;
	private String rnpc_regdate;
	private String rnpc_status;	
	private String rnpc_filter;
	private int rnpc_cnt_real;
	private int rnpc_cnt_disposal;
}
