package com.oracle.erpProject.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



import com.oracle.erpProject.model.mkmodel.mkCustomer;
import com.oracle.erpProject.model.mkmodel.mkEmployee;
import com.oracle.erpProject.model.mkmodel.mkFactory;
import com.oracle.erpProject.model.mkmodel.mkProduct;
import com.oracle.erpProject.service.kmservice.KM_EmployeeService;
import com.oracle.erpProject.service.mkservice.MK_Service_interface;
import com.oracle.erpProject.service.mkservice.Paging;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class MkController {

	private final KM_EmployeeService kmes;
	private final MK_Service_interface mk_Service_interface;
	//제품 조회, 수정
	@GetMapping("/productR")
	public String productR(mkProduct product,Model model) {
		System.out.println("MK Controller productR Start...");
		//product count 
		int totalProduct = mk_Service_interface.totalProduct(product);
		System.out.println("MK_Controller Start totalProduct->"+totalProduct);
		
		//paging 작업 
		Paging page = new Paging(totalProduct, product.getCurrentPage());
		product.setStart(page.getStart()); //시작시 1 
		product.setEnd(page.getEnd()); // 시작시 10 
		
		  List<mkProduct> listProduct = mk_Service_interface.listProduct(product);
		  System.out.println("MKController listProduct.size->"+listProduct.size());
		  
		  model.addAttribute("listProduct",listProduct); 
		  model.addAttribute("page", page);
		  model.addAttribute("totalProduct",totalProduct);
		  return "mk/productR";
		  } 
	
	
	//제품 상세 ajax 
	@ResponseBody
	@GetMapping("productDetail")
	public mkProduct productDetail(@RequestParam("p_itemcode") int itemCode ,mkProduct product, Model model ) {
		System.out.println("MK Controller productDetail Start");
	
		mkProduct ProductDetail =null;
		product.setP_itemcode(itemCode);
		
		System.out.println("MK Controller productDetail->"+product);
		ProductDetail = mk_Service_interface.getProductDetail(product);
		model.addAttribute("product",ProductDetail);
	
		return ProductDetail;
	}
	
	// 검색 조건 리스트 
	
	 @GetMapping("listSearch")
	 public String listSearch(mkProduct product, Model model) {
		 //total 
		 int totProduct = mk_Service_interface.searchedProductTotal(product);
		 System.out.println("MK_Controller listSearch totProduct->"+ totProduct);
		 
		 //paging 작업 
		 Paging page = new Paging(totProduct, product.getCurrentPage());
		 product.setStart(page.getStart());
		 product.setEnd(page.getEnd());
		 
		 List<mkProduct> listSearchProduct = mk_Service_interface.listSearchProduct(product);
		 System.out.println("MK_Controller listSearch listSearchProduct list size->"+ listSearchProduct.size());
		 
		 model.addAttribute("totalProduct",totProduct);
		 model.addAttribute("listProduct",listSearchProduct);
		 model.addAttribute("page",page);
		 
		 return "mk/productR";
	 }
	 
	 //수정페이지 조회 결과 
	 @GetMapping("updateFormlistSearch")
	 public String updateproductlistSearch(mkProduct product, Model model) {
		 //total 
		 int totProduct = mk_Service_interface.searchedProductTotal(product);
		 System.out.println("MK_Controller listSearch totProduct->"+ totProduct);
		 
		 //paging 작업 
		 Paging page = new Paging(totProduct, product.getCurrentPage());
		 product.setStart(page.getStart());
		 product.setEnd(page.getEnd());
		 
		 List<mkProduct> listSearchProduct = mk_Service_interface.listSearchProduct(product);
		 System.out.println("MK_Controller listSearch listSearchProduct list size->"+ listSearchProduct.size());
		 
		 model.addAttribute("totalProduct",totProduct);
		 model.addAttribute("listProduct",listSearchProduct);
		 model.addAttribute("page",page);
		 
		 return "mk/productR";
		
	 }

	
	
	// 제품등록 화면
		  
		  @GetMapping("/productC") 
		  public String productC(Model model, mkProduct product,HttpSession session) {
		  System.out.println("MK Controller productC start");
			
		// 사원데이터 조회
			String empNo = (String) session.getAttribute("emp_no");
			System.out.println(empNo);
		
			if (empNo == null) {
				   // 메인 페이지로 이동
			   return "main";
			}
			else {
		  	List<mkProduct> proCategory =null;
			List<mkProduct> fList = null;
			
			
			
			proCategory = mk_Service_interface.proCategory(product);
			fList=mk_Service_interface.fList(product);
			System.out.println("fList->"+fList);
			model.addAttribute("proCategory", proCategory);
			model.addAttribute("fList",fList);
		  return "mk/productC";
			}
	}
		  
	// 제품 등록  로직
		
		@PostMapping(value="writeProduct")
		public String writeProduct(@ModelAttribute mkProduct product, @RequestParam("uploadFile") MultipartFile file, HttpServletRequest request,  RedirectAttributes redirectAttributes,Model model) {
			
			System.out.println("MK_Controller WriteProduct start...");
			

			
			System.out.println("product data->"+product);
			//파일 저장 경로 설정 
			String uploadFolder = request.getSession().getServletContext().getRealPath("/upload/");
			
			if (!file.isEmpty()) {
				String originalFilename = file.getOriginalFilename(); // 원본 파일명
				String extension = originalFilename.substring(originalFilename.lastIndexOf(".")); // 파일 확장자
				String savedFilename = UUID.randomUUID().toString()+extension;
				
				//파일 저장 경로와 파일명을 합쳐 File 객체 생성 
				File saveFile = new File(uploadFolder,savedFilename);
				
				try {
					file.transferTo(saveFile); // 파일 저장 
					product.setP_image(savedFilename); 
				} catch (Exception e) {
					e.printStackTrace();
					redirectAttributes.addFlashAttribute("message","파일 업로드 실패");
					return "redirect:/productC";
				}
			}
			
			

			//제품 정보 저장 로직 구현 
			int insertResult = mk_Service_interface.insertProduct(product);
			if(insertResult>0)
				return"redirect:productU";
			else {
			
				return "forward:productC";
			}
		}
		
		//제품 수정 폼 
		@GetMapping("productU")
		public String productU(mkProduct product,Model model,HttpSession session) {
			
			System.out.println("MK Controller productR Start...");
			System.out.println("MK Controller productR ->"+product);
			// 사원데이터 조회
			String empNo = (String) session.getAttribute("emp_no");
			if (empNo == null) {
				   // 메인 페이지로 이동
			   return "main";
			}
			else {
			//product count 
			int totalProduct = mk_Service_interface.totalProduct(product);
			System.out.println("MK_Controller Start totalProduct->"+totalProduct);
			
			//paging 작업 
			Paging page = new Paging(totalProduct, product.getCurrentPage());
			product.setStart(page.getStart()); //시작시 1 
			product.setEnd(page.getEnd()); // 시작시 10 
			
			  List<mkProduct> listProduct = mk_Service_interface.listProduct(product);
			  System.out.println("MKController listProduct.size->"+listProduct.size());
				List<mkProduct> proCategory =null;
				List<mkProduct> fList = null;
				proCategory = mk_Service_interface.proCategory(product);
				fList=mk_Service_interface.fList(product);
				System.out.println("fList->"+fList);
				model.addAttribute("proCategory", proCategory);
				model.addAttribute("fList",fList);
				model.addAttribute("listProduct",listProduct); 
				model.addAttribute("page", page);
				model.addAttribute("totalProduct",totalProduct);
			
			return "mk/productU";
			}
		}
	 
		// 제품 수정 로직 
		
		@PostMapping("/updateProduct")
	//	public String updateProduct(@ModelAttribute mkProduct product, @RequestParam("uploadFile") MultipartFile file, HttpServletRequest request,  RedirectAttributes redirectAttributes) {
		public String updateProduct(@RequestParam("p_isdeleted") String pIsDeletedString, @ModelAttribute mkProduct product, @RequestParam("uploadFile") MultipartFile file, HttpServletRequest request,  RedirectAttributes redirectAttributes) {
				System.out.println("product"+product);
				int pIsDeleted = Integer.parseInt(pIsDeletedString);
				product.setP_isdeleted(pIsDeleted);
				
				System.out.println("MK_Controller UpdateProductProduct start...");
				System.out.println("product Update data->"+product);
				
				//파일 저장 경로 설정 
				String uploadFolder = request.getSession().getServletContext().getRealPath("/upload/");
				
				if (!file.isEmpty()) {
					String originalFilename = file.getOriginalFilename(); // 원본 파일명
					String extension = originalFilename.substring(originalFilename.lastIndexOf(".")); // 파일 확장자
					String savedFilename = UUID.randomUUID().toString()+extension;
					
					//파일 저장 경로와 파일명을 합쳐 File 객체 생성 
					File saveFile = new File(uploadFolder,savedFilename);
					
					try {
						file.transferTo(saveFile); // 파일 저장 
						product.setP_image(savedFilename); 
						
					} catch (Exception e) {
						e.printStackTrace();
						redirectAttributes.addFlashAttribute("message","파일 업로드 실패");
						return "redirect:/productU";
					}
				}
				
				//제품 정보 저장 로직 구현 
				int updateResult = mk_Service_interface.UpdataProduct(product);
				if(updateResult>0)
					return"redirect:productU";
				else {
				
					return "forward:productU";
				}
			}
		
	// 공장 조회
	@GetMapping("/factoryR")
	public String factoryR(mkFactory factory,Model model) {
		System.out.println("MK Controller factoryR start");
		
	
					
		//product count 
				int totalFactory = mk_Service_interface.totalFactory(factory);
				System.out.println("MK_Controller Start totalFactory->"+totalFactory);
				
				//paging 작업 
				Paging page = new Paging(totalFactory, factory.getCurrentPage());
				factory.setStart(page.getStart()); //시작시 1 
				factory.setEnd(page.getEnd()); // 시작시 10 
				
				  List<mkFactory> listFactory = mk_Service_interface.listFactory(factory);
				  System.out.println("MKController listFactory.size->"+listFactory.size());
				  
				  model.addAttribute("listFactory",listFactory); 
				  model.addAttribute("page", page);
				  model.addAttribute("totalFactory",totalFactory);
			
				  return "mk/factoryR";
					}
	
	
	
	//공장 상세 ajax 
	@ResponseBody
	@GetMapping("factoryDetail")
	public mkFactory factoryDetail(@RequestParam("f_id") int fId ,mkFactory factory, Model model ) {
		System.out.println("MK Controller factoryDetail Start");
	
		mkFactory factoryDetail =null;
		factory.setF_id(fId);
		
		System.out.println("MK Controller  factoryDetail->"+factory);
		factoryDetail = mk_Service_interface.factoryDetail(factory);
		model.addAttribute("factory",factoryDetail);
	
		return factoryDetail;
	}

	
	// 공장 등록
	@GetMapping("/factoryC")
	public String factoryC(HttpSession session) {
		System.out.println("MK Controller factoryC start");
		String empNo = (String) session.getAttribute("emp_no");
		// 사원데이터 조회
		
		if (empNo == null) {
			   // 메인 페이지로 이동
		   return "main";
		}
		else {
			
		return "mk/factoryC";
		}
	}
	
	// 공장 등록 로직 
	@PostMapping("/writeFactory")
	public String writeFactory(@ModelAttribute mkFactory factory,  HttpServletRequest request,  RedirectAttributes redirectAttributes) {
		
		System.out.println("MK_Controller writeFactory start...");
		System.out.println("factory data->"+factory);
		
		
		
		//제품 정보 저장 로직 구현 
		int insertResult = mk_Service_interface.insertFactory(factory);
		if(insertResult>0)
			return"redirect:factoryU";
		else {
		
			return "forward:factoryC";
		}
	}
	
	// 공장 검색
	 @GetMapping("factorySearch")
	 public String factorySearch(mkFactory factory, Model model) {
		 //total 
		 int totFactory = mk_Service_interface.searchedFactoryTotal(factory);
		 System.out.println("MK_Controller factorySearch totFactory->"+ totFactory);
		 
		 //paging 작업 
		 Paging page = new Paging(totFactory, factory.getCurrentPage());
		 factory.setStart(page.getStart());
		 factory.setEnd(page.getEnd());
		 
		 List<mkFactory> listSearchFactory = mk_Service_interface.listSearchFactory(factory);
		 System.out.println("MK_Controller listSearch listSearchFactory list size->"+ listSearchFactory.size());
		 
		 model.addAttribute("totalFactory",totFactory);
		 model.addAttribute("listFactory",listSearchFactory);
		 model.addAttribute("page",page);
		 
		 return "mk/factoryU";
	 }
	
	
	// 공장 수정
	@GetMapping("/factoryU")
	public String factoryU(mkFactory factory,Model model,HttpSession session) {
		System.out.println("MK Controller factoryU start");
		System.out.println("MK Controller factoryR start");
		String empNo = (String) session.getAttribute("emp_no");
		// 사원데이터 조회
		
		if (empNo == null) {
			   // 메인 페이지로 이동
		   return "main";
		}
		else {
		//product count 
				int totalFactory = mk_Service_interface.totalFactory(factory);
				System.out.println("MK_Controller Start totalFactory->"+totalFactory);
				
				//paging 작업 
				Paging page = new Paging(totalFactory, factory.getCurrentPage());
				factory.setStart(page.getStart()); //시작시 1 
				factory.setEnd(page.getEnd()); // 시작시 10 
				
				  List<mkFactory> listFactory = mk_Service_interface.listFactory(factory);
				  System.out.println("MKController listFactory.size->"+listFactory.size());
				  
				  model.addAttribute("listFactory",listFactory); 
				  model.addAttribute("page", page);
				  model.addAttribute("totalFactory",totalFactory);
		
		return "mk/factoryU";
		}
	}
	
	//공장 수정 로직 
	@PostMapping("updateFactory")
	public String updateFactory(@ModelAttribute mkFactory factory,  HttpServletRequest request,  RedirectAttributes redirectAttributes) {

			System.out.println("MK_Controller updateFactory start...");
			System.out.println("factory Update data->"+factory);
			
			
			//제품 정보 저장 로직 구현 
			int updateResult = mk_Service_interface.UpdateFactory(factory);
			if(updateResult>0)
				return"redirect:factoryU";
			else {
			
				return "forward:factoryU";
			}
		}
	
	// 거래처 조회
	@GetMapping("/customerR")
	public String custromerR(mkCustomer customer,Model model,HttpSession session) {
		System.out.println("MK Controller customerR start");
	
		//product count 
		int totalCustomer = mk_Service_interface.totalCustomer(customer);
		System.out.println("MK_Controller Start totalProduct->"+totalCustomer);
	
		
		//paging 작업 
		Paging page = new Paging(totalCustomer, customer.getCurrentPage());
		customer.setStart(page.getStart()); //시작시 1 
		customer.setEnd(page.getEnd()); // 시작시 10 
		
		  List<mkCustomer> listCustomer = mk_Service_interface.listCustomer(customer);
		  System.out.println("MKController listProduct.size->"+listCustomer.size());
		  
		  model.addAttribute("listCustomer",listCustomer); 
		  model.addAttribute("page", page);
		  model.addAttribute("totalCustomer",totalCustomer);
		return "mk/customerR";
		}
	
	
	//거래처 상세 ajax 
	@ResponseBody
	@GetMapping("custDetail")
	public mkCustomer custDetail(@RequestParam("cust_no") int custNo ,mkCustomer customer, Model model ) {
		System.out.println("MK Controller customerDetail Start");
	
		mkCustomer customerDetail =null;
		customer.setCust_no(custNo);
		
		System.out.println("MK Controller customerDetail->"+customer);
		customerDetail = mk_Service_interface.getCustomerDetail(customer);
		System.out.println("customerDetail->"+customerDetail);
		model.addAttribute("customer", customerDetail);
	
		return customerDetail;
	}
	
	@GetMapping("customerSearch")
	 public String customerSearch(mkCustomer customer, Model model) {
		System.out.println("MKController customerSearch ->" + customer); 
		//total 
		 int totCustomer = mk_Service_interface.searchedCustomerTotal(customer);
		 
		 System.out.println("MK_Controller customerSearch totCustomer->"+ totCustomer);
		 
		 //paging 작업 
		 Paging page = new Paging(totCustomer, customer.getCurrentPage());
		 customer.setStart(page.getStart());
		 customer.setEnd(page.getEnd());
		 
		 List<mkCustomer> listSearchCustomer = mk_Service_interface.listSearchCustomer(customer);
		 System.out.println("MK_Controller listSearch listSearchCustomer list size->"+ listSearchCustomer.size());
		 
		 model.addAttribute("totalCustomer",totCustomer);
		 model.addAttribute("listCustomer",listSearchCustomer);
		 model.addAttribute("page",page);
		 
		 return "mk/customerR";
	 }

	/*
	@GetMapping("SelfIntroduction")
	public String SelfIntroduction(HttpSession session, Model model, HttpServletRequest request) {
		System.out.println("MKController start SelafIntroduction");
		
		// 세션에서 로그인된 사용자 정보를 읽어옴
		String loggedInUser = (String) session.getAttribute("userId");
		System.out.println("logedInUser");
		
		if (loggedInUser != null) {
			List<User> introduction = MK_Service_Interface.getintroduction(loggedInUser);
			List<User> skill = MK_Service_Interface.getskill(loggedInUser);
			System.out.println("MKController list.size()" + introduction.size());
			model.addAttribute("datas", introduction);
			model.addAttribute("skills", skill);
			System.out.println(skill);
			
			return "MK_views/SelfIntroduction";
		} else {
			String requestURL = request.getRequestURL().toString();
			session.setAttribute("redirectUrl", requestURL);
			return "/YS_views/login";
		}
	}
*/
	
	// 거래처 등록
	@GetMapping("/customerC")
	public String custromerC(Model model, mkEmployee employee,mkCustomer customer,HttpSession session) {
		
		System.out.println("MKController customerC start");
		String empNo = (String) session.getAttribute("emp_no");
		// 사원데이터 조회
		
		if (empNo == null) {
			   // 메인 페이지로 이동
		   return "main";
		}
		else {
		//거래처 관련 사원 
		List<mkEmployee> emp = null;
		emp = mk_Service_interface.listEmp(employee);
		
		//거래처 카테고리
		List<mkCustomer> custCategory =null;
		custCategory =mk_Service_interface.custCategory(customer);
		
	
		
		
		model.addAttribute("emp", emp);
		model.addAttribute("cust", custCategory);
		System.out.println("emp->"+emp);
		
		return "mk/customerC";
		}
	}
	

	
	// 거래처 수정
	@GetMapping("/customerU")
	public String custromerU(mkCustomer customer, Model model,HttpSession session) {
		System.out.println("MK Controller custromerU start");
		String empNo = (String) session.getAttribute("emp_no");
		// 사원데이터 조회
		
		if (empNo == null) {
			   // 메인 페이지로 이동
		   return "main";
		}
		else {
	
		//product count 
		int totalCustomer = mk_Service_interface.totalCustomer(customer);
		System.out.println("MK_Controller Start totalProduct->"+totalCustomer);
	
		
		//paging 작업 
		Paging page = new Paging(totalCustomer, customer.getCurrentPage());
		customer.setStart(page.getStart()); //시작시 1 
		customer.setEnd(page.getEnd()); // 시작시 10 
		
		  List<mkCustomer> listCustomer = mk_Service_interface.listCustomer(customer);
		  System.out.println("MKController listProduct.size->"+listCustomer.size());
		  
		  model.addAttribute("listCustomer",listCustomer); 
		  model.addAttribute("page", page);
		  model.addAttribute("totalCustomer",totalCustomer);
		return "mk/customerU";
		}
	}
	
	// 거래처 업데이트 로직 
	@PostMapping("/updateCustomer")
	public String updateCustomer(@ModelAttribute mkCustomer customer,  HttpServletRequest request,  RedirectAttributes redirectAttributes) {

		System.out.println("MK_Controller updateCustomer start...");
		System.out.println("Customer Update data->"+customer);
		
		
		//제품 정보 저장 로직 구현 
		int updateResult = mk_Service_interface.UpdateCustomer(customer);
		if(updateResult>0)
			return"redirect:customerU";
		else {
		
			return "forward:customerU";
		}
	}
	
	// 거래처 등록 로직 
	@PostMapping("/createCustomer")
	public String writeCustomer( @ModelAttribute mkCustomer customer,  HttpServletRequest request,  RedirectAttributes redirectAttributes) {
		
		System.out.println("writeCustomer start..");
		System.out.println(customer);
		
		
		
		//제품 정보 저장 로직 구현 
		int insertResult = mk_Service_interface.insertCustomer(customer);
		if(insertResult>0)
			return"redirect:customerU";
		else {
		
			return "forward:customerC";
		}
	}

	 @ResponseBody 
	@GetMapping("/getEmployees")
	public List<mkEmployee> searchEmployee(@RequestParam("cust_type") String custType ,mkEmployee emp, Model model ) {
	
		System.out.println("getEmployees Start");
		
		emp.setCust_type(custType);
		
		System.out.println("custType이 0이면 부서 103조회 1이면 104조회->"+emp);
		
		List<mkEmployee> empList =null;
		
		
		empList = mk_Service_interface.searchEmpList(emp);
		
		System.out.println("cus_type 에 따른 부서 별 사원 조회 ->" + empList);
		
		
		return empList;
	}
	
	
}