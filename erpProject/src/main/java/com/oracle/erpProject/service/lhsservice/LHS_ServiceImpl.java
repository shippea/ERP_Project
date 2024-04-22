package com.oracle.erpProject.service.lhsservice;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.oracle.erpProject.dao.lhsdao.LHS_Dao;
import com.oracle.erpProject.model.lhsmodel.Employee;
import com.oracle.erpProject.model.lhsmodel.Product;
import com.oracle.erpProject.model.lhsmodel.RnP_closing;
import com.oracle.erpProject.model.lhsmodel.Stock;
import com.oracle.erpProject.model.lhsmodel.Stock_survey;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LHS_ServiceImpl implements LHS_Serivce {
	 
	private final LHS_Dao lhs;
 
	// 테스트용 사원리스트 조회
	@Override
	public List<Employee> getListEmp() {
		List<Employee> listEmp = null;
		listEmp = lhs.getListEmp();
		return listEmp;
	}

	
	/****************************************************************************/
		/* 공통 */
	
	
	// 사원정보 조회
	@Override
	public Employee getDataEmp(int emp_no) {
		Employee empData = null;
		empData = lhs.getDataEmp(emp_no);
		return empData;
	}
	
	
	/****************************************************************************/
		/* 월 재고조회 */

	
	// 월 재고 total수 조회
	@Override
	public int getTotalStock(Stock stock) {
		int totalStock = 0;
		totalStock = lhs.getTotalStock(stock);
		return totalStock;
	}
	
	// 월 재고리스트 조회
	@Override
	public List<Stock> getListStock(Stock stock) {
		List<Stock> listStock = null;
		listStock = lhs.getListStock(stock);
		return listStock;
	}

	
	/****************************************************************************/
		/* 기초재고조사 등록 */
	
	// 제품 total수 조회
	@Override
	public int getTotalProduct(Product product) {
		int totalProduct = 0;
		totalProduct = lhs.getTotalProduct(product);
		return totalProduct;
	}

	// 제품 리스트 조회
	@Override
	public List<Product> getListProduct(Product product) {
		List<Product> listProduct = null;
		listProduct = lhs.getListProduct(product);
		return listProduct;
	}
	
	// 제품 상세정보 조회
	@Override
	public Product getDataProduct(Product product) {
		Product productData = null;
		productData = lhs.getDataProduct(product);
		return productData;
	}
	
	// 신제품 재고등록 여부 확인 
	@Override
	public int checkExistenceNewItem(Product product) {
		int checkStock = 0;
		checkStock = lhs.checkExistenceNewItem(product);
		return checkStock;
	}
	

	// 신제품 기초재고 등록
	@Override
	public int registStockNewItem(Stock stock) {
		int resultRegist = 0;
		resultRegist = lhs.registStockNewItem(stock);
		return resultRegist;
	}
	
	
	/****************************************************************************/
		/* 실사 재고조사 등록 */

	
	// 실사 재고조사 물품 상세정보 조회
	@Override
	public Product getDataStockProduct(Product product) {
		Product productData = null;
		productData = lhs.getDataStockProduct(product);
		return productData;
	}
	
	// 1. 수불마감 구분 확인 (프로시져 호출)
	@Override
	public void checkGubunRnPClosing(Map<String, Object> params) {
		lhs.checkGubunRnPClosing(params);
	}
	
	// 2. 재고조사 데이터 유무 체크
	@Override
	public int checkExistenceStockSurvey(Stock stock) {
		int checkStockSurvey = 0;
		checkStockSurvey = lhs.checkExistenceStockSurvey(stock);
		return checkStockSurvey;
	}

	// 3. 제품코드별 재고조사 데이터 유무 체크
	@Override
	public int checkExistenceStockSurveyPerItemcode(Stock_survey stock_survey) {
		int checkItemcode = 0;
		checkItemcode = lhs.checkExistenceStockSurveyPerItemcode(stock_survey);
		return checkItemcode;
	}

	// 재고조사 데이터 등록
	@Override
	public int registStockSurvey(Stock_survey stock_survey) {
		int registResult = 0;
		registResult = lhs.registStockSurvey(stock_survey);
		return registResult;
	}

	// 재고조사 데이터 업데이트
	@Override
	public int updateStockSurvey(Stock_survey stock_survey) {
		int updateResult = 0;
		updateResult = lhs.updateStockSurvey(stock_survey);
		return updateResult;
	}



	
	/****************************************************************************/
		/* 수불 일일내역 조회 */

	
	// 수불 일일내역1 total수 조회 (구매)
	@Override
	public int getTotalRnPCondBuy(RnP_closing rnpc) {
		int totalRnPClosing = 0;
		totalRnPClosing = lhs.getTotalRnPCondBuy(rnpc);
		return totalRnPClosing;
	}

	
	// 수불 일일내역1 리스트 조회 (구매)
	@Override
	public List<RnP_closing> getListRnPCondBuy(RnP_closing rnpc) {
		List<RnP_closing> listRnPClosing = null;
		listRnPClosing = lhs.getListRnPCondBuy(rnpc);
		return listRnPClosing;
	}
	
	// 수불 일일내역2 total수 조회 (판매)
	@Override
	public int getTotalRnPCondSale(RnP_closing rnpc) {
		int totalRnPClosing = 0;
		totalRnPClosing = lhs.getTotalRnPCondSale(rnpc);
		return totalRnPClosing;
	}
	
	
	// 수불 일일내역2 리스트 조회 (판매)
	@Override
	public List<RnP_closing> getListRnPCondSale(RnP_closing rnpc) {
		List<RnP_closing> listRnPClosing = null;
		listRnPClosing = lhs.getListRnPCondSale(rnpc);
		return listRnPClosing;
	}

	// 수불 일일내역3 total수 조회 (생산)
	@Override
	public int getTotalRnPCondMake(RnP_closing rnpc) {
		int totalRnPClosing = 0;
		totalRnPClosing = lhs.getTotalRnPCondMake(rnpc);
		return totalRnPClosing;
	}
	
	// 수불 일일내역3 리스트 조회 (생산)
	@Override
	public List<RnP_closing> getListRnPCondMake(RnP_closing rnpc) {
		List<RnP_closing> listRnPClosing = null;
		listRnPClosing = lhs.getListRnPCondMake(rnpc);
		return listRnPClosing;
	}
	
	// 수불 일일내역4 total수 조회 (재고조사)
	@Override
	public int getTotalRnPCondSurvey(RnP_closing rnpc) {
		int totalRnPClosing = 0;
		totalRnPClosing = lhs.getTotalRnPCondSurvey(rnpc);
		return totalRnPClosing;
	}

	// 수불 일일내역4 리스트 조회 (재고조사)
	@Override
	public List<RnP_closing> getListRnPCondSurvey(RnP_closing rnpc) {
		List<RnP_closing> listRnPClosing = null;
		listRnPClosing = lhs.getListRnPCondSurvey(rnpc);
		return listRnPClosing;
	}

	// 수불마감 버튼
	@Override
	public int closingRnP(RnP_closing rnpc) {
		int resultStatus = 0;
		resultStatus = lhs.closingRnP(rnpc);
		return resultStatus;
	}

	// 마감해제 버튼
	@Override
	public int unclosingRnP(RnP_closing rnpc) {
		int resultStatus = 0;
		resultStatus = lhs.unclosingRnP(rnpc);
		return resultStatus;
	}

	// 월말마감 버튼
	@Override
	public int monthlyClosing(RnP_closing rnpc) {
		int resultStatus = 0;
		resultStatus = lhs.monthlyClosing(rnpc);
		return resultStatus;
	}



}
