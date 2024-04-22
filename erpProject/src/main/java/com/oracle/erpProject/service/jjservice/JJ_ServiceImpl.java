package com.oracle.erpProject.service.jjservice;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.erpProject.dao.jjdao.JJ_Dao_Interface;
import com.oracle.erpProject.model.Factory;
import com.oracle.erpProject.model.jjmodel.JJ_Make;
import com.oracle.erpProject.model.jjmodel.JJ_Make_detail;
import com.oracle.erpProject.model.mkmodel.mkFactory;
import com.oracle.erpProject.model.mkmodel.mkProduct;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class JJ_ServiceImpl implements JJ_Service_Interface {

	private final JJ_Dao_Interface jjDao;

	@Override
	public int cntMake() {
		System.out.println("JJ_ServiceImpl's cntMake Go!");
		int cntMake = jjDao.cntMake();
		System.out.println("JJ_ServiceImpl's cntMake ->" + cntMake);
		return cntMake;
	}

	@Override
	public List<JJ_Make_detail> makedetailList(JJ_Make_detail md) {
		List<JJ_Make_detail> makedetailList = null;
		System.out.println("JJ_ServiceImpl's makedetailList Go!");
		makedetailList = jjDao.makedetailList(md);
		System.out.println("JJ_ServiceImpl's makedetailList -> " + makedetailList);
		return makedetailList;
	}

	@Override
	public List<JJ_Make_detail> requestMakeList() {
		List<JJ_Make_detail> requestMakeList = null;
		System.out.println("JJ_ServiceImpl's requestMakeList Go!");
		requestMakeList = jjDao.requestMakeList();
		System.out.println("JJ_ServiceImpl's requestMakeList.size() ->" + requestMakeList.size());
		return requestMakeList;
	}

	@Override
	public int makeRequest(JJ_Make m) {
		int makeRequest = 0;
		System.out.println("JJ_ServiceImpl's makeRequest Go!");
		makeRequest = jjDao.makeRequest(m);
		System.out.println("JJ_ServiceImpl's makeRequest -> " + makeRequest);
		return makeRequest;
	}

	// 생산 상세 페이지
	@Override
	public JJ_Make_detail jjmakeDetail(int m_num) {
		System.out.println("JJ_ServiceImpl's jjmakeDetail Go!");
		JJ_Make_detail jjmakeDetail = null;
		jjmakeDetail = jjDao.jjmakeDetail(m_num);
		System.out.println("JJ_ServiceImpl's jjmakeDetail -> " + jjmakeDetail);
		return jjmakeDetail;
	}

	@Override
	public int makeSearchCnt(JJ_Make_detail md) {
		System.out.println("JJ_ServiceImpl's makeSearchCnt Go!");
		int makeSearchCnt = jjDao.makeSearchCnt(md);
		return makeSearchCnt;
	}
	
	@Override
	public List<JJ_Make_detail> makeSearchList(JJ_Make_detail md) {
		List<JJ_Make_detail> makeSearchList = null;
		System.out.println("JJ_ServiceImpl's makeSearchList Go!");
		makeSearchList = jjDao.makeSearchList(md);
		System.out.println("JJ_ServiceImpl's makeSearchList.size() -> " + makeSearchList.size());
		return makeSearchList;
	}

	// make detail 삭제
	@Override
	public int jjmakeDelete(int m_num) {
		int jjmakeDelete = 0;
		System.out.println("JJ_ServiceImpl's jjmakeDelete Go!");
		jjmakeDelete = jjDao.jjmakeDelete(m_num);
		System.out.println("JJ_ServiceImpl's jjmakeDelete ->" + jjmakeDelete);
		return jjmakeDelete;
	}
	
	// make 삭제
	@Override
	public int jjmakeDelete2(int m_num) {
		int jjmakeDelete2 = 0;
		System.out.println("JJ_ServiceImpl's jjmakeDelete2 Go!");
		jjmakeDelete2 = jjDao.jjmakeDelete2(m_num);
		System.out.println("JJ_ServiceImpl's jjmakeDelete2 ->" + jjmakeDelete2);
		return jjmakeDelete2;
	}

	@Override
	public List<mkProduct> jjproductList(mkProduct mp) {
		List<mkProduct> jjproductList = null;
		System.out.println("JJ_ServiceImpl's jjproductList Go!");
		jjproductList = jjDao.jjproductList(mp);
		System.out.println("JJ_ServiceImpl's jjproductList.size() -> " + jjproductList.size());
		return jjproductList;
	}

	// make 업데이트
	@Override
	public int jjmakeUpdate(JJ_Make m) {
		int jjmakeUpdate = 0;
		System.out.println("JJ_ServiceImpl's jjmakeUpdate Go!");
		jjmakeUpdate = jjDao.jjmakeUpdate(m);
		System.out.println("JJ_ServiceImpl's jjmakeUpdate->"+jjmakeUpdate);
		return jjmakeUpdate;
	}

	@Override
	public Factory getFactoryName(String p_itemcode) {
		return jjDao.getFactoryName(p_itemcode);
	}
 
	@Override
	public List<mkFactory> jjFactoryList() {
		List<mkFactory> factoryList = null;
		factoryList = jjDao.jjFacotryList();
		return factoryList;
	}

}
