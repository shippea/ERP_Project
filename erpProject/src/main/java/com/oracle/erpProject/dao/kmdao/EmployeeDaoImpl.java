package com.oracle.erpProject.dao.kmdao;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;

import com.oracle.erpProject.domain.Employee;
import com.oracle.erpProject.repository.EmployeeRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import jakarta.persistence.criteria.Subquery;

@Component
public class EmployeeDaoImpl implements EmployeeDao {

	@Autowired
	private EmployeeRepository employeeRepository;

	@Autowired
	public EntityManager entityManager;

	// 사원 등록
	@Override
	public Employee registEmployee(Employee employee) {
		   Employee employee2 = null;
		   employee2 = employeeRepository.save(employee);
		   System.out.println("EmployeeRepository employee2->"+employee2);
		return employeeRepository.save(employee);
	}

	// 사원 조회 1건
	@Override
	public Employee getEmployee(int empNo) {
		return employeeRepository.findById(empNo).get();
	}

	// 사원 수정
	@Override
	public Employee updateEmployee(Employee employee) {
		Employee originEmployee = employeeRepository.findById(employee.getEmpNo()).get();
		entityManager.merge(employee); 
		// originEmployee.setEmpWdate(employee.getEmpWdate());
		// originEmployee.setEmpPassword(employee.getEmpPassword());
		return employeeRepository.save(originEmployee);
	}

	// 사원 번호 조회
	@Override
	public Employee findByEmpNo(int empNo) {
		return employeeRepository.findById(empNo).get();
	}
	
	// 사원 번호 조회
	@Override
	public Optional<Employee> findByEmpNo3(int empNo) {
		System.out.println("DAO findByEmpNo3 empNo->"+empNo);
		Optional<Employee> employee = employeeRepository.findById(empNo);
		System.out.println("DAO employee findById finish..");
		System.out.println("DAO employee"+employee);
		return employee;
	}
	
	// 사원 리스트 카운트
	@Override
	public Integer countEmployeeList() {
		return employeeRepository.findAll().size();
	}

	// 사원 리스트 조회
	@Override
	public List<Employee> getEmpList(String searchType, String searchValue) {
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<Employee> criteriaQuery = criteriaBuilder.createQuery(Employee.class);

		Root<Employee> employee = criteriaQuery.from(Employee.class);
		
		Predicate searchPredicate = null;
		searchType = searchType==null ? "" : searchType;
		if (searchType.equals("E")) {
			searchPredicate = criteriaBuilder.equal(employee.get("empName"), searchValue);
		} else if (searchType.equals("D")) {
			searchPredicate = criteriaBuilder.equal(employee.get("deptNo"), searchValue);
		}
		if (searchPredicate != null) {
	        criteriaQuery.where(searchPredicate);
	    }
		//criteriaQuery.where(searchPredicate, searchPredicate);
		criteriaQuery.orderBy(criteriaBuilder.desc(employee.get("empNo")));
		return entityManager.createQuery(criteriaQuery).getResultList();
	}


/*
	// paging and search 버전 문제로 실행 불가 (oracle 12이하 실행 안 됨)
	@Override
	public List<Employee> getEmployeeList(int size, int offset, String searchType, String searchValue) {
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<Employee> criteriaQuery = criteriaBuilder.createQuery(Employee.class);

		Root<Employee> employee = criteriaQuery.from(Employee.class);
		
		Predicate searchPredicate = null;
		searchType = searchType==null ? "" : searchType;
		if (searchType.equals("E")) {
			searchPredicate = criteriaBuilder.equal(employee.get("empName"), searchValue);
		} else if (searchType.equals("D")) {
			searchPredicate = criteriaBuilder.equal(employee.get("deptNo"), searchValue);
		}
		criteriaQuery.where(searchPredicate, searchPredicate);
		criteriaQuery.orderBy(criteriaBuilder.desc(employee.get("empNo")));
		
	    
		TypedQuery<Employee> typedQuery = entityManager.createQuery(criteriaQuery).setFirstResult(offset)
				.setMaxResults(size);
		 return typedQuery.getResultList();
	}
*/

	
}
