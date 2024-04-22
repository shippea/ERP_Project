package com.oracle.erpProject.dao.kmdao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.oracle.erpProject.domain.Department;
import com.oracle.erpProject.repository.DepartmentRepository;

@Component
public class DepartmentDaoImpl implements DepartmentDao {

	@Autowired
	private DepartmentRepository departmentRepository;
	
	@Override
	public List<Department> listDepartment() {
		return departmentRepository.findAll();
		
	}

}
