package com.oracle.erpProject.dao.mkdao;

import java.util.List;

import com.oracle.erpProject.domain.Employee;
import com.oracle.erpProject.model.kmmodel.KM_Employee;
import com.oracle.erpProject.model.mkmodel.mkCustomer;
import com.oracle.erpProject.model.mkmodel.mkEmployee;
import com.oracle.erpProject.model.mkmodel.mkFactory;
import com.oracle.erpProject.model.mkmodel.mkProduct;

public interface MK_Dao_Interface {

	List<mkProduct> productList(mkProduct product);

	mkProduct productDetail(mkProduct product);

	int totalProduct(mkProduct product);

	int insertProduct(mkProduct product);

	int searchedProductTotal(mkProduct product);

	List<mkProduct> productSearchList(mkProduct product);

	int UpdataProduct(mkProduct product);

	int totalFactory(mkFactory factory);

	List<mkFactory> listFactory(mkFactory factory);

	mkFactory factoryDetail(mkFactory factory);

	int insertFactory(mkFactory factory);

	int searchedFactoryTotal(mkFactory factory);

	List<mkFactory> listSearchFactory(mkFactory factory);

	int updateFactory(mkFactory factory);

	int totalCustomer(mkCustomer customer);

	List<mkCustomer> listCustomer(mkCustomer customer);

	mkCustomer getCustomerDetail(mkCustomer customer);

	int searchedCustomerTotal(mkCustomer customer);

	List<mkCustomer> listSearchCustomer(mkCustomer customer);

	int UpdateCustomer(mkCustomer customer);

	int insertCustomer(mkCustomer customer);

	List<mkProduct> proCategory(mkProduct mkProduct);

	List<mkProduct> fList(mkProduct product);

	

	List<mkEmployee> employeeList(mkEmployee employee);

	List<mkCustomer> custCategory(mkCustomer customer);

	

	List<mkEmployee> CusemployeeList(mkEmployee emp);

	



}
