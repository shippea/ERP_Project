package com.oracle.erpProject.service.kmservice;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.erpProject.dao.kmdao.EmployeeDaoImpl;
import com.oracle.erpProject.domain.Employee;

@Service
public class KM_EmployeeServiceImpl implements KM_EmployeeService {

	@Autowired
	private EmployeeDaoImpl employeeDaoImpl;
	
	@Override
	public Employee registEmployee(Employee employee) {
		return employeeDaoImpl.registEmployee(employee);
	}
	
	@Override
	public Employee getEmployee(int emp_no) {
		return employeeDaoImpl.getEmployee(emp_no);
	}
	
	@Override
	public Employee updateEmployee(Employee employee) {
		if (employee.getEmpRetiredDate() == null) {
			employee.setEmpWdate(Timestamp.valueOf(LocalDateTime.now()));
	    }
		return employeeDaoImpl.updateEmployee(employee);
	}

	@Override
	public Employee deleteEmployee(Employee employee) {
		return null;
	}

	/*
	@Override
	public List<Employee> getEmployeeList(int size, int offset, String searchType, String searchValue) {
		return employeeDaoImpl.getEmployeeList(size, offset, searchType, searchValue);
	}
	*/
	@Override
	public Integer countEmployeeList() {
		return employeeDaoImpl.countEmployeeList();
	}

	public List<Employee> getEmpList(String searchType, String searchValue) {
		return employeeDaoImpl.getEmpList(searchType, searchValue);
	}

	@Override
	public Employee findByEmpNo(int empNo) {
		return employeeDaoImpl.findByEmpNo(empNo);
	}

	public Optional<Employee> findByEmpNo3(int empNo) {
		System.out.println("KM_EmployeeServiceImpl findByEmpNo3 empNo->"+empNo);

		Optional<Employee> employee = employeeDaoImpl.findByEmpNo3(empNo);
		System.out.println("KM_EmployeeServiceImpl findByEmpNo3 employee->"+employee);
		return employee;
	}

}
