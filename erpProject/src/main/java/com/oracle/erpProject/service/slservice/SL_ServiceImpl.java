package com.oracle.erpProject.service.slservice;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.erpProject.dao.sldao.SL_Dao_Interface;
import com.oracle.erpProject.model.slmodel.SLBuying;
import com.oracle.erpProject.model.slmodel.SLBuying_detail;
import com.oracle.erpProject.model.slmodel.SLMake;
import com.oracle.erpProject.model.slmodel.SLProduct;
import com.oracle.erpProject.model.slmodel.SLSale;
import com.oracle.erpProject.model.slmodel.SLSale_detail;

import lombok.RequiredArgsConstructor;
@Transactional
@Service
@RequiredArgsConstructor
public class SL_ServiceImpl implements SL_Service_Interface {
	
	private final SL_Dao_Interface slDao;

	@Override
	public int totalbuyingCnt() {
		int totalbuyingCnt = slDao.totalbuyingCnt();
		return totalbuyingCnt;
	}

	@Override
	public List<SLBuying> buyAlllist(SLBuying buying) {
		System.out.println("SL_ServiceImpl buyAlllist Start ->>>>>>");
		List<SLBuying> buyAlllist = slDao.buyAlllist(buying);
		System.out.println("SL_ServiceImpl buyAlllist buyAlllist ->>>>>>" + buyAlllist);
		return buyAlllist;
	}

	// 날짜 검색
	@Override
	public int dateSearchtotCnt(SLBuying buying) {
		System.out.println("SL_ServiceImpl dateSearchtotCnt Start ->>>>>>");
		
		int dateSearchtotCnt = slDao.dateSearchtotCnt(buying);
		return dateSearchtotCnt;
	}
	

	// 날짜 검색 리스트
	@Override
	public List<SLBuying> dateSearchAllList(SLBuying buying) {
		System.out.println("SL_ServiceImpl dateSearchAllList Start ->>>>>>");
		List<SLBuying> dateSearchAllList = slDao.dateSearchAllList(buying);
		
		System.out.println("SL_ServiceImpl dateSearchAllList  ->>>>>>" + dateSearchAllList);
		
		return dateSearchAllList;
	}

	// 구매 상태 검색 
	@Override
	public int statusSearchtotCnt(SLBuying buying) {
		int statusSearchtotCnt = slDao.statusSearchtotCnt(buying);
		
		return statusSearchtotCnt;
	}

	// 구매 상태 검색 리스트 
	@Override
	public List<SLBuying> StatusSearchAllList(SLBuying buying) {
		List<SLBuying> StatusSearchAllList = slDao.StatusSearchAllList(buying);
		
		return StatusSearchAllList;
	}
	
	
	// 수불 마감 여부
	@Override
	public int closingStatu(SLBuying buying) {
		int closingStatu = slDao.closingStatu(buying);
		return closingStatu;
	}

	
	// 구매 상세 페이지
	@Override
	public SLBuying buyingDetail(SLBuying buying) {
		
		System.out.println("SL_ServiceImpl buyingDetail Start ->>>>>>");
		SLBuying buyingDetail =  slDao.buyingDetail(buying);
		 
		 
		return buyingDetail;
	}

	// 구매 상세페이지 상품 리스트 
	@Override
	public List<SLBuying> productDetail(SLBuying buying) {
		System.out.println("SL_ServiceImpl productDetail Start ->>>>>>");
		List<SLBuying> productDetail = slDao.productDetail(buying);
		
		return productDetail;
	}

	@Override
	public List<SLProduct> productList() {
		List<SLProduct> productList = slDao.productList();
		
		return productList;
	}

	

	@Override
	public List<SLBuying_detail> getProductList(SLBuying_detail slBuying_detail) {
		
		List<SLBuying_detail> getProductList = slDao.getProductList(slBuying_detail);
		
		return getProductList;
	}

	
	@Override
	public int deleteProduct(SLBuying_detail sLBuying_detail) {
		
		int deleteProduct = slDao.deleteProduct(sLBuying_detail);
		
		return deleteProduct;
	}

	@Override
	public int buyingModify(SLBuying buying) {
		
		int buyingModify = slDao.buyingModify(buying);
		return buyingModify;
	}

	@Override
	public int productCntModify(SLBuying_detail sLBuying_detail) {
		
		int productCntModify = slDao.productCntModify(sLBuying_detail);
		
		
		return productCntModify;
	}

	@Override
	public int buyStatusChange(SLBuying buying) {
		
		int buyStatusChange = slDao.buyStatusChange(buying);
		
		return buyStatusChange;
	}

	@Override
	public List<SLBuying> customerSearch(SLBuying buying) {
		List<SLBuying> customerSearch = slDao.customerSearch(buying);
		return customerSearch;
	}
	
	@Override
	public List<SLBuying> getManagerList(SLBuying buying) {
		
		List<SLBuying> getManagerList = slDao.getManagerList(buying);
		
		return getManagerList;
	}
	
	

	@Override
	public int addProduct(SLBuying_detail slBuying_detail) {
		int addProduct = slDao.addProduct(slBuying_detail);
		
		return addProduct;
	}
	
	
	@Override
	public int buyingApplyWrite(SLBuying buying) {
	   
		System.out.println("SL_ServiceImpl buyingApplyWrite Start");
		
	    int buyingApplyWrite = slDao.buyingApplyWrite(buying);
	          
	        return buyingApplyWrite;
	   
	}
	

	@Override
	public SLBuying checkBuyData(SLBuying buying) {
		SLBuying checkBuyData = slDao.checkBuyData(buying);
		
		return checkBuyData;
	}

	@Override
	public int searchKeywordtotCnt(SLBuying buying) {
		
		int searchKeywordtotCnt = slDao.searchKeywordtotCnt(buying);
		
		return searchKeywordtotCnt;
	}

	@Override
	public List<SLBuying> keywordSearchAllList(SLBuying buying) {
		List<SLBuying> keywordSearchAllList = slDao.keywordSearchAllList(buying);
		
		return keywordSearchAllList;
	}
	

	@Override
	public int checkTransaction(SLBuying buying) {
		
		int checkTransaction = slDao.checkTransaction(buying);
		
		return checkTransaction;
	}


	
	/*------------------------------------------ 판매 ---------------------------------------------------------*/


	// 판매 페이지 
	@Override
	public int totalSaleCnt() {
		
		int totalSaleCnt = slDao.totalSaleCnt();
		
		return totalSaleCnt;
	}

	// 판매 페이지 리스트 
	@Override
	public List<SLSale> saleAlllist(SLSale sale) {
		
		List<SLSale> saleAlllist = slDao.saleAlllist(sale);
		
		return saleAlllist;
	}

	@Override
	public int saleDateSearchtotCnt(SLSale sale) {
		
		int saleDateSearchtotCnt = slDao.saleDateSearchtotCnt(sale);
		
		return saleDateSearchtotCnt;
	}

	@Override
	public List<SLSale> saleDateSearchAllList(SLSale sale) {
		
		List<SLSale> saleDateSearchAllList = slDao.saleDateSearchAllList(sale);
		
		return saleDateSearchAllList;
	}

	
	
	@Override
	public int saleStatusSearchtotCnt(SLSale sale) {
		int saleStatusSearchtotCnt = slDao.saleStatusSearchtotCnt(sale);
		return saleStatusSearchtotCnt;
	}

	@Override
	public List<SLSale> saleStatusSearchAllList(SLSale sale) {
		List<SLSale> saleStatusSearchAllList = slDao.saleStatusSearchAllList(sale);
		return saleStatusSearchAllList;
	}

	@Override
	public int saleSearchKeywordtotCnt(SLSale sale) {
		
		int saleSearchKeywordtotCnt = slDao.saleSearchKeywordtotCnt(sale);
		
		return saleSearchKeywordtotCnt;
	}

	@Override
	public List<SLSale> saleKeywordSearchAllList(SLSale sale) {
		
		List<SLSale> saleKeywordSearchAllList = slDao.saleKeywordSearchAllList(sale);
		
		return saleKeywordSearchAllList;
	}

	@Override
	public List<SLSale> saleProductDetail(SLSale sale) {
		
		List<SLSale> saleProductDetail = slDao.saleProductDetail(sale);
		
		return saleProductDetail;
	}

	
	// 판매 상세 정보 
	@Override
	public SLSale saleDetail(SLSale sale) {
		
		SLSale saleDetail = slDao.saleDetail(sale);		
		
		return saleDetail;
	}

	
	@Override
	public int addSaleProduct(SLSale_detail slSales_detail) {
		
		int addSaleProduct = slDao.addSaleProduct(slSales_detail);
		
		return addSaleProduct;
	}
	
	
	@Override
	public List<SLProduct> saleProductList(SLSale sale) {
		
		List<SLProduct> saleProductList = slDao.saleProductList(sale);
		
		return saleProductList;
	}
	
	
	// 생산 작업 지시 요청 
	@Override
	public int saleMakeRequest(SLMake make) {
		
		int makeRequest = slDao.saleMakeRequest(make);
		
		return makeRequest;
	}

	@Override
	public int saleApplyWrite(SLSale sale) {
		
		int saleApplyWrite = slDao.saleApplyWrite(sale);
		
		return saleApplyWrite;
	}

	@Override
	public int saleModify(SLSale sale) {
		
		int saleModify = slDao.saleModify(sale);
		
		return saleModify;
	}

	@Override
	public int saleStatusChange(SLSale sale) {
		
		int saleStatusChange = slDao.saleStatusChange(sale);
		
		return saleStatusChange;
	}

	// 생상 요청 제품 코드 
	@Override
	public SLMake getMakeItemCode(SLMake make) {
		
		SLMake getMakeItemCode = slDao.getMakeItemCode(make);
		
		return getMakeItemCode;
	}

	@Override
	public int checkSaleTransaction(SLSale sale) {
		
		int checkSaleTransaction =slDao.checkSaleTransaction(sale);
		
		return checkSaleTransaction;
	}

	@Override
	public int productSaleCntModify(SLSale sale) {
	
		int productSaleCntModify = slDao.productSaleCntModify(sale);
		
		return productSaleCntModify;
	}

	@Override
	public int deleteSaleProduct(SLSale_detail slSales_detail) {
	
		int deleteSaleProduct = slDao.deleteSaleProduct(slSales_detail);
		
		return deleteSaleProduct;
	}

	@Override
	public int checkData(SLBuying buying) {
		int checkData = slDao.checkData(buying);
		return checkData;
	}


	

	

	

	
	

	
	
	
	
	
	
	
	
	
}
