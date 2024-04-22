package com.oracle.erpProject;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.ListPagingAndSortingRepository;
import org.springframework.test.context.junit4.SpringRunner;

import com.oracle.erpProject.domain.Department;
import com.oracle.erpProject.domain.Employee;
import com.oracle.erpProject.repository.DepartmentRepository;
import com.oracle.erpProject.repository.EmployeeRepository;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.QueryFactory;
import com.querydsl.jpa.impl.JPAQueryFactory;

import jakarta.persistence.EntityManager;
import jakarta.transaction.Transactional;

@RunWith(SpringRunner.class)
@SpringBootTest
class ErpProjectApplicationTests {
	
	@Autowired
	EntityManager em;

	@Autowired
	DepartmentRepository deptRepo;
	
	@Autowired
	EmployeeRepository empRepo;
	
	JPAQueryFactory queryFactory;
	
	@Test
	public void testInsertDept() {
		/*
		/* Departemt test */
		/*
		Department dept = new Department();
		dept.setDept_name("물류");
		dept.setDept_phone("1515");
		dept.setDept_enabled("Y");
		
		deptRepo.save(dept);
		
		dept = new Department();
		dept.setDept_name("판매");
		dept.setDept_phone("2525");
		dept.setDept_enabled("Y");
		
		deptRepo.save(dept);
		
		dept = new Department();
		dept.setDept_name("영업");
		dept.setDept_phone("3535");
		dept.setDept_enabled("Y");
		
		deptRepo.save(dept);
		*/
		
		/*
		// 리스트 
		Iterable<Department> deptList = deptRepo.findAll();
		System.out.println(deptList);
		*/
		
		/*
		// 수정
		Department dept = deptRepo.findById(952).get();
		dept.setDept_name("인사");
		deptRepo.save(dept);
		*/
		
		/*
		// 삭제
		deptRepo.deleteById(954);
		*/
		
		/*
		// 한 건 조회
		Department dept = deptRepo.findById(952).get();
		System.out.println(dept);
		*/
		
		/*
		// 검색 dept_enabled 가 Y인것
		BooleanBuilder builder = new BooleanBuilder();
		QDepartment qdepartment = QDepartment.department;
		if(dept_enabled.equals("Y")) {
			builder.and(qdepartment.dept_enabled.like("Y"));
		}
		List<Department> deptList = new JPAQueryFactory(em).selectFrom(qdepartment).where(builder).fetch();
		System.out.println(deptList);
		*/
		
		/* 
		// 테스트용 데이터 생성
		for (int i=0; i<100; i++) {
			Department dept = new Department();
			dept.setDept_name("물류"+i);
			dept.setDept_phone("1515"+i);
			dept.setDept_enabled("Y");
			
			deptRepo.save(dept);
		}
		*/
		
		/*
		// 페이징
		Pageable paging = PageRequest.of(0, 5, Sort.Direction.DESC, "deptNo");
		Page<Department> pageInfo = deptRepo.findAll(paging);
		System.out.println(pageInfo.getSize());
		System.out.println(pageInfo.getTotalPages());
		System.out.println(pageInfo.getTotalElements());
		System.out.println(pageInfo.nextPageable());
		List<Department> deptList = pageInfo.getContent();
		System.out.println(deptList);
		*/
		
		/* Employee test */
		
		/*
		// 등록
		Department dept = new Department();
		dept.setDept_name("인사");
		dept.setDept_phone("1111");
		dept.setDept_enabled("Y");
		deptRepo.save(dept);
		
		Employee emp = new Employee();
		emp.setEmp_address("서울");
		emp.setEmp_birth("20240405");
		emp.setEmp_email("a@gmail.com");
		emp.setEmp_enabled("Y");
		emp.setEmp_gender("F");
		emp.setEmp_hiredate("20240405");
		emp.setEmp_job_comm(200);
		emp.setEmp_job_name(10);
		emp.setEmp_name("kim");
		emp.setEmp_password("123456");
		emp.setEmp_phone("01000000000");
		emp.setEmp_postcode("0000");
		emp.setEmp_retired_date("20240405");
		emp.setEmp_role("role_employee");
		emp.setEmp_status("Y");
		emp.setEmp_wdate(new Date());

		// 등록
		/*
		Department dept = new Department();
		dept.setDept_name("인사");
		dept.setDept_phone("1111");
		dept.setDept_enabled("Y");
		deptRepo.save(dept);
		*/
		/*
		for (int i=0; i<100; i++) {
			Employee emp = new Employee();
			emp.setEmpAddress("서울");
			emp.setEmpBirth("20240405");
			emp.setEmpEmail("a@gmail.com");
			emp.setEmpEnabled("Y");
			emp.setEmpGender("F");
			emp.setEmpHiredate("20240405");
			emp.setEmpJobComm(200);
			emp.setEmpJobName(10);
			emp.setEmpName("kim");
			emp.setEmpPassword("123456");
			emp.setEmpPhone("01000000000");
			emp.setEmpPostcode("0000");
			emp.setEmpRetiredDate("20240405");
			emp.setEmpRole("role_employee");
			emp.setEmpStatus("Y");
			emp.setEmpWdate(new Date());
			emp.setDeptNo(100);
			
			empRepo.save(emp);
		}
		*/
		/*
		// 수정
		Employee emp = empRepo.findById(1702).get();
		emp.setEmp_name("YU");
		empRepo.save(emp);
		*/
		
	/*
		for (int i=0; i<5; i++) {
			Department dept = new Department();
			dept.setDept_name("인사"+i);
			dept.setDept_phone("1111");
			dept.setDept_enabled("Y");
			deptRepo.save(dept);
			
			Employee emp = new Employee();
			emp.setEmp_address("서울");
			emp.setEmp_birth("20240405");
			emp.setEmp_email("a@gmail.com");
			emp.setEmp_enabled("Y");
			emp.setEmp_gender("F");
			emp.setEmp_hiredate("20240405");
			emp.setEmp_job_comm(200);
			emp.setEmp_job_name(10);
			emp.setEmp_name("kim");
			emp.setEmp_password("123456");
			emp.setEmp_phone("01000000000"+i);
			emp.setEmp_postcode("0000");
			emp.setEmp_retired_date("20240405");
			emp.setEmp_role("role_employee");
			emp.setEmp_status("Y");
			emp.setEmp_wdate(new Date());
			
			emp.setDepartment(dept);
			empRepo.save(emp);
		}
	*/	
	
		
		

	/*
		// 한 건 조회
		Employee emp = empRepo.findById(1702).get();
		System.out.println("findbyID : "+emp);
		
		 */
		
		// 삭제
		
		/*
		// 테스트용
		for (int i=0; i<100; i++) {
			Department dept = new Department();
			dept.setDept_name("인사"+i);
			dept.setDept_phone("1111");
			dept.setDept_enabled("Y");
			deptRepo.save(dept);
			
			Employee emp = new Employee();
			emp.setEmp_address("서울");
			emp.setEmp_birth("20240405");
			emp.setEmp_email("a@gmail.com");
			emp.setEmp_enabled("Y");
			emp.setEmp_gender("F");
			emp.setEmp_hiredate("20240405");
			emp.setEmp_job_comm(200);
			emp.setEmp_job_name(10);
			emp.setEmp_name("kim");
			emp.setEmp_password("123456");
			emp.setEmp_phone("01000000000"+i);
			emp.setEmp_postcode("0000");
			emp.setEmp_retired_date("20240405");
			emp.setEmp_role("role_employee");
			emp.setEmp_status("Y");
			emp.setEmp_wdate(new Date());
			
			emp.setDepartment(dept);
			empRepo.save(emp);
		}
		
		
		*/
		

		/*
		// 한 건 조회
		Employee emp = empRepo.findById(1702).get();
		System.out.println("findbyID : "+emp);
		*/
		
		
		// 삭제
		//empRepo.deleteById(1);
		
		// 리스트 조회
		
		// 검색
		/*
		BooleanBuilder builder = new BooleanBuilder();
		QEmployee qemp = QEmployee.employee;
		if(emp_name.equals("YU")) {
			builder.and(qemp.emp_name.like("Y"));
		}
		List<Department> deptList = new JPAQueryFactory(em).selectFrom(qemp).where(builder).fetch();
		System.out.println(deptList);
		*/
		// 페이징
		
		
	}
	
}





