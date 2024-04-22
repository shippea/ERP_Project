package com.oracle.erpProject.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.oracle.erpProject.domain.Department;

/* KM_DepartmentRepository */
@Repository
public interface DepartmentRepository extends JpaRepository<Department, Integer> {

}
