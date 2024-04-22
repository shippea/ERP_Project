package com.oracle.erpProject.service.Yhsservice;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.erpProject.dao.Yhsdao.Yhs_Dao_Interface;
import com.oracle.erpProject.model.Board;
import com.oracle.erpProject.model.yhsmodel.YhsBoard;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class Yhs_ServiceImpl implements Yhs_Service_Interface{
	
	private final Yhs_Dao_Interface yhs_Dao_Interface;
	
	@Override
	public int totalBoard(YhsBoard board) {
		System.out.println("Yhs_ServiceImpl Start total...");
		int totBoardCnt = yhs_Dao_Interface.totalBoard(board);
		System.out.println("Yhs_ServiceImpl totalBoard totBoardCnt->"+ totBoardCnt);
		return totBoardCnt;
	}
	
	@Override
	public List<YhsBoard> listBoard(YhsBoard board) {
		List<YhsBoard> boardList = null;
		System.out.println("Yhs_ServiceImpl listManager start...");
		boardList = yhs_Dao_Interface.listBoard(board);
		System.out.println("Yhs_ServiceImpl listBoard boardList.size()->"+boardList.size());
		return boardList;
	}
	
	// 자유 게시판 리스트 조회수 
	@Override
	public int boardViewCnt(YhsBoard board) {
		int boardViewCnt = yhs_Dao_Interface.boardViewCnt(board);
		System.out.println("Yhs_ServiceImpl boardViewCnt Start...");
		return boardViewCnt;
	}

	@Override
	public YhsBoard boardContents(int b_no) {
		System.out.println("Yhs_ServiceImpl boardContents Start...");
		YhsBoard boardContents = yhs_Dao_Interface.boardContents(b_no);
		System.out.println("Yhs_ServiceImpl boardContents -> " + boardContents);
		return boardContents;
	}
	
	// 질문 게시판 글쓰기 
	@Override
	public void boardWriteInsert(YhsBoard board) {
		yhs_Dao_Interface.boardWriteInsert(board);
	}
	
	// 자유 게시판 글 삭제
	@Override
	public int deleteBoard(YhsBoard board) {
		int deleteBoard = yhs_Dao_Interface.deleteBoard(board);
		return deleteBoard;
	}

	@Override
	public YhsBoard boardModify(int b_no) {
		System.out.println("1시작");
		YhsBoard boardModify = yhs_Dao_Interface.boardModify(b_no);
		return boardModify;
	}

	@Override
	public int boardUpdate(YhsBoard board) {
		int boardUpdate = yhs_Dao_Interface.boardUpdate(board);
		return boardUpdate;
	}

	@Override
	public List<YhsBoard> listSearch(YhsBoard board) {
		System.out.println("YHSServiceImpl listSearch Start");
		List<YhsBoard> listSearchBoard=null;
		listSearchBoard =yhs_Dao_Interface.listSearchBoard(board);
		return listSearchBoard;
	}

}