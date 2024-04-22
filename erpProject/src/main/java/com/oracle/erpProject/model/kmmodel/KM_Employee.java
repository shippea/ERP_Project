package com.oracle.erpProject.model.kmmodel;

import java.util.Date;

import lombok.Data;

@Data
public class KM_Employee {
	
	private int emp_no; 			 // 사원번호
	private int dept_no; 		 	 // 부서번호
	private int emp_job_comm; 		 // 직책 중분류
	private int emp_job_name;		 // 직책 중분류
	private String emp_name; 		 // 사원 이름 
	private String emp_password; 	 // 비밀번호
	private String emp_birth; 	     // 생년월일
	private String emp_gender;	     // 성별
	private String emp_email; 		 // 이메일
	private String emp_postcode; 	 // 우편번호
	private String emp_address; 	 // 주소
	private String emp_phone; 		 // 전화번호
	private String emp_hiredate; 	 // 입사일자 
	private String emp_retired_date; // 고용일자
	private String emp_status; 		 // 상태 (0: 재직 - 1: 휴직 - 9: 퇴사)
	private String emp_role; 		 // role_employee(사원), role_admin(관리자), role_manager (업무 담당자)
	private String emp_enabled; 	 // 계정활성화
	private Date emp_wdate; 		 // 입력일자 (사원 등록일자)
	

}
