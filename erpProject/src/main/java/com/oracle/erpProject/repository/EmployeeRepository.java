package com.oracle.erpProject.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.oracle.erpProject.domain.Employee;

/* KM_EmployeeRepository */
@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Integer> {
	
}