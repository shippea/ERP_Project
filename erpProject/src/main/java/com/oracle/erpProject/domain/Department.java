package com.oracle.erpProject.domain;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.SequenceGenerator;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Getter
@Setter
@ToString(exclude = "empList")
public class Department { /* KM_Department */

	@Id
	@GeneratedValue(generator = "DEPT_NO_SEQ")
	@SequenceGenerator(name = "DEPT_NO_SEQ", sequenceName = "DEPT_NO_SEQ", allocationSize = 1)
	@Column(name="dept_no")
	private int deptNo; // 부서번호(코드)
	@Column(name="dept_name")
	private String deptName; // 부서명
	@Column(name="dept_phone")
	private String deptPhone; // 부서전화번호
//	@Column(columnDefinition = "defalut 'Y'")
	@Column(name="dept_enabled")
	private String deptEnabled; // 부서존재여부

	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<Employee> empList = new ArrayList<Employee>();
	
}
