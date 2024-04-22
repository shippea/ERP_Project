package com.oracle.erpProject.dao.jjdao;

import java.util.List;

import com.oracle.erpProject.model.Factory;
import com.oracle.erpProject.model.jjmodel.JJ_Make;
import com.oracle.erpProject.model.jjmodel.JJ_Make_detail;
import com.oracle.erpProject.model.mkmodel.mkFactory;
import com.oracle.erpProject.model.mkmodel.mkProduct;

public interface JJ_Dao_Interface {

	int 					cntMake();
	List<JJ_Make_detail> 	makedetailList(JJ_Make_detail md);
	List<JJ_Make_detail> 	requestMakeList();
	int 					makeRequest(JJ_Make m);					// make table insert
	JJ_Make_detail 			jjmakeDetail(int m_num);				// 생산 상세 페이지
	int 					makeSearchCnt(JJ_Make_detail md);		// 검색어 카운트 기능
	List<JJ_Make_detail> 	makeSearchList(JJ_Make_detail md);		// 검색어 리스트 로드
	int 					jjmakeDelete(int m_num);				// make_detail 삭제
	int 					jjmakeDelete2(int m_num);				// make 삭제
	List<mkProduct> 		jjproductList(mkProduct mp);			// 물품 리스트 부르기
	int 					jjmakeUpdate(JJ_Make m);				// make 업데이트
	Factory getFactoryName(String p_itemcode);
	List<mkFactory> jjFacotryList();
}
