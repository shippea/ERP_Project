package com.oracle.erpProject.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.erpProject.model.slmodel.SLBuying;
import com.oracle.erpProject.model.slmodel.SLProduct;
import com.oracle.erpProject.model.slmodel.SLSale;
import com.oracle.erpProject.service.slservice.SL_Service_Interface;
import com.oracle.erpProject.service.slservice.buyingSalePaging;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SLController {

	private final SL_Service_Interface slService;

	// 구매 페이지
	@GetMapping(value = "buying")
	public String buying(HttpServletRequest request, SLBuying buying, Model model) {
		System.out.println("SlController buying Start >>>>>>");

		int totalbuyingCnt = slService.totalbuyingCnt();

		// paging 처리
		buyingSalePaging buypage = new buyingSalePaging(totalbuyingCnt, buying.getCurrentPage());
		buying.setStart(buypage.getStart());
		buying.setEnd(buypage.getEnd());

		System.out.println("buyingPaging >>>>>>>" + buying);

		List<SLBuying> buyAlllist = slService.buyAlllist(buying);
		System.out.println("SlController buying buyAlllist@@@@ >>>>" + buyAlllist);

		model.addAttribute("buying", buying);
		model.addAttribute("buyAlllist", buyAlllist);
		model.addAttribute("totalbuyingCnt", totalbuyingCnt);
		model.addAttribute("buypage", buypage);

		return "sl/buying";
	}

	// 날짜 검색
	@GetMapping("/selectedDateSearch")
	public String selectedDate(@RequestParam("buy_date") String buy_date, SLBuying buying, Model model) {
		System.out.println("buy_date : " + buy_date);

		buying.setBuy_date(buy_date);

		int dateSearchtotCnt = slService.dateSearchtotCnt(buying);
		System.out.println("dateSearchtotCnt>>>>>>>" + dateSearchtotCnt);

		// paging 처리
		buyingSalePaging buypage = new buyingSalePaging(dateSearchtotCnt, buying.getCurrentPage());
		buying.setStart(buypage.getStart());
		buying.setEnd(buypage.getEnd());

		// 검색 결과를 가져옴
		List<SLBuying> buyAlllist = slService.dateSearchAllList(buying);
		System.out.println("selectedDate buyAlllist->" + buyAlllist);
		System.out.println("selectedDate buyAlllist.size->" + buyAlllist.size());

		model.addAttribute("buyAlllist", buyAlllist);
		model.addAttribute("dateSearchtotCnt", dateSearchtotCnt);
		model.addAttribute("buypage", buypage);

		return "sl/buying";
	}

	// 구매 상태 검색
	@GetMapping("/selectedStatusSearch")
	public String selectedStatus(@RequestParam("buy_status") String buy_status, SLBuying buying, Model model) {

		buying.setBuy_date(buy_status);

		int statusSearchtotCnt = slService.statusSearchtotCnt(buying);
		System.out.println("dateSearchtotCnt>>>>>>>" + statusSearchtotCnt);

		// paging 처리
		buyingSalePaging buypage = new buyingSalePaging(statusSearchtotCnt, buying.getCurrentPage());
		buying.setStart(buypage.getStart());
		buying.setEnd(buypage.getEnd());

		// 검색 결과를 가져옴
		List<SLBuying> buyAlllist = slService.StatusSearchAllList(buying);
		System.out.println("selectedDate buyAlllist->" + buyAlllist);
		System.out.println("selectedDate buyAlllist.size->" + buyAlllist.size());

		model.addAttribute("buyAlllist", buyAlllist);
		model.addAttribute("dateSearchtotCnt", statusSearchtotCnt);
		model.addAttribute("buypage", buypage);

		return "sl/buying";
	}

	// 키워드 검색
	@GetMapping("/searchKeyword")
	public String searchKeyword(@RequestParam("keyword") String keyword, SLBuying buying, Model model) {

		System.out.println("SLController searchKeyword Start");
		System.out.println("SLController searchKeyword Start" + keyword);

		buying.setKeyword(keyword);

		int searchKeywordtotCnt = slService.searchKeywordtotCnt(buying);

		// paging 처리
		buyingSalePaging buypage = new buyingSalePaging(searchKeywordtotCnt, buying.getCurrentPage());
		buying.setStart(buypage.getStart());
		buying.setEnd(buypage.getEnd());

		// 검색 결과를 가져옴
		List<SLBuying> buyAlllist = slService.keywordSearchAllList(buying);
		System.out.println("selectedDate buyAlllist->" + buyAlllist);
		System.out.println("selectedDate buyAlllist.size->" + buyAlllist.size());

		model.addAttribute("buyAlllist", buyAlllist);
		model.addAttribute("dateSearchtotCnt", searchKeywordtotCnt);
		model.addAttribute("buypage", buypage);

		return "sl/buying";
	}

	// 구매 상세 페이지
	@GetMapping(value = "buyDetail")
	public String buyDetail(HttpServletRequest request, SLBuying buying, Model model) {
		System.out.println("buyDetail Start ->>>>>>>>>>");
		int cust_no = Integer.parseInt(request.getParameter("cust_no"));
		String buy_date = request.getParameter("buy_date");

		buying.setCust_no(cust_no);
		buying.setBuy_date(buy_date);

		// 구매 상세 페이지 정보
		SLBuying buyingDetail = slService.buyingDetail(buying);
		System.out.println("buyingDetail >>>>>>" + buyingDetail);

		// 구매 제품 정보 리스트
		List<SLBuying> productDetail = slService.productDetail(buying);
		System.out.println("productDetail >>>>>>" + productDetail.size());
		System.out.println("productDetail @@@@@@" + productDetail);

		// 제품 리스트
		List<SLProduct> productList = slService.productList();

		System.out.println("buying->" + buying);

		model.addAttribute("buyingDetail", buyingDetail);
		model.addAttribute("productDetail", productDetail);
		model.addAttribute("productList", productList);

		return "sl/buyDetail";
	}

	// 구매 등록 페이지
	@GetMapping(value = "buyingApply")
	public String buyingApply(SLBuying buying, Model model) {

		LocalDate today = LocalDate.now();
		String formattedDate = today.format(DateTimeFormatter.BASIC_ISO_DATE);

		buying.setBuy_date(formattedDate);
		// 제품 리스트
		List<SLProduct> productList = slService.productList();
		System.out.println("buying->" + buying);

		model.addAttribute("productList", productList);

		return "sl/buyingApply";
	}

	/*---------------------------- 판매 -------------------------*/

	// 판매 페이지
	@GetMapping(value = "sale")
	String sale(SLSale sale, Model model) {
		System.out.println("SlController sale Start >>>>>>");
		int totalSaleCnt = slService.totalSaleCnt();

		// paging 처리
		buyingSalePaging salepage = new buyingSalePaging(totalSaleCnt, sale.getCurrentPage());
		sale.setStart(salepage.getStart());
		sale.setEnd(salepage.getEnd());

		System.out.println("buyingPaging >>>>>>>" + sale);

		List<SLSale> saleAlllist = slService.saleAlllist(sale);
		System.out.println("SlController buying buyAlllist@@@@ >>>>" + saleAlllist);

		model.addAttribute("sale", sale);
		model.addAttribute("saleAlllist", saleAlllist);
		model.addAttribute("totalSaleCnt", totalSaleCnt);
		model.addAttribute("salepage", salepage);

		return "sl/sale";
	}

	// 날짜 검색
	@GetMapping("/salectedSaleDateSearch")
	public String salectedSaleDate(@RequestParam("s_date") String s_date, SLSale sale, Model model) {
		System.out.println("s_date : " + s_date);

		sale.setS_date(s_date);

		System.out.println("dateSearchtotCnt>>>>>>>" + sale);
		int saleDateSearchtotCnt = slService.saleDateSearchtotCnt(sale);
		System.out.println("dateSearchtotCnt>>>>>>>" + saleDateSearchtotCnt);

		// paging 처리
		buyingSalePaging salepage = new buyingSalePaging(saleDateSearchtotCnt, sale.getCurrentPage());
		sale.setStart(salepage.getStart());
		sale.setEnd(salepage.getEnd());

		// 검색 결과를 가져옴
		List<SLSale> saleAlllist = slService.saleDateSearchAllList(sale);
		System.out.println("selectedDate buyAlllist->" + saleAlllist);
		System.out.println("selectedDate buyAlllist.size->" + saleAlllist.size());

		model.addAttribute("sale", sale);
		model.addAttribute("saleAlllist", saleAlllist);
		model.addAttribute("saleDateSearchtotCnt", saleDateSearchtotCnt);
		model.addAttribute("salepage", salepage);

		return "sl/sale";
	}

	// 판매 상태 검색
	@GetMapping("/salectedStatusSearch")
	public String salectedStatus(@RequestParam("s_status") String s_status, SLSale sale, Model model) {

		sale.setS_date(s_status);

		int saleStatusSearchtotCnt = slService.saleStatusSearchtotCnt(sale);
		System.out.println("dateSearchtotCnt>>>>>>>" + saleStatusSearchtotCnt);

		// paging 처리
		buyingSalePaging salepage = new buyingSalePaging(saleStatusSearchtotCnt, sale.getCurrentPage());
		sale.setStart(salepage.getStart());
		sale.setEnd(salepage.getEnd());

		// 검색 결과를 가져옴
		List<SLSale> saleAlllist = slService.saleStatusSearchAllList(sale);
		System.out.println("salectedStatus saleAlllist->" + saleAlllist);
		System.out.println("selectedDate saleAlllist.size->" + saleAlllist.size());

		model.addAttribute("saleAlllist", saleAlllist);
		model.addAttribute("saleStatusSearchtotCnt", saleStatusSearchtotCnt);
		model.addAttribute("salepage", salepage);

		return "sl/sale";
	}

	// 키워드 검색
	@GetMapping("/saleSearchKeyword")
	public String saleSearchKeyword(@RequestParam("keyword") String keyword, SLSale sale, Model model) {

		System.out.println("SLController saleSearchKeyword Start");
		System.out.println("SLController saleSearchKeyword keyword" + keyword);

		sale.setKeyword(keyword);

		int saleSearchKeywordtotCnt = slService.saleSearchKeywordtotCnt(sale);

		// paging 처리
		buyingSalePaging salepage = new buyingSalePaging(saleSearchKeywordtotCnt, sale.getCurrentPage());
		sale.setStart(salepage.getStart());
		sale.setEnd(salepage.getEnd());

		// 검색 결과를 가져옴
		List<SLSale> saleAlllist = slService.saleKeywordSearchAllList(sale);
		System.out.println("selectedDate saleAlllist->" + saleAlllist);
		System.out.println("selectedDate saleAlllist.size->" + saleAlllist.size());

		model.addAttribute("saleAlllist", saleAlllist);
		model.addAttribute("saleSearchKeywordtotCnt", saleSearchKeywordtotCnt);
		model.addAttribute("salepage", salepage);

		return "sl/sale";
	}

	// 판매 상세 페이지
	@GetMapping(value = "saleDetail")
	public String saleDetail(HttpServletRequest request, SLSale sale, Model model) {
		System.out.println("buyDetail Start ->>>>>>>>>>");
		int cust_no = Integer.parseInt(request.getParameter("cust_no"));
		String s_date = request.getParameter("s_date");

		sale.setCust_no(cust_no);
		sale.setS_date(s_date);

		// 판매 상세 페이지 정보
		SLSale saleDetail = slService.saleDetail(sale);
		System.out.println("saleDetail >>>>>>" + saleDetail);

		// 판매 제품 정보 리스트
		List<SLSale> productDetail = slService.saleProductDetail(sale);
		System.out.println("productDetail >>>>>>" + productDetail.size());
		System.out.println("productDetail @@@@@@" + productDetail);

		LocalDate today = LocalDate.now();
		String formattedMonth = today.format(DateTimeFormatter.ofPattern("yyyyMM"));
		sale.setSt_year_month(formattedMonth);

		List<SLProduct> productList = slService.saleProductList(sale);

		model.addAttribute("saleDetail", saleDetail);
		model.addAttribute("productDetail", productDetail);
		model.addAttribute("productList", productList);

		return "sl/saleDetail";
	}

	// 판매 등록 페이지
	@GetMapping(value = "saleApply")
	public String saleApply(SLSale sale, Model model) {

		LocalDate today = LocalDate.now();
		String formattedDate = today.format(DateTimeFormatter.BASIC_ISO_DATE);

		sale.setS_date(formattedDate);
		// 판매 제품 정보 리스트
		List<SLSale> productDetail = slService.saleProductDetail(sale);
		System.out.println("productDetail >>>>>>" + productDetail.size());
		System.out.println("productDetail @@@@@@" + productDetail);

		String formattedMonth = today.format(DateTimeFormatter.ofPattern("yyyyMM"));
		sale.setSt_year_month(formattedMonth);

		// 제품 리스트
		List<SLProduct> productList = slService.saleProductList(sale);

		model.addAttribute("productList", productList);
		model.addAttribute("productDetail", productDetail);

		return "sl/saleApply";
	}

}
