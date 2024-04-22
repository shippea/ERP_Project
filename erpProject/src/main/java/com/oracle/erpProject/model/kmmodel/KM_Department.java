package com.oracle.erpProject.model.kmmodel;

import lombok.Data;

@Data
public class KM_Department {

	private int dept_no; // 부서번호(코드)
	private String dept_name; // 부서명
	private String dept_tel; // 부서위치
	private String dept_enabled; // 부서존재여부
}
