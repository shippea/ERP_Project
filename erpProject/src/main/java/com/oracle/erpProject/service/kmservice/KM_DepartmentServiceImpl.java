package com.oracle.erpProject.service.kmservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.erpProject.dao.kmdao.DepartmentDaoImpl;
import com.oracle.erpProject.domain.Department;


@Service
public class KM_DepartmentServiceImpl implements KM_DepartmentService {

	@Autowired
	private DepartmentDaoImpl departmentDaoImpl;

	@Override
	public Department insertDepartment(Department department) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Department updateDepartment(Department department) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Department deleteDepartment(Department department) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Department> listDepartment() {
		return departmentDaoImpl.listDepartment();
	}


}
