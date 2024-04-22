package com.oracle.erpProject.model.lhsmodel;

import java.util.Date;

import lombok.Data;

@Data
public class Stock_survey {
	private String st_year_month;
	private int st_begin_end;
	private int  p_itemcode;
	private int  sts_quantity;
	private int  sts_realcnt;
	private int  sts_disposalcnt;
	private String sts_regdate;
	
	
	
}
