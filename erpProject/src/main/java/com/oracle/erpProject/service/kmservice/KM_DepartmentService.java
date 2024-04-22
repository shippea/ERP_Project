package com.oracle.erpProject.service.kmservice;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.erpProject.domain.Department;

@Service
public interface KM_DepartmentService {

	Department insertDepartment(Department department);

	// List<Department> listDepartment(String searchType, String searchKeyword, Integer start, Integer count, String sort, String Direction);
	
	List<Department> listDepartment();

	Department updateDepartment(Department department);

	Department deleteDepartment(Department department);
	
}