package com.oracle.erpProject.model.lhsmodel;

import java.util.Date;

import lombok.Data;

@Data
public class Employee {
	
	private int emp_no;
	private int dept_no;
	private int emp_job_comm;
	private int emp_job_name;
	private String emp_name;
	private String emp_password;
	private String emp_birth;
	private String emp_gender;
	private String emp_email;
	private String emp_postcode;
	private String emp_address;
	private String emp_phone;
	private String emp_hiredate;
	private String emp_retired_date;
	private String emp_status;
	private String emp_role;
	private String emp_enabled;
	private Date emp_wdate;
	
	// 0328 현승 - 테스트용 사원리스트 파라미터 (lhs)
	private String dept_name;
	


}
