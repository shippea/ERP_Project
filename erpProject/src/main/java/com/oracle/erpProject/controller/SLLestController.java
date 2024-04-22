package com.oracle.erpProject.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.erpProject.model.slmodel.SLBuying;
import com.oracle.erpProject.model.slmodel.SLBuying_detail;
import com.oracle.erpProject.model.slmodel.SLMake;
import com.oracle.erpProject.model.slmodel.SLSale;
import com.oracle.erpProject.model.slmodel.SLSale_detail;
import com.oracle.erpProject.service.slservice.SL_Service_Interface;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class SLLestController {

	private final SL_Service_Interface slService;

	// 수불 마감 여부
	@GetMapping("/closingStatus")
	public int closingStatu(SLBuying buying) {

		LocalDate today = LocalDate.now();
		String formattedDate = today.format(DateTimeFormatter.BASIC_ISO_DATE);
		buying.setRnpc_year_month_day(formattedDate);

		//int checkData = slService.checkData(buying);
	
		int closingStatu = slService.closingStatu(buying);
		
		
		return closingStatu;

	}

	// 매니저 리스트
	@GetMapping("/getProductList")
	public List<SLBuying_detail> getProductList(SLBuying_detail sLBuying_detail) {
		System.out.println("getProductList sLBuying_detail" + sLBuying_detail);
		List<SLBuying_detail> getProductList = slService.getProductList(sLBuying_detail);

		System.out.println("getProductList getProductList" + getProductList);

		return getProductList;
	}

	// 구매 상세페이지 수정
	@PostMapping("/buyingModify")
	public int buyingModify(@RequestBody SLBuying buying) {
		// public int buyingModify (SLBuying buying) {
		System.out.println("buyingModify buying ##########" + buying);
		int buyingModify = slService.buyingModify(buying);
		System.out.println("RestController  buyingModify buying buyingModify->" + buyingModify);

		return buyingModify;
	}

	// 구매 상세페이지 제품 추가
	@PostMapping("/addProduct")
	public int buyingDetailModify(SLBuying_detail sLBuying_detail) {

		System.out.println("sLBuying_detail: " + sLBuying_detail);

		int addProduct = slService.addProduct(sLBuying_detail);
		return addProduct;
	}

	// 구매 상세페이지 제품 수정
	@PostMapping("/productCntModify")
	public int productCntModify(@RequestBody SLBuying_detail sLBuying_detail) {
		System.out.println("deleteProduct productCntModify >>>>>" + sLBuying_detail);
		int productCntModify = slService.productCntModify(sLBuying_detail);
		System.out.println("deleteProduct productCntModify >>>>>" + productCntModify);

		return productCntModify;
	}

	// 구매 상세페이지 제품 삭제
	@PostMapping("/deleteProduct")
	public int deleteProduct(SLBuying_detail sLBuying_detail) {
		System.out.println("deleteProduct SLBuying_detail >>>>>" + sLBuying_detail);

		int deleteProduct = slService.deleteProduct(sLBuying_detail);

		return deleteProduct;
	}

	// 구매 진행 상태 변경
	@PostMapping("/buyStatusChange")
	public int buyStatusChange(@RequestBody SLBuying buying) {

		int buyStatusChange = slService.buyStatusChange(buying);

		return buyStatusChange;
	}

	// 구매 등록 페이지 거래처 검색
	@PostMapping("/customerSearch")
	public List<SLBuying> customerSearch(@RequestBody SLBuying buying) {
		System.out.println("customerSearch buying ######" + buying);
		List<SLBuying> customerSearch = slService.customerSearch(buying);

		System.out.println("customerSearch>>>>>>>>>" + customerSearch);

		return customerSearch;
	}

	// 구매 등록 페이지 매니저 옵션
	@PostMapping("/getManagerList")
	public List<SLBuying> getManagerList(SLBuying buying) {

		System.out.println("getManagerList buying ######" + buying);
		List<SLBuying> getManagerList = slService.getManagerList(buying);

		System.out.println("SLLestController getManagerList>>>>>>>>>" + getManagerList.size());

		return getManagerList;
	}

	// 금일 구매 거래 조회
	@PostMapping("/checkBuyTransaction")
	int checkTransaction(@RequestBody SLBuying buying) {

		System.out.println("SLLestController checkTransaction buying >>>>>>>>>" + buying);
		int result = slService.checkTransaction(buying);

		return result;
	}

	// 구매 등록
	@PostMapping("/buyingApplyWrite")
	public String buyingApplyWrite(@RequestBody SLBuying buying) {

		System.out.println("SLLestController buyingApplyWrite Start >>>>>");

		System.out.println("SLLestController buyingApplyWrite SLBuing >>>>>" + buying);

		int result = slService.buyingApplyWrite(buying);

		if (result > 0) {
			return "redirect:/buying";
		} else {
			return "error";
		}
	}

	/*---------------------------------- 판 매 ---------------------------------------*/

	// 제품 생산 요청
	@PostMapping("/makeRequest")
	public int saleMakeRequest(@RequestBody SLMake make) {

		System.out.println("SLLestController makeRequest SLMake >>>" + make);
		int result = slService.saleMakeRequest(make);

		return result;
	}

	// 판매 등록
	@PostMapping("/saleApplyWrite")
	public String saleApplyWrite(@RequestBody SLSale sale) {

		System.out.println("SLLestController makeRequest SLMake >>>" + sale);

		int result = slService.saleApplyWrite(sale);

		if (result > 0) {
			return "redirect:/sale";
		} else {
			return "error";
		}
	}

	// 판매 상세페이지 제품 추가
	@PostMapping("/addSaleProduct")
	public int buyingDetailModify(SLSale_detail slSales_detail) {

		System.out.println("sLBuying_detail: " + slSales_detail);

		int addProduct = slService.addSaleProduct(slSales_detail);
		return addProduct;
	}

	// 판매 상세페이지 글 수정
	@PostMapping("/saleModify")
	public int saleModify(@RequestBody SLSale sale) {

		int saleModify = slService.saleModify(sale);

		return saleModify;
	}

	// 판매 제품 삭제
	
	@PostMapping("/deleteSaleProduct")
	public int deleteSaleProduct(SLSale_detail slSales_detail) {
		System.out.println("deleteSaleProduct Start >>>>>>>>>");
		
		int deleteSaleProduct = slService.deleteSaleProduct(slSales_detail);
		
		return deleteSaleProduct;
	}
	
	
	// 판매 상태 변경
	@PostMapping("/saleStatusChange")

	public int saleStatusChange(@RequestBody SLSale sale) {

		int saleStatusChange = slService.saleStatusChange(sale);

		return saleStatusChange;
	}

	// 생산 요청 제품 코드
	@GetMapping("/getMakeItemCode")
	public SLMake getMakeItemCode(SLMake make) {

		System.out.println("getMakeItemCode make >>>>>>>>>>>>>" + make);

		SLMake getMakeItemCode = slService.getMakeItemCode(make);

		return getMakeItemCode;
	}

	// 금일 판매 거래 조회
	@PostMapping("/checkSaleTransaction")
	public int checkSaleTransaction(@RequestBody SLSale sale) {

		int result = slService.checkSaleTransaction(sale);

		return result;
	}

	// 판매 상세페이지 제품 수정
	@PostMapping("/productSaleCntModify")
	public int productSaleCntModify(@RequestBody SLSale sale) {
		System.out.println("productSaleCntModify >>>>>" + sale);
		int productCntModify = slService.productSaleCntModify(sale);
		System.out.println("productSaleCntModify >>>>>" + productCntModify);

		return productCntModify;
	}
	
	

}