package com.oracle.erpProject.service.mkservice;

import java.util.List;


import org.springframework.stereotype.Service;


import com.oracle.erpProject.dao.mkdao.MK_Dao_Interface;

import com.oracle.erpProject.model.mkmodel.mkCustomer;
import com.oracle.erpProject.model.mkmodel.mkEmployee;
import com.oracle.erpProject.model.mkmodel.mkFactory;
import com.oracle.erpProject.model.mkmodel.mkProduct;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MK_ServiceImpl implements MK_Service_interface {
	
	private final MK_Dao_Interface mk_Dao_Interface;
	
	@Override
	public List<mkProduct> listProduct(mkProduct product) {
		List<mkProduct> productList = null;
		System.out.println("MKServiceImpl productList Start");
		productList = mk_Dao_Interface.productList(product);
		System.out.println("product->"+productList);
		return productList;
	}

	@Override
	public mkProduct getProductDetail(mkProduct product) {
		System.out.println("MKServiceImpl getProductDetail Start"); 
		System.out.println("MKServiceImpl getProductDetail->"+product);
		mkProduct productDetail = null;
		productDetail=mk_Dao_Interface.productDetail(product);
		return productDetail;
	}

	//페이징을 위한 product count
	
	@Override
	public int totalProduct(mkProduct product) {
		System.out.println("MKServiceImpl start totalProduct");
		int totProductCnt=mk_Dao_Interface.totalProduct(product);
		System.out.println("MK_servieImpl totalProductCnt->"+totProductCnt);
		return totProductCnt;
	}

	// 제품 등록 
	@Override
	public int insertProduct(mkProduct product) {
		int result=0;
		System.out.println("MKServiceImpl insertProduct Start");
		System.out.println("MKServiceImpl product->"+product);
		result = mk_Dao_Interface.insertProduct(product);
		return result;
	}

	@Override
	public int searchedProductTotal(mkProduct product) {
		System.out.println("MKServiceImpl start searchedProductTotal");
		int seachedProductTotal=mk_Dao_Interface.searchedProductTotal(product);
		System.out.println("MKServiceImpl totalProduct ->"+seachedProductTotal);
		return seachedProductTotal;
	}

	@Override
	public List<mkProduct> listSearchProduct(mkProduct product) {
		List<mkProduct> productSearchList=null;
		System.out.println("MKService listSearchProduct Start");
		productSearchList = mk_Dao_Interface.productSearchList(product);
		System.out.println("MK_ServiceImpl listSearchProduct size->"+productSearchList.size());
		return productSearchList;
	}

	@Override
	public int UpdataProduct(mkProduct product) {
		int result=0;
		System.out.println("MKServiceImpl UpdataProduct Start");
		System.out.println("MKServiceImpl UpdataProduct product->"+product);
		result = mk_Dao_Interface.UpdataProduct(product);
		return result;
	}

	@Override
	public int totalFactory(mkFactory factory) {
		System.out.println("MK ServiceImpl totalFactory Start");
		System.out.println("MK ServiceImpl totalFactory factory->"+factory);
		int totalFactory = mk_Dao_Interface.totalFactory(factory);
		System.out.println("MK ServiceImpl totalFactory ->"+totalFactory);
		
		return totalFactory;
	}

	@Override
	public List<mkFactory> listFactory(mkFactory factory) {
		System.out.println("MK ServiceImpl listFactory Start");
		System.out.println("MK Service Impl listFactory factory->"+factory);
		List<mkFactory> listFactory = null;
		listFactory=mk_Dao_Interface.listFactory(factory);
		return listFactory;
	}

	@Override
	public mkFactory factoryDetail(mkFactory factory) {
		System.out.println("MKServiceImpl factory Detail");
		System.out.println("MKServiceImpl factoryDetail->"+factory);
		mkFactory factoryDetail = null;
		factoryDetail = mk_Dao_Interface.factoryDetail(factory);
		return factoryDetail ;
	}

	@Override
	public int insertFactory(mkFactory factory) {
		int result=0;
		System.out.println("MKServiceImpl insertFactory Start");
		System.out.println("MKServiceImpl factory->"+factory);
		result = mk_Dao_Interface.insertFactory(factory);
		return result;
	}

	@Override
	public int searchedFactoryTotal(mkFactory factory) {
		int result = 0;
		System.out.println("MKServiceImpl searchedFactory Total Start");
		System.out.println("MKServiceImpl factory"+factory);
		result= mk_Dao_Interface.searchedFactoryTotal(factory);
		return result;
	}

	@Override
	public List<mkFactory> listSearchFactory(mkFactory factory) {
		System.out.println("MKServiceImpl listSearchFactory Start");
		List<mkFactory> listSearchFactory =null;
		listSearchFactory = mk_Dao_Interface.listSearchFactory(factory);
		return listSearchFactory;
	}

	@Override
	public int UpdateFactory(mkFactory factory) {
		int updateResult = 0;
		System.out.println("MKServiceImpl UpdateFactory Start");
		updateResult = mk_Dao_Interface.updateFactory(factory);
		return updateResult;
	}

	@Override
	public int totalCustomer(mkCustomer customer) {
		int totalCustomer =0;
		System.out.println("MKServiceImpl TotalCustomer Start");
		totalCustomer = mk_Dao_Interface.totalCustomer(customer);
		return totalCustomer;
	}

	@Override
	public List<mkCustomer> listCustomer(mkCustomer customer) {
		System.out.println("MK_Service Impl listCustomer Start");
		List<mkCustomer> listCustomer = null;
		listCustomer = mk_Dao_Interface.listCustomer(customer);
		return listCustomer;
	}

	@Override
	public mkCustomer getCustomerDetail(mkCustomer customer) {
		System.out.println("MK_Service_Impl getCustomerDetail Start");
		mkCustomer getCustomerDetail  = null;
		getCustomerDetail = mk_Dao_Interface.getCustomerDetail(customer);
		return getCustomerDetail;
	}

	@Override
	public int searchedCustomerTotal(mkCustomer customer) {
		System.out.println("MK_Service_Impl searchedCustomerTotal Start");
		int searchedCustomerTotal = 0;
		searchedCustomerTotal = mk_Dao_Interface.searchedCustomerTotal(customer);
		return searchedCustomerTotal;
	}

	@Override
	public List<mkCustomer> listSearchCustomer(mkCustomer customer) {
		System.out.println("MK_Service_Impl listSearhceCustomer Start");
		List<mkCustomer> listSearchCustomer =null;
		listSearchCustomer = mk_Dao_Interface.listSearchCustomer(customer);
		return listSearchCustomer;
	}

	@Override
	public int UpdateCustomer(mkCustomer customer) {
		System.out.println("MK_Service_Impl UpdateCustomer Start");
		int updateResult =0;
		updateResult =mk_Dao_Interface.UpdateCustomer(customer);
		return updateResult;
	}

	@Override
	public int insertCustomer(mkCustomer customer) {
		System.out.println("MK_Service Impl CreateCustomer Start");
		int result=0;
		System.out.println("MKServiceImpl customer->"+customer);
		result = mk_Dao_Interface.insertCustomer(customer);
		return result;
	}

	@Override
	public List<mkProduct> proCategory(mkProduct mkProduct) {
		System.out.println("MK_Service Impl proCategory Start");
		List<mkProduct> proCategory =null;
		proCategory=mk_Dao_Interface.proCategory(mkProduct);
		
		return proCategory;
	}

	@Override
	public List<mkProduct> fList(mkProduct product) {
		System.out.println("MK_Service Impl fList Start");
		List<mkProduct> fList =null;
		fList = mk_Dao_Interface.fList(product);
		return fList;
	}

	@Override
	public List<mkEmployee> listEmp(mkEmployee employee) {
		System.out.println("MK_Service Impl listEmp Start");
		List<mkEmployee> emp=null;
		emp=mk_Dao_Interface.employeeList(employee);
		return emp;
	}

	@Override
	public List<mkCustomer> custCategory(mkCustomer customer) {
		System.out.println("MK_Service Impl custCategory Start");
		List<mkCustomer> custCategory = null;
		custCategory=mk_Dao_Interface.custCategory(customer);
		return custCategory;
	}


	@Override
	public List<mkEmployee> searchEmpList(mkEmployee emp) {
		System.out.println("MK_Service Impl SearchEmpList Start");
		System.out.println("MK_Dao_Impl Start.... ");
		List<mkEmployee> empList =null;
		empList = mk_Dao_Interface.CusemployeeList(emp);
		return empList;
	}







	}



	

	 

