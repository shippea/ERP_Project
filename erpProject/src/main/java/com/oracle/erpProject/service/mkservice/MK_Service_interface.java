package com.oracle.erpProject.service.mkservice;

import java.util.List;


import com.oracle.erpProject.model.mkmodel.mkCustomer;
import com.oracle.erpProject.model.mkmodel.mkEmployee;
import com.oracle.erpProject.model.mkmodel.mkFactory;
import com.oracle.erpProject.model.mkmodel.mkProduct;

public interface MK_Service_interface {

	List<mkProduct> listProduct(mkProduct product);

	mkProduct getProductDetail(mkProduct product);

	int totalProduct(mkProduct product);

	int insertProduct(mkProduct product);

	int searchedProductTotal(mkProduct product);

	List<mkProduct> listSearchProduct(mkProduct product);

	int UpdataProduct(mkProduct product);

	int totalFactory(mkFactory factory);

	List<mkFactory> listFactory(mkFactory factory);

	mkFactory factoryDetail(mkFactory factory);

	int UpdateCustomer(mkCustomer customer);

	int insertCustomer(mkCustomer customer);

	List<mkCustomer> listCustomer(mkCustomer customer);

	int totalCustomer(mkCustomer customer);

	List<mkCustomer> listSearchCustomer(mkCustomer customer);

	int searchedCustomerTotal(mkCustomer customer);

	mkCustomer getCustomerDetail(mkCustomer customer);

	int UpdateFactory(mkFactory factory);

	List<mkFactory> listSearchFactory(mkFactory factory);

	int searchedFactoryTotal(mkFactory factory);

	int insertFactory(mkFactory factory);

	List<mkProduct> proCategory(mkProduct mkProduct);

	List<mkProduct> fList(mkProduct product);

	List<mkEmployee> listEmp(mkEmployee employee);

	List<mkCustomer> custCategory(mkCustomer customer);



	List<mkEmployee> searchEmpList(mkEmployee emp);



}
