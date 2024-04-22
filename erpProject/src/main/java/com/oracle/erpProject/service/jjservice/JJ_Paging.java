package com.oracle.erpProject.service.jjservice;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class JJ_Paging {
	private int currentPage = 1;	// 현재 페이지 번호를 저장하는 변수
	private int rowPage = 10;		// 한 페이지에 표시할 항목 수를 저장하는 변수
	private int pageBlock = 10;		// 페이지 블록 당 페이지 수를 저장하는 변수
	private int start;				// 시작 항목의 인덱스를 저장하는 변수
	private int end;				// 끝 항목의 인덱스를 저장하는 변수
	private int startPage;			// 시작 페이지의 번호를 저장하는 변수
	private int endPage;			// 끝 페이지의 번호를 저장하는 변수
	private int total;				// 전체 항목 수를 저장하는 변수
	private int totalPage;			// 전체 페이지 수를 저장하는 변수
	
	// 생성자
	public JJ_Paging(int total, String currentPage1) {
		this.total = total;			// 전체 항목 수 설정
		if (currentPage1 != null) {	// 현재 페이지 번호 설정
			this.currentPage = Integer.parseInt(currentPage1);
		}
		start		= (currentPage - 1) * rowPage + 1;				// 시작 항목의 인덱스 계산
		end			= start + rowPage - 1;							// 끝 항목의 인덱스 계산
		totalPage	= (int) Math.ceil((double)total / rowPage);		// 전체 페이지 수 계산
		startPage	= currentPage - (currentPage - 1) % pageBlock;	// 시작 페이지 번호 계산
		endPage		= startPage + pageBlock - 1;					// 끝 페이지 번호 계산
		if (endPage > totalPage) {									// 끝 페이지 번호가 전체 페이지 수를 초과하지 않도록 조정
			endPage = totalPage;
		}
	}
}
