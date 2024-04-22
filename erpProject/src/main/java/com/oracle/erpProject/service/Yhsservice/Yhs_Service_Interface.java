package com.oracle.erpProject.service.Yhsservice;

import java.util.List;

import com.oracle.erpProject.model.yhsmodel.YhsBoard;

public interface Yhs_Service_Interface {
	
	int totalBoard(YhsBoard board);
	
	List<YhsBoard> listBoard(YhsBoard board);
	
	// 게시판 상세 페이지 
	YhsBoard boardContents(int b_no);
	
	// 게시판 글 조회수 
	int boardViewCnt(YhsBoard board);
	
	void boardWriteInsert(YhsBoard board);
	
	int deleteBoard(YhsBoard board);

	YhsBoard boardModify(int b_no);

	int boardUpdate(YhsBoard board);

	List<YhsBoard> listSearch(YhsBoard board);

//	int deleteBoard(int b_no);

	


}

