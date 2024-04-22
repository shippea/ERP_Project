package com.oracle.erpProject.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.erpProject.domain.Employee;
import com.oracle.erpProject.model.lhsmodel.Product;
import com.oracle.erpProject.model.lhsmodel.RnP_closing;
import com.oracle.erpProject.model.lhsmodel.Stock;
import com.oracle.erpProject.model.lhsmodel.Stock_survey;
import com.oracle.erpProject.service.kmservice.KM_EmployeeService;
import com.oracle.erpProject.service.lhsservice.LHSPaging;
import com.oracle.erpProject.service.lhsservice.LHS_Serivce;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class LHSController {

	private final KM_EmployeeService kmes;
	private final LHS_Serivce lhs;

	// 테스트용 사원리스트 조회
	@RequestMapping(value = "lhs")
	public String lhsListEmp(Model model) {

		System.out.println("lhsController lhsListEmp start...");

		// 사원리스트 조회
		List<com.oracle.erpProject.model.lhsmodel.Employee> listEmp = lhs.getListEmp();

		model.addAttribute("listEmp", listEmp);

		return "lhs/listEmp";
	}

	// 테스트용 사원 인덱스
	@RequestMapping(value = "lhsIndex")
	public String lhsIndex(com.oracle.erpProject.model.lhsmodel.Employee emp, Model model) {

		System.out.println("lhsController lhsIndex start...");

		// 사원데이터 조회
		com.oracle.erpProject.model.lhsmodel.Employee empData = lhs.getDataEmp(emp.getEmp_no());
		System.out.println("getDataEmp emp_name-> " + empData.getEmp_name());

		model.addAttribute("empData", empData);

		return "lhs/index";
	}
	
	// 현재날짜 데이터 
    public static LocalDateTime getLocalDateTime() {
        LocalDateTime now = LocalDateTime.now();

        // 시간이 오전 8시 이전인지 확인
        if (now.getHour() < 8) {
            // 시간이 오전 8시 이전이면 전날로 설정
            now = now.minusDays(1);
        }
        return now;
    }

	
	/****************************************************************************/
		/* 월 재고조회 */

	
	// 월 재고조회 (기초기말)
	@RequestMapping(value = "lhsListStock")
	public String lhsListStock(Stock stock, HttpSession session, Model model) {

		System.out.println("lhsController lhsListStock start...");
		System.out.println("cc: ");
	

		// 사원데이터 조회
		Employee empData = new Employee();
		if (session.getAttribute("emp_no") != null) {
			String empNo = (String) session.getAttribute("emp_no");
			empData = kmes.findByEmpNo(Integer.parseInt(empNo));
		}
		
		// 현재날짜 불러오기
		LocalDateTime now = getLocalDateTime();
		
		// 날짜 string으로 변환
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMM");
        String formattedDate = now.format(formatter);

		// 날짜 = null이면 sysdate 세팅
		if (stock.getSt_year_month() == null) {
			stock.setSt_year_month(formattedDate);
		}
		
		// 월 재고 total수 조회
		int totalStock = lhs.getTotalStock(stock);
		System.out.println("getTotalStock totalStock-> " + totalStock);
		
		// pagingg
		LHSPaging page = new LHSPaging(totalStock, stock.getCurrentPage());
		stock.setStart(page.getStart());
		stock.setEnd(page.getEnd());

		// 재고 리스트 가져오기
		List<Stock> listStock = lhs.getListStock(stock);
		System.out.println("getListStock listSize-> " + listStock.size());
		
		model.addAttribute("empData", empData);
		model.addAttribute("stock", stock);
		model.addAttribute("listStock", listStock);
		model.addAttribute("page", page);

		return "lhs/listStock";

	}

	
	/****************************************************************************/
		/* 재고등록 관리 */

	
	// 재고등록 관리 ((폼 따로 x -> 폼 이동만 관리)
	@RequestMapping(value = "lhsManageFormRegistStock")
	public String lhsManageFormRegistStock(HttpSession session, Model model) {

		System.out.println("lhsController lhsManageFormRegistStock start...");
		
		// 사원데이터 조회 + 관리자만 접근조건 
		Employee empData = new Employee();
		if (session.getAttribute("emp_no") == null) {
			return "redirect:loginForm";
		}
		
		else if (session.getAttribute("emp_no") != null) {
			String empNo = (String) session.getAttribute("emp_no");
			empData = kmes.findByEmpNo(Integer.parseInt(empNo));
			
			if (!empData.getEmpRole().equals("role_admin")) {
				return "redirect:lhsListStock";
			}
		}

		// 현재 날짜 가져오기
		LocalDate currentDate = LocalDate.now();

		// 현재 날짜가 25일보다 작은지 확인
		if (currentDate.getDayOfMonth() < 25) {
			// 25일 미만인 경우
			return "redirect:lhsFormRegistStockNewItem";
		} else {
			// 25일 이상인 경우
			return "redirect:lhsFormRegistStockSurvey";
		}

	}

	
	/****************************************************************************/
		/* 기초재고조사 등록 */
	
	
	// 기초재고 등록 폼
	@RequestMapping(value = "lhsFormRegistStockNewItem")
	public String lhsResgistStockBegin(Stock stock, HttpSession session, Model model) {

		System.out.println("lhsController lhsFormRegistStockNewItem start...");

		// 사원데이터 조회 + 관리자만 접근조건 
		Employee empData = new Employee();
		if (session.getAttribute("emp_no") == null) {
			return "redirect:loginForm";
		}
		
		else if (session.getAttribute("emp_no") != null) {
			String empNo = (String) session.getAttribute("emp_no");
			empData = kmes.findByEmpNo(Integer.parseInt(empNo));
			
			if (!empData.getEmpRole().equals("role_admin")) {
				return "redirect:lhsListStock";
			}
		}

		// 현재날짜 불러오기
		LocalDateTime now = getLocalDateTime();
		
		// 날짜 string으로 변환
		DateTimeFormatter yyyymm = DateTimeFormatter.ofPattern("yyyyMM");
		stock.setSt_year_month(now.format(yyyymm));
        DateTimeFormatter yyyymmdd = DateTimeFormatter.ofPattern("yyyyMMdd");
        stock.setSt_year_month_day(now.format(yyyymmdd));
        
		model.addAttribute("stock", stock);
		model.addAttribute("empData", empData);

		if (empData.getEmpRole().equals("role_admin")) {
			return "lhs/formRegistStockNewItemAdmin";
		}
		return "lhs/formRegistStockNewItem";
	}
	
	// 제품 리스트 조회
	@ResponseBody
	@RequestMapping(value = "lhsListProduct")
	public List<Product> lhsListProduct (Product product, HttpSession session, Model model) {
		
		System.out.println("lhsController lhsListProduct start...");
		
		// 제품 total수 조회
		int totalProduct = lhs.getTotalProduct(product);
		System.out.println("getTotalProduct totalProduct-> " + totalProduct);
		
		// paging
		product.setStart(1);
		product.setEnd(totalProduct);

		// 제품 리스트 조회
		List<Product> listProduct = lhs.getListProduct(product);
		System.out.println("getListProduct listSize-> " + listProduct.size());
		return listProduct;
	}
	
	// 제품 상세정보 조회
	@ResponseBody
	@RequestMapping(value = "lhsGetDataProduct")
	public Product lhsGetDataProduct(Product product, Model model) {
		System.out.println("lhsController lhsGetDataProduct start...");
		
		// 제품정보 조회
		Product productData = lhs.getDataProduct(product);
		
		String dateString = productData.getP_regdate();
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");

        try {
            Date date = inputFormat.parse(dateString);
            productData.setP_regdate(outputFormat.format(date)); 
        } catch (ParseException e) {
            e.printStackTrace();
        }
		
		System.out.println("getDataProduct p_itemcode-> " + productData.getP_itemcode());
		
		return productData; 
		
	}

	// 신제품 재고등록 여부 확인
	@ResponseBody
	@RequestMapping(value = "lhsCheckExistenceNewItem")
	public int lhsCheckNewItem(Product product, HttpSession session, Model model) {

		System.out.println("lhsController lhsCheckExistenceNewItem start...");
		
		// 신제품 등록여부 조회
		int checkStock = lhs.checkExistenceNewItem(product);
		System.out.println("checkExistenceNewItem checkStock-> " + checkStock);
		
		return checkStock;
	}

	// 신제품 기초재고 등록
	@RequestMapping(value = "lhsRegistStockNewItem")
	public String lhsRegistStockNewItem(@RequestBody List<Stock> listStock, HttpSession session, Model model) {

		System.out.println("lhsController lhsRegistStockNewItem start...");

		int resultRegistStock = 0;
		int resultCntRegistStock = 0;
		
		// 신제품 기초재고, 수불마감 등록 확인
		for (Stock stock : listStock) { 
			resultRegistStock = lhs.registStockNewItem(stock);
			if (resultRegistStock == 2) resultCntRegistStock+=2; 
		}
		  
		System.out.println("registStockNewItem resultCnt-> " + resultCntRegistStock);

		return "redirect:lhsListStock";
	}
	
	
	/****************************************************************************/
		/* 실사 재고조사 등록 */

	
	// 실사재고조사 등록 폼
	@RequestMapping(value = "lhsFormRegistStockSurvey")
	public String lhsFormRegistStockSurvey(Stock stock, HttpSession session, Model model) {

		System.out.println("lhsController lhsFormRegistStockSurvey start...");

		// 사원데이터 조회 + 관리자만 접근조건 
		Employee empData = new Employee();
		if (session.getAttribute("emp_no") == null) {
			return "redirect:loginForm";
		}
		
		else if (session.getAttribute("emp_no") != null) {
			String empNo = (String) session.getAttribute("emp_no");
			empData = kmes.findByEmpNo(Integer.parseInt(empNo));
			
			if (!empData.getEmpRole().equals("role_admin")) {
				return "redirect:lhsListStock";
			}
		}
		
		// 현재날짜 불러오기
		LocalDateTime now = getLocalDateTime();
		
		// 날짜 string으로 변환
		DateTimeFormatter yyyymm = DateTimeFormatter.ofPattern("yyyyMM");
		stock.setSt_year_month(now.format(yyyymm));
        DateTimeFormatter yyyymmdd = DateTimeFormatter.ofPattern("yyyyMMdd");
        stock.setSt_year_month_day(now.format(yyyymmdd));
        

		model.addAttribute("stock", stock);
		model.addAttribute("empData", empData);

		if (empData.getEmpRole().equals("role_admin")) {
			return "lhs/formRegistStockSurveyAdmin";
		}
		return "lhs/formRegistStockSurvey";
	}
	
	// 실사재고조사용 물품리스트 조회
	@ResponseBody
	@RequestMapping(value = "lhsListStockEnd")
	public List<Stock> lhsListStockEnd(Stock stock, HttpSession session, Model model) {
		
		System.out.println("lhsController lhsListItem start...");
		
		// 월 재고 total수 조회
		int totalStock = lhs.getTotalStock(stock);
		System.out.println("getTotalStock totalStock-> " + totalStock);
		
		// paging
		stock.setStart(1);
		stock.setEnd(totalStock);

		// 재고리스트 조회
		List<Stock> listStock = lhs.getListStock(stock);
		System.out.println("getListStock listSize-> " + listStock.size());
		
		return listStock;
	}
	
	// 실사재고조사용 물품 상세정보 조회
	@ResponseBody
	@RequestMapping(value = "lhsGetDataStockProduct")
	public Product lhsGetDataStockProduct(Product product, Model model) {
		System.out.println("lhsController lhsGetDataStockProduct start...");
		
		// 제품정보 조회
		Product stockProductData = lhs.getDataStockProduct(product);
		System.out.println("getDataStockProduct p_itemcode-> " + stockProductData.getP_itemcode());
		
		return stockProductData; 
		
	}

	// 실사재고조사 등록
	@ResponseBody
	@RequestMapping(value = "lhsRegistStockSurvey")
	public int lhsRegistStockSurvey(@RequestBody List<Stock_survey> listSurvey, Stock stock, HttpSession session, Model model) {

		System.out.println("lhsController lhsRegistStockSurvey start...");
		
		// 사원데이터 조회
		String empNo = (String) session.getAttribute("emp_no");
		Employee empData = kmes.findByEmpNo(Integer.parseInt(empNo));
		
		Map<String, Object> params = new HashMap<>();
		params.put("p_yyyymmdd", stock.getSt_year_month_day());
		params.put("p_rnpc_gubun", null);
		
		// 1. 수불마감 구분 확인 (프로시져 호출)
		lhs.checkGubunRnPClosing(params);
		
		// 프로시져 out값 가져오기
		int checkGubun = (int) params.get("p_rnpc_gubun");
		System.out.println("checkStatusRnPClosing checkGubun->" + checkGubun);
		
		// 1-1. 수불마감 구분 0인 경우
		if (checkGubun == 0) {
			return 1;
		} 
		
		// 1-2. 수불마감 구분 0이 아닌 경우
		else if (checkGubun > 0) {
			
			stock.setSt_year_month(stock.getSt_year_month_day().substring(0, 6));
			
			// 2. 재고조사 데이터 유무 체크
			int checkStockSurvey = lhs.checkExistenceStockSurvey(stock);
			System.out.println("checkExistenceStockSurvey checkStockSurvey-> " + checkStockSurvey);
			
				// 2-1. 재고조사 데이터가 없는 경우
				if (checkStockSurvey == 0) {
					for (Stock_survey stock_survey : listSurvey) {
						// 재고조사 데이터 등록
						int registResult = lhs.registStockSurvey(stock_survey);
						System.out.println("registStockSurvey registResult-> " + registResult);
					}
				}
				
				// 2-2. 재고조사 데이터가 있는 경우
				else if (checkStockSurvey != 0) {
					
					for (Stock_survey stock_survey : listSurvey) {
					// 3. 제품코드별 재고조사 데이터 유무 체크
						int checkItemcode = lhs.checkExistenceStockSurveyPerItemcode(stock_survey);
						System.out.println("checkExistenceStockSurvey checkItemcode-> " + checkItemcode);
						
						// 3-1. 해당 제품코드 데이터가 없는 경우
						if (checkItemcode == 0) {
							// 재고조사 데이터 등록
							int registResult = lhs.registStockSurvey(stock_survey);
							System.out.println("registStockSurvey registResult-> " + registResult);
						}
						
						// 3-2. 해당 제품코드 데이터가 있는 경우
						else if (checkItemcode != 0) {
							// 재고조사 데이터 업데이트
							int updateResult = lhs.updateStockSurvey(stock_survey);
							System.out.println("registStockSurvey updateResult-> " + updateResult);
						}
					}
				}
		}
		// 실사재고조사 등록 성공 시
		return 0;
	}
	

	/****************************************************************************/
		/* 수불 일일내역 조회 */

	
	// 수불 일일내역1 조회 (구매)
	@RequestMapping(value = "lhsListRnPCondBuy")
	public String lhsListRnPCondBuy(RnP_closing rnpc, HttpSession session, Model model) {

		System.out.println("lhsController lhsListRnPCondBuy start...");

		// 사원데이터 조회
		Employee empData = new Employee();
		if (session.getAttribute("emp_no") != null) {
			String empNo = (String) session.getAttribute("emp_no");
			empData = kmes.findByEmpNo(Integer.parseInt(empNo));
		}
		
		rnpc.setRnpc_filter("구매");
		
		// 현재날짜 불러오기
		LocalDateTime now = getLocalDateTime();
		
		// 날짜 string으로 변환
        DateTimeFormatter yyyymmdd = DateTimeFormatter.ofPattern("yyyyMMdd");
		
		// 날짜 = null이면 sysdate 세팅
		if (rnpc.getRnpc_year_month_day() == null) {
			rnpc.setRnpc_year_month_day(now.format(yyyymmdd));
		}
		
		// date타입 날짜 가져오기
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
			rnpc.setRnpc_date(dateFormat.parse(rnpc.getRnpc_year_month_day()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		// 현재날짜가 몇일인지 체크 (jsp에서 25일 이하이면 월말마감 클릭x 조건 부여)
		LocalDate currentDate = LocalDate.now();
		int today = currentDate.getDayOfMonth();
		
		// 현재날짜 가져오기 (수불마감, 해제시 현재날짜로 하려고)
		String year_month_day = now.format(yyyymmdd);

		// 수불 일일내역(구매) total수 조회
		int totalRnPClosing = lhs.getTotalRnPCondBuy(rnpc);
		System.out.println("getTotalRnPCondBuy totalRnPClosing-> " + totalRnPClosing);
		
		// paging
		LHSPaging page = new LHSPaging(totalRnPClosing, rnpc.getCurrentPage());
		rnpc.setStart(page.getStart());
		rnpc.setEnd(page.getEnd());
		
		// 수불 일일내역(구매) 리스트 조회
		List<RnP_closing> listRnPClosing = lhs.getListRnPCondBuy(rnpc);
		System.out.println("getListRnPCondBuy listSize-> " + listRnPClosing.size());
		
		model.addAttribute("rnpc", rnpc);
		model.addAttribute("today", today);
		model.addAttribute("year_month_day", year_month_day);
		model.addAttribute("empData", empData);
		model.addAttribute("listRnPClosing", listRnPClosing);
		model.addAttribute("page", page);
		
		return "lhs/listRnPCondBuy";
	}
 
	// 수불 일일내역2 조회 (판매)
	@RequestMapping(value = "lhsListRnPCondSale")
	public String lhsListRnPCondSale(RnP_closing rnpc, HttpSession session, Model model) {

		System.out.println("lhsController lhsListRnPCondSale start...");

		// 사원데이터 조회
		Employee empData = new Employee();
		if (session.getAttribute("emp_no") != null) {
			String empNo = (String) session.getAttribute("emp_no");
			empData = kmes.findByEmpNo(Integer.parseInt(empNo));
		}
		
		rnpc.setRnpc_filter("판매");
		
		// 현재날짜 불러오기
		LocalDateTime now = getLocalDateTime();
		
		// 날짜 string으로 변환
        DateTimeFormatter yyyymmdd = DateTimeFormatter.ofPattern("yyyyMMdd");
        
		// 날짜 = null이면 sysdate 세팅
		if (rnpc.getRnpc_year_month_day() == null) {
			rnpc.setRnpc_year_month_day(now.format(yyyymmdd));
		}
		
		// date타입 날짜 가져오기
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
			rnpc.setRnpc_date(dateFormat.parse(rnpc.getRnpc_year_month_day()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		// 현재날짜 25일 이상인지 체크
		LocalDate currentDate = LocalDate.now();
		int today = currentDate.getDayOfMonth();
		
		// 현재날짜 가져오기 (수불마감, 해제시 현재날짜로 하려고)
		String year_month_day = now.format(yyyymmdd);
		
		// 수불 일일내역(판매) total수 조회
		int totalRnPClosing = lhs.getTotalRnPCondSale(rnpc);
		System.out.println("getTotalRnPCondSale totalRnPClosing-> " + totalRnPClosing);
		
		// paging
		LHSPaging page = new LHSPaging(totalRnPClosing, rnpc.getCurrentPage());
		rnpc.setStart(page.getStart());
		rnpc.setEnd(page.getEnd());
		
		// 수불 일일내역(판매) 리스트 조회
		List<RnP_closing> listRnPClosing = lhs.getListRnPCondSale(rnpc);
		System.out.println("getListRnPCondSale listSize-> " + listRnPClosing.size());
		
		model.addAttribute("rnpc", rnpc);
		model.addAttribute("today", today);
		model.addAttribute("year_month_day", year_month_day);
		model.addAttribute("empData", empData);
		model.addAttribute("listRnPClosing", listRnPClosing);
		model.addAttribute("page", page);

		return "lhs/listRnPCondSale";

	}

	// 수불 일일내역3 조회 (생산)
	@RequestMapping(value = "lhsListRnPCondMake")
	public String lhsListRnPCondMake(RnP_closing rnpc, HttpSession session, Model model) {

		System.out.println("lhsController lhsListRnPCondMake start...");

		// 사원데이터 조회
		Employee empData = new Employee();
		if (session.getAttribute("emp_no") != null) {
			String empNo = (String) session.getAttribute("emp_no");
			empData = kmes.findByEmpNo(Integer.parseInt(empNo));
		}
		
		rnpc.setRnpc_filter("생산");
		
		// 현재날짜 불러오기
		LocalDateTime now = getLocalDateTime();
		
		// 날짜 string으로 변환
        DateTimeFormatter yyyymmdd = DateTimeFormatter.ofPattern("yyyyMMdd");
		
		// 날짜 = null이면 sysdate 세팅
		if (rnpc.getRnpc_year_month_day() == null) {
			rnpc.setRnpc_year_month_day(now.format(yyyymmdd));
		}
		
		// date타입 날짜 가져오기
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
			rnpc.setRnpc_date(dateFormat.parse(rnpc.getRnpc_year_month_day()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		// 현재날짜가 몇일인지 체크 (jsp에서 25일 이하이면 월말마감 클릭x 조건 부여)
		LocalDate currentDate = LocalDate.now();
		int today = currentDate.getDayOfMonth();
		
		// 현재날짜 가져오기 (수불마감, 해제시 현재날짜로 하려고)
		String year_month_day = now.format(yyyymmdd);
		
		// 수불 일일내역(생산) total수 조회
		int totalRnPClosing = lhs.getTotalRnPCondMake(rnpc);
		System.out.println("getTotalRnPCondMake totalRnPClosing-> " + totalRnPClosing);
		
		// paging
		LHSPaging page = new LHSPaging(totalRnPClosing, rnpc.getCurrentPage());
		rnpc.setStart(page.getStart());
		rnpc.setEnd(page.getEnd());
		
		// 수불 일일내역(판매) 리스트 조회
		List<RnP_closing> listRnPClosing = lhs.getListRnPCondMake(rnpc);
		System.out.println("getListRnPCondMake listSize-> " + listRnPClosing.size());
		
		model.addAttribute("rnpc", rnpc);
		model.addAttribute("today", today);
		model.addAttribute("year_month_day", year_month_day);
		model.addAttribute("empData", empData);
		model.addAttribute("listRnPClosing", listRnPClosing);
		model.addAttribute("page", page);

		return "lhs/listRnPCondMake";

	}

	// 수불 일일내역4 조회 (재고조사)
	@RequestMapping(value = "lhsListRnPCondSurvey")
	public String lhsListRnPCondSurvey(RnP_closing rnpc, HttpSession session, Model model) {

		System.out.println("lhsController lhsListRnPCondSurvey start...");

		// 사원데이터 조회
		Employee empData = new Employee();
		if (session.getAttribute("emp_no") != null) {
			String empNo = (String) session.getAttribute("emp_no");
			empData = kmes.findByEmpNo(Integer.parseInt(empNo));
		}
		
		rnpc.setRnpc_filter("재고조사");
		
		// 현재날짜 불러오기
		LocalDateTime now = getLocalDateTime();
		
		// 날짜 string으로 변환
        DateTimeFormatter yyyymmdd = DateTimeFormatter.ofPattern("yyyyMMdd");
		
		// 날짜 = null이면 sysdate 세팅
		if (rnpc.getRnpc_year_month_day() == null) {
			rnpc.setRnpc_year_month_day(now.format(yyyymmdd));
		}
		
		// date타입 날짜 가져오기
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
			rnpc.setRnpc_date(dateFormat.parse(rnpc.getRnpc_year_month_day()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		// 현재날짜가 몇일인지 체크 (jsp에서 25일 이하이면 월말마감 클릭x 조건 부여)
		LocalDate currentDate = LocalDate.now();
		int today = currentDate.getDayOfMonth();
		
		// 현재날짜 가져오기 (수불마감, 해제시 현재날짜로 하려고)
		String year_month_day = now.format(yyyymmdd);

		// 수불 일일내역(재고조사) total수 조회
		int totalRnPClosing = lhs.getTotalRnPCondSurvey(rnpc);
		System.out.println("getTotalRnPCondSurvey totalRnPClosing-> " + totalRnPClosing);
		
		// paging
		LHSPaging page = new LHSPaging(totalRnPClosing, rnpc.getCurrentPage());
		rnpc.setStart(page.getStart());
		rnpc.setEnd(page.getEnd());
		
		// 수불 일일내역(재고조사) 리스트 조회
		List<RnP_closing> listRnPClosing = lhs.getListRnPCondSurvey(rnpc);
		System.out.println("getListRnPCondSurvey listSize-> " + listRnPClosing.size());
		
		model.addAttribute("rnpc", rnpc);
		model.addAttribute("today", today);
		model.addAttribute("year_month_day", year_month_day);
		model.addAttribute("empData", empData);
		model.addAttribute("listRnPClosing", listRnPClosing);
		model.addAttribute("page", page);

		/*
		 * if (empData.getEmpRole().equals("role_admin")) { return
		 * "lhs/listRnPCondSurveyAdmin"; }
		 */
		return "lhs/listRnPCondSurvey";

	}

	// 수불마감 버튼
	@ResponseBody
	@RequestMapping(value = "lhsClosingRnP")
	public int lhsClosingRnP(Employee emp, RnP_closing rnpc, Model model) {
		
		System.out.println("lhsController lhsClosingRnP start...");
		
		// 수불마감 함수 실행
		int resultStatus = lhs.closingRnP(rnpc);
		
		// 각 상태값에 대해 jsp에서 처리
		if (resultStatus == 0) {
			System.out.println("수불마감 성공");
		}
		else if (resultStatus == 1) {
			System.out.println("이미 수불마감 상태입니다");
		}
		else if (resultStatus == -1 ) {
			System.out.println("오류발생");
		}

		return resultStatus;
	}

	// 마감해제 버튼
	@ResponseBody
	@RequestMapping(value = "lhsUnclosingRnP")
	public int lhsUnclosingRnP(Employee emp, RnP_closing rnpc, Model model) {
		
		System.out.println("lhsController lhsUnclosingRnP start...");
		
		// 마감해제 함수 실행
		int resultStatus = lhs.unclosingRnP(rnpc);
		
		// 각 상태값에 대해 jsp에서 처리
		if (resultStatus == 0) {
			System.out.println("마감해제 성공");
		}
		else if (resultStatus == 1) {
			System.out.println("수불마감 먼저 진행해주세요");
		}
		else if (resultStatus == -1 ) {
			System.out.println("오류발생");
		}
		
		return resultStatus;
	}

	// 월말마감 버튼
	@ResponseBody
	@RequestMapping(value = "lhsMonthlyClosing")
	public int lhsMonthlyClosing(Employee emp, RnP_closing rnpc, Model model) {

		System.out.println("lhsController lhsMonthlyClosing start...");
		
		// 월말마감 함수 실행
		int resultStatus = lhs.monthlyClosing(rnpc);
		
		// 각 상태값에 대해 jsp에서 처리
		if (resultStatus == 0) {
			System.out.println("월말마감 성공");
		}
		else if (resultStatus == 1) {
			System.out.println("수불마감 먼저 진행해주세요");
		}
		else if (resultStatus == -1 ) {
			System.out.println("실사 재고조사 먼저 진행해주세요");
		}

		return resultStatus;
	}

} // class
