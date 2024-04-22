package com.oracle.erpProject.service.kmservice;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.oracle.erpProject.domain.Employee;

@Service
public interface KM_EmployeeService {

	Employee registEmployee(Employee employee);
	
	Employee getEmployee(int emp_no);
	
	Employee updateEmployee(Employee employee);

	Employee deleteEmployee(Employee employee);

	Employee findByEmpNo(int empNo);
	
	Integer countEmployeeList();	

	//List<Employee> getEmployeeList(int size, int offset, String searchType, String searchValue);
	
	List<Employee> getEmpList(String searchType, String searchValue);
	
}
