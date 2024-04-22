package com.oracle.erpProject.dao.jjdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.oracle.erpProject.model.Factory;
import com.oracle.erpProject.model.jjmodel.JJ_Make;
import com.oracle.erpProject.model.jjmodel.JJ_Make_detail;
import com.oracle.erpProject.model.mkmodel.mkFactory;
import com.oracle.erpProject.model.mkmodel.mkProduct;

import jakarta.transaction.TransactionManager;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class JJ_DaoImpl implements JJ_Dao_Interface {
	
	private final PlatformTransactionManager transactionManager;
	
	// Mybatis DB 연동
	private final SqlSession session;

	// 생산게시판 List페이지 - 총 게시물 count
	@Override
	public int cntMake() {
		int cntMake = 0;
		System.out.println("JJ_DaoImpl's cntMake Go!");
		try {
			cntMake = session.selectOne("jjcntMake");
			System.out.println("JJ_DaoImpl's cntMake -> " + cntMake);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cntMake;
	}
	
	// 생산게시판 MakeDetail List페이지
	@Override
	public List<JJ_Make_detail> makedetailList(JJ_Make_detail md) {
		List<JJ_Make_detail> makedetailList = null;
		System.out.println("JJ_DaoImpl's makedetailList Go!");
		System.out.println("JJ_DaoImpl's makedetailList md->"+md);
		try {
			makedetailList = session.selectList("jjMakeDetailList", md);
			System.out.println("JJ_DaoImpl's makedetailList.size() -> " + makedetailList.size());
		} catch (Exception e) {
			System.out.println("JJ_DaoImpl's makedetailList Exception -> " + e.getMessage());
		}
		return makedetailList;
	}

	// 생산게시판 생산 요청 페이지
	@Override
	public List<JJ_Make_detail> requestMakeList() {
		List<JJ_Make_detail> requestMakeList = null;
		System.out.println("JJ_DaoImpl's requestMakeList Go!");
		try {
			requestMakeList = session.selectList("jjRequestMakeList");
			System.out.println("JJ_DaoImpl's requestMakeList.size() -> " + requestMakeList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return requestMakeList;
	}

	// 생산게시판 생산 요청 기능
	@Override
	public int makeRequest(JJ_Make m) {
		
		int makeRequest = 0;
		System.out.println("JJ_DaoImpl's makeRequest Go!");
		System.out.println("JJ_DaoImpl's makeRequest m->"+m);
		TransactionStatus txStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());
		try {
			makeRequest = session.insert("jjMakeRequestInsert1", m);
			
			System.out.println("JJ_DaoImpl's makeRequest m>>>>>>>>>>>->"+m);
			makeRequest = session.insert("jjMakeRequestInsert2", m);
			System.out.println("JJ_DaoImpl's makeRequest -> " + makeRequest);
			transactionManager.commit(txStatus);
		} catch (Exception e) {
			e.printStackTrace();
			transactionManager.rollback(txStatus);
		}
		return makeRequest;
	}

	// 생산 상세 페이지
	@Override
	public JJ_Make_detail jjmakeDetail(int m_num) {
		System.out.println("JJ_DaoImpl's jjmakeDetail Go!");
		System.out.println("JJ_DaoImpl's jjmakeDetail m_num->"+m_num);
		JJ_Make_detail jjmakeDetail = new JJ_Make_detail();
		System.out.println("JJ_DaoImpl's jjmakeDetail jjmakeDetail->"+jjmakeDetail);
		try {
			jjmakeDetail = session.selectOne("jjmakeDetail", m_num);
			System.out.println("JJ_DaoImpl's jjmakeDetail -> " + jjmakeDetail);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return jjmakeDetail;
	}

	// 검색어 카운트 기능
	@Override
	public int makeSearchCnt(JJ_Make_detail md) {
		int makeSearchCnt = 0;
		System.out.println("JJ_DaoImpl's makeSearchCnt md->"+md);
		if(md.getKeyword()==null) md.setKeyword("%");
		try {
			makeSearchCnt = session.selectOne("makeSearchCnt", md);
			System.out.println("JJ_DaoImpl's makeSearchCnt ->" + makeSearchCnt);
		} catch(Exception e) {
			System.out.println("JJ_DaoImpl's makeSearchCnt Exception -> "+ e.getMessage());
		}
		return makeSearchCnt;
	}

	// 검색어 리스트 기능
	@Override
	public List<JJ_Make_detail> makeSearchList(JJ_Make_detail md) {
		List<JJ_Make_detail> makeSearchList = null;
		System.out.println("JJ_DaoImpl's makeSearchList Go!");
		try {
			makeSearchList = session.selectList("makeSearchList", md);
			System.out.println("JJ_DaoImpl's makeSearchList -> " + makeSearchList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return makeSearchList;
	}

	// make_detail 삭제
	@Override
	public int jjmakeDelete(int m_num) {
		System.out.println("JJ_DaoImpl's jjmakeDelete Go!");
		int jjmakeDelete = 0;
		System.out.println("JJ_DaoImpl's jjmakeDelete m_num ->" + m_num);
		try {
			jjmakeDelete = session.delete("jjmakeDelete", m_num);
			System.out.println("JJ_DaoImpl's jjmakeDelete -> " + jjmakeDelete);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jjmakeDelete;
	}

	// make 삭제
	@Override
	public int jjmakeDelete2(int m_num) {
		System.out.println("JJ_DaoImpl's jjmakeDelete2 Go!");
		int jjmakeDelete2 = 0;
		System.out.println("JJ_DaoImpl's jjmakeDelete2 ->" + m_num);
		try {
			jjmakeDelete2 = session.delete("jjmakeDelete2", m_num);
			System.out.println("JJ_DaoImpl's jjmakeDelete2 ->" + jjmakeDelete2);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jjmakeDelete2;
	}

	@Override
	public List<mkProduct> jjproductList(mkProduct mp) {
		List<mkProduct> jjproductList = null;
		System.out.println("JJ_DaoImpl's jjproductList Go!");
		try {
			jjproductList = session.selectList("jjproductList", mp);
			System.out.println("JJ_DaoImpl's jjproductList -> " + jjproductList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jjproductList;
	}
	
	// make 업데이트
	@Override
	public int jjmakeUpdate(JJ_Make m) {
		System.out.println("JJ_DaoImpl's jjmakeUpdate Go!");
		int jjmakeUpdate = 0;
		int jjmakeDetailUpdate = 0;
		int jjSaleUpdate = 0;
		
		TransactionStatus txStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());
		try {
			// 생산 
			jjmakeUpdate = session.update("jjmakeUpdate", m);
			System.out.println("JJ_DaoImpl's jjmakeUpdate ->" + jjmakeUpdate);
			jjmakeDetailUpdate = session.update("jjmakeDetailUpdate", m);
			System.out.println("JJ_DaoImpl's jjmakeDetailUpdate ->" + jjmakeDetailUpdate);
			System.out.println("JJ_DaoImpl's m.getM_status()->"+m.getM_status());
			// 영업
			if(Integer.parseInt(m.getM_status()) == 3) {
			jjSaleUpdate = session.update("jjSaleUpdate", m);
			System.out.println("JJ_DaoImpl's jjSaleUpdate ->" + jjSaleUpdate);
			}
			
			transactionManager.commit(txStatus);
		} catch (Exception e) {
				e.printStackTrace();
				transactionManager.rollback(txStatus);
		}
		
		return jjmakeUpdate;
	}

	@Override
	public Factory getFactoryName(String p_itemcode) {
		Factory factory = null;
		try {
			factory = session.selectOne("jjGetFactoryName",p_itemcode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return factory;
	}

	@Override
	public List<mkFactory> jjFacotryList() {
		List<mkFactory> factoryList = null;
		System.out.println("JJ_DaoImpl's jjFactoryList Go!");
		try {
			factoryList = session.selectList("jjFactoryList");
			System.out.println("JJ_DaoImpl's jjFacotryList -> " + factoryList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return factoryList;
	}



}
