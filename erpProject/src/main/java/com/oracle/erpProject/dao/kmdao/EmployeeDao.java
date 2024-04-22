package com.oracle.erpProject.dao.kmdao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;

import com.oracle.erpProject.domain.Employee;

public interface EmployeeDao {

	Employee registEmployee(Employee employee);
	
	Employee getEmployee(int empNo);
	
	Employee updateEmployee(Employee employee);

	Employee findByEmpNo(int empNo);
	
	Optional<Employee> findByEmpNo3(int empNo);
	
	Integer countEmployeeList();

	//List<Employee> getEmployeeList(int size, int offset, String searchType, String searchValue);

	List<Employee> getEmpList(String searchType, String searchValue);

}
