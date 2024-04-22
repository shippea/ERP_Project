package com.oracle.erpProject.domain;

import java.sql.Date;
import java.sql.Timestamp;

import org.hibernate.annotations.DynamicUpdate;
import org.springframework.format.annotation.DateTimeFormat;

import jakarta.annotation.Nullable;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.TableGenerator;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.persistence.Transient;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Getter
@Setter
@ToString
public class Employee { /* KM_Employee */

	@Id
	@GeneratedValue(generator = "EMP_NO_SEQ")
	@SequenceGenerator(name = "EMP_NO_SEQ", sequenceName = "EMP_NO_SEQ", allocationSize = 1)
	@Column(name="emp_no")
	private Integer empNo; // 사원번호
	
	@Column(name="emp_job_comm")
	private int empJobComm; // 직책 중분류
	
	@Column(name="emp_job_name")
	private int empJobName; // 직책 중분류
	
	@Column(name="emp_name")
	private String empName; // 사원 이름
	
	@Column(name="emp_password")
	private String empPassword; // 비밀번호
	
	@Temporal(value = TemporalType.DATE)
	@Column(name="emp_birth")
	private Date empBirth; // 생년월일
	
	@Column(name="emp_gender")
	private String empGender; // 성별
	
	@Column(name="emp_email")
	private String empEmail; // 이메일
	
	@Column(name="emp_postcode")
	private String empPostcode; // 우편번호
	
	@Column(name="emp_address")
	private String empAddress; // 주소
	
	@Column(name="emp_phone")
	private String empPhone; // 전화번호
	
	@Temporal(value = TemporalType.DATE)
	@Column(name="emp_hiredate")
	private Date empHireDate; // 입사일자
	
	@Column(name = "emp_retired_date")
	private String empRetiredDate; // 퇴사일자
	
	@Column(name="emp_status")
	private String empStatus; // 상태 (0: 재직 - 1: 휴직 - 9: 퇴사)
	
	@Column(name="emp_role")
	private String empRole; // role_employee(사원), role_admin(관리자), role_manager (업무 담당자)
	
	@Column(name="emp_enabled")
	private String empEnabled; // 계정활성화
	
	@DateTimeFormat
	@Temporal(value = TemporalType.TIMESTAMP)
	@Column(name="emp_wdate")
	private Timestamp empWdate; // 입력일자 (사원 등록일자)
	
	
	@JoinColumn(name="dept_no")
	private int deptNo; // 부서번호

}