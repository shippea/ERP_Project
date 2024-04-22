package com.oracle.erpProject.dao.sldao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.oracle.erpProject.model.slmodel.SLBuying;
import com.oracle.erpProject.model.slmodel.SLBuying_detail;
import com.oracle.erpProject.model.slmodel.SLMake;
import com.oracle.erpProject.model.slmodel.SLProduct;
import com.oracle.erpProject.model.slmodel.SLSale;
import com.oracle.erpProject.model.slmodel.SLSale_detail;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class SL_DaoImpl implements SL_Dao_Interface{
	
	private  final PlatformTransactionManager transactionManager;
	private final SqlSession session;

	@Override
	public int totalbuyingCnt() {
		int totalbuyingCnt = session.selectOne("LsltotalbuyingCnt");
		return totalbuyingCnt;
	}

	@Override
	public List<SLBuying> buyAlllist(SLBuying buying) {
		System.out.println("SL_DaoImpl buyAlllist Start ->>>>>>");
		
		List<SLBuying> buyAlllist = session.selectList("LslbuyAlllist", buying);
		
		
		System.out.println("SL_DaoImpl buyAlllist ->>>>>>" + buyAlllist );
		
		return buyAlllist;
	}

	
	
	@Override
	public int dateSearchtotCnt(SLBuying buying) {
		System.out.println("SL_DaoImpl dateSearchtotCnt Start ->>>>>>");
		
		
		int dateSearchtotCnt = session.selectOne("LsldateSearchtotCnt", buying);
	
		
		return dateSearchtotCnt;
	}

	
	@Override
	public List<SLBuying> dateSearchAllList(SLBuying buying) {
		System.out.println("SL_DaoImpl dateSearchAllList Start ->>>>>>");
		System.out.println("SL_DaoImpl dateSearchAllList buying ->"+buying);
		System.out.println("SL_DaoImpl dateSearchAllList getBuy_date ->"+buying.getBuy_date());
		
		List<SLBuying> dateSearchAllList = session.selectList("LsldateSearchAllList",buying);
		System.out.println("SL_DaoImpl dateSearchAllList dateSearchAllList.size() ->>>>>>"+dateSearchAllList.size());
		
		return dateSearchAllList;
	}

	// 구매 상태 검색 
	@Override
	public int statusSearchtotCnt(SLBuying buying) {
		int statusSearchtotCnt = session.selectOne("LslstatusSearchtotCnt",buying);
		return statusSearchtotCnt;
	}
	
	@Override
	public List<SLBuying> StatusSearchAllList(SLBuying buying) {
		List<SLBuying> StatusSearchAllList = session.selectList("LslStatusSearchAllList", buying);
		return StatusSearchAllList;
	}

	
	
	
	@Override
	public SLBuying buyingDetail(SLBuying buying) {
		System.out.println("SL_DaoImpl buyingDetail Start ->>>>>>");
		
		SLBuying buyingDetail = session.selectOne("LslbuyingDetail",buying);
		
		
		return buyingDetail;
	}


	@Override
	public List<SLBuying> productDetail(SLBuying buying) {
		System.out.println("SL_DaoImpl productDetail Start  kkk ->>>>>>");
		System.out.println("SL_DaoImpl productDetail Start  buying->"+buying);
		// 전체 품목 Get 
		List<SLBuying> productDetail = session.selectList("LslproductDetail", buying);
		
		return productDetail;
	}

	// 제품 리스트
	@Override
	public List<SLProduct> productList() {
		System.out.println("SL_DaoImpl productList  kkk ->>>>>>");

		List<SLProduct> productList = session.selectList("LslproductList");
		System.out.println("SL_DaoImpl productList  ㅎㅎㅎ ->>>>>>" +productList);
		
		return productList;
	}


	@Override
	public List<SLBuying_detail> getProductList(SLBuying_detail slBuying_detail) {
		
		List<SLBuying_detail> getProductList = session.selectList("LslgetProductList",slBuying_detail);
		return getProductList;
	}

	
	@Override
	public int deleteProduct(SLBuying_detail sLBuying_detail) {
		
		int deleteProduct = session.delete("LsldeleteProduct", sLBuying_detail);
		
		return deleteProduct;
	}

	
	
	
	@Override
	public int buyingModify(SLBuying buying) {
		
		System.out.println("SL_DaoImpl buyingModify Start>>>>>>");
		
		int result = session.update("LslbuyingModify", buying);
			
		
		
		return result;
	}
	
	
	
	@Override
	public int addProduct(SLBuying_detail slBuying_detail) {
		System.out.println("SL_DaoImpl addProduct Start ->>>>>>");
		System.out.println("SL_DaoImpl addProduct slBuying_detail ->"+slBuying_detail);
		int addProduct = session.insert("LsladdProduct", slBuying_detail);
		return addProduct;
	}

	@Override
	public int productCntModify(SLBuying_detail sLBuying_detail) {
		int productCntModify = session.update("LslproductCntModify",sLBuying_detail);
		
		return productCntModify;
	}

	@Override
	public int buyStatusChange(SLBuying buying) {
		int buyStatusChange = session.update("LslbuyStatusChange", buying);
		
		return buyStatusChange;
	}

	@Override
	public List<SLBuying> customerSearch(SLBuying buying) {
		List<SLBuying> customerSearch = session.selectList("LslcustomerSearch",buying);
		
		System.out.println("customerSearch >>>>>>>>" +customerSearch);
		return customerSearch;
	}

	@Override
	public List<SLBuying> getManagerList(SLBuying buying) {
		
		List<SLBuying> getManagerList = session.selectList("LslgetManagerList", buying);
		System.out.println("getManagerList getManagerList >>>>>>" + getManagerList);
		
		
		return getManagerList;
	}
	
	@Override
	public int buyingApplyWrite(SLBuying buying) {
		
		System.out.println("SL_DaoImpl buyingApplyWrite Start>>>>>>");
		
		int result = 0;
		
		
		System.out.println("DAO    buyingApplyWrite SLBuying >>>>>>" + buying);
		List<SLBuying_detail> productList = buying.getProductList();
		
		TransactionStatus txStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());
		
		try {
			result = session.insert("LslbuyingApplyWrite", buying);
			for(SLBuying_detail  sLBuying_detail :  productList ) {
				System.out.println("DAO sLBuying_detail->"+sLBuying_detail);
				result = session.insert("LslbuyingApplyProductList", sLBuying_detail);
			}
		

			 transactionManager.commit(txStatus);
			 
		
		} catch (Exception e) {
			System.out.println("EmpDaoImpl totalEmp Exception->"+e.getMessage());
			transactionManager.rollback(txStatus);
		}
		
		
		
		return result;
	}
	

	
	
	
	@Override
	public SLBuying checkBuyData(SLBuying buying) {
		
		SLBuying checkBuyData = session.selectOne("LslcheckBuyData", buying);
		
		
		return checkBuyData;
	}

	@Override
	public int searchKeywordtotCnt(SLBuying buying) {
		
		int searchKeywordtotCnt = session.selectOne("LslsearchKeywordtotCnt", buying);
		
		return searchKeywordtotCnt;
	}

	@Override
	public List<SLBuying> keywordSearchAllList(SLBuying buying) {
		
		List<SLBuying> keywordSearchAllList = session.selectList("LslkeywordSearchAllList" , buying);
		
		
		return keywordSearchAllList;
	}

	@Override
	public int closingStatu(SLBuying buying) {
		int closingStatu = session.selectOne("LslclosingStatu", buying);
		return closingStatu;
	}

	

	@Override
	public int checkTransaction(SLBuying buying) {
		
		int checkTransaction = session.selectOne("LslcheckTransaction", buying);
		
		return checkTransaction;
	}

	
	
	/*------------------------------ 판매 --------------------------------------------*/
	
	
	@Override
	public int totalSaleCnt() {
		
		int totalSaleCnt = session.selectOne("LsltotalSaleCnt");
		
		return totalSaleCnt;
	}

	@Override
	public List<SLSale> saleAlllist(SLSale sale) {
		
		List<SLSale> saleAlllist = session.selectList("LslsaleAlllist", sale);
		
		return saleAlllist;
	}

	@Override
	public int saleDateSearchtotCnt(SLSale sale) {
	
		int saleDateSearchtotCnt = session.selectOne("LslsaleDateSearchtotCnt", sale);
		
		return saleDateSearchtotCnt;
	}

	@Override
	public List<SLSale> saleDateSearchAllList(SLSale sale) {
		
		System.out.println("dateSearchAllList sale" + sale);
		
		List<SLSale> dateSearchAllList = session.selectList("LslsaleDateSearchAllList", sale);
		
		return dateSearchAllList;
	}

	@Override
	public int saleStatusSearchtotCnt(SLSale sale) {
		
		int saleStatusSearchtotCnt = session.selectOne("LslsaleStatusSearchtotCnt", sale);
		
		return saleStatusSearchtotCnt;
	}

	@Override
	public List<SLSale> saleStatusSearchAllList(SLSale sale) {
		
		List<SLSale> saleStatusSearchAllList = session.selectList("LslsaleStatusSearchAllList", sale);
		
		return saleStatusSearchAllList;
	}

	@Override
	public int saleSearchKeywordtotCnt(SLSale sale) {
		int saleSearchKeywordtotCnt = session.selectOne("LslsaleSearchKeywordtotCnt" , sale);
		return saleSearchKeywordtotCnt;
	}

	@Override
	public List<SLSale> saleKeywordSearchAllList(SLSale sale) {
		List<SLSale> saleKeywordSearchAllList = session.selectList("LslsaleKeywordSearchAllList", sale);
		
		return saleKeywordSearchAllList;
	}

	@Override
	public List<SLSale> saleProductDetail(SLSale sale) {
		
		List<SLSale> saleProductDetail = session.selectList("LslsaleProductDetail", sale);
		
		return saleProductDetail;
	}

	
	// 판매 상세 페이지 정보
	@Override
	public SLSale saleDetail(SLSale sale) {
		
		SLSale saleDetail = session.selectOne("LslsaleDetail", sale);
		
		
		return saleDetail;
	}
	
	
	@Override
	public int addSaleProduct(SLSale_detail slSales_detail) {
		
		int addSaleProduct = session.insert("LsladdSaleProduct", slSales_detail);
		
		return addSaleProduct;
	}
	
	
	@Override
	public List<SLProduct> saleProductList(SLSale sale) {
		
		List<SLProduct> saleProductList = session.selectList("LslsaleProductList", sale);
		
		return saleProductList;
	}

	// 영업 생산 지시 요청 
	@Override
	public int saleMakeRequest(SLMake make) {
		TransactionStatus txStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());		
		int result = 0;
		try {
			
			result = session.insert("LslsaleMakeRequest", make);
			result = session.insert("LslsaleMakeDetailRequest", make);
			 transactionManager.commit(txStatus);
			 
		} catch (Exception e) {
			System.out.println("EmpDaoImpl totalEmp Exception->"+e.getMessage());
			transactionManager.rollback(txStatus);
		}
		return result;
	}

	
	@Override
	public int saleApplyWrite(SLSale sale) {
		
		System.out.println("SL_DaoImpl buyingApplyWrite Start>>>>>>");
		
		int result = 0;
		
		
		System.out.println("DAO    saleApplyWrite SLSale >>>>>>" + sale);
		List<SLSale_detail> saleProductList = sale.getProductList();
		
		TransactionStatus txStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());
		
		try {
			result = session.insert("LslsaleApplyWrite", sale);
			for(SLSale_detail  slSale_detail :  saleProductList ) {
				System.out.println("DAO slSale_detail->"+slSale_detail);
				
				result = session.insert("LslsaleProductListInsert", slSale_detail);
			}
		

			 transactionManager.commit(txStatus);
			 
		
		} catch (Exception e) {
			System.out.println("EmpDaoImpl totalEmp Exception->"+e.getMessage());
			transactionManager.rollback(txStatus);
		}
		
		
		
		return result;
	}

	@Override
	public int saleModify(SLSale sale) {
		
		int saleModify = session.update("LslsaleModify", sale);
		
		return saleModify;
	}

	@Override
	public int saleStatusChange(SLSale sale) {
		
		int saleStatusChange = session.update("LslsaleStatusChange", sale);
		
		return saleStatusChange;
	}


	// 생산 요청 제품 코드
	@Override
	public SLMake getMakeItemCode(SLMake make) {
		
		SLMake getMakeItemCode = session.selectOne("LslgetMakeItemCode", make);
		
		System.out.println("getMakeItemCode >>>>>>>>>>>>" +getMakeItemCode);
		
		return getMakeItemCode;
	}

	@Override
	public int checkSaleTransaction(SLSale sale) {
		
		int checkSaleTransaction = session.selectOne("LslcheckSaleTransaction", sale);
		
		return checkSaleTransaction;
	}

	@Override
	public int productSaleCntModify(SLSale sale) {
		
		int productSaleCntModify = session.update("LslproductSaleCntModify", sale);
		
		return productSaleCntModify;
	}

	@Override
	public int deleteSaleProduct(SLSale_detail slSales_detail) {
		
		int deleteSaleProduct = session.delete("LsldeleteSaleProduct", slSales_detail);
		
		return deleteSaleProduct;
	}

	@Override
	public int checkData(SLBuying buying) {
		int checkData = session.selectOne("LslcheckData", buying);
		return checkData;
	}

	

	
	
}
