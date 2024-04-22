package com.oracle.erpProject.dao.lhsdao;

import java.util.List;
import java.util.Map;

import com.oracle.erpProject.model.lhsmodel.Employee;
import com.oracle.erpProject.model.lhsmodel.Product;
import com.oracle.erpProject.model.lhsmodel.RnP_closing;
import com.oracle.erpProject.model.lhsmodel.Stock;
import com.oracle.erpProject.model.lhsmodel.Stock_survey;



public interface LHS_Dao {

	// 테스트용 사원리스트 조회
	List<Employee> getListEmp();

	
	/********************************************/
		/* 공통 */
	
	
	// 사원정보 조회
	Employee getDataEmp(int emp_no);

	
	/********************************************/
		/* 월 재고조회 */
	
	
	// 월 재고 total수 조회
	int getTotalStock(Stock stock);
	// 월 재고리스트 조회
	List<Stock> getListStock(Stock stock);

	
	/********************************************/
		/* 기초재고조사 등록 */
	
	// 제품 total수 조회
	int getTotalProduct(Product product);
	// 제품 리스트 조회
	List<Product> getListProduct (Product product);
	
	// 제품 상세정보 조회
	Product getDataProduct(Product product);
	
	// 신제품 재고등록 여부 확인
	int checkExistenceNewItem(Product product);

	// 신제품 기초재고 등록
	int registStockNewItem(Stock stock);
	
	
	/********************************************/
		/* 실사 재고조사 등록 */

	
	// 실사 재고조사 물품 상세정보 조회
	Product getDataStockProduct(Product product);
	
	// 1. 수불마감 구분 확인 (프로시져 호출)
	void checkGubunRnPClosing(Map<String, Object> params);
	
	// 2. 재고조사 데이터 유무 체크
	int checkExistenceStockSurvey(Stock stock);
	
	// 3. 제품코드별 재고조사 데이터 유무 체크
	int checkExistenceStockSurveyPerItemcode(Stock_survey stock_survey);

	// 재고조사 데이터 등록
	int registStockSurvey(Stock_survey stock_survey);
	
	// 재고조사 데이터 업데이트
	int updateStockSurvey(Stock_survey stock_survey);

	
	
	/********************************************/
		/* 수불 일일내역 조회 */

	
	// 수불 일일내역1 total수 조회 (구매)
	int getTotalRnPCondBuy(RnP_closing rnpc);
	// 수불 일일내역1 리스트 조회 (구매)
	List<RnP_closing> getListRnPCondBuy(RnP_closing rnpc);
		
	// 수불 일일내역2 total수 조회 (판매)
	int getTotalRnPCondSale(RnP_closing rnpc);
	// 수불 일일내역2 리스트 조회 (판매)
	List<RnP_closing> getListRnPCondSale(RnP_closing rnpc);
	
	// 수불 일일내역3 total수 조회 (생산)
	int getTotalRnPCondMake(RnP_closing rnpc);
	// 수불 일일내역3 리스트 조회 (생산)
	List<RnP_closing> getListRnPCondMake(RnP_closing rnpc);
	
	// 수불 일일내역4 total수 조회 (재고조사)
	int getTotalRnPCondSurvey(RnP_closing rnpc);
	// 수불 일일내역4 리스트 조회 (재고조사)
	List<RnP_closing> getListRnPCondSurvey(RnP_closing rnpc);

	// 수불마감 버튼
	int closingRnP(RnP_closing rnpc);

	// 마감해제 버튼
	int unclosingRnP(RnP_closing rnpc);

	// 월말마감 버튼
	int monthlyClosing(RnP_closing rnpc);




}
