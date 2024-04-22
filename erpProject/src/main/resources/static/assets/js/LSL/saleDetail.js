$(document).ready(function() {
	$(".pDeleteBtn").hide();
	$(".pModifyBtn").hide();
	$("#addBtn").hide();

	checkClosingStatus();


	// 수정 버튼 클릭 시 입력 필드 활성화
	$("#saleModify").click(function() {
		$("input[type='text']").removeAttr("disabled");
		$("textarea").removeAttr("disabled");
		$(".sdCnt").removeAttr("disabled");
		$(".pDeleteBtn").show();
		$(".pModifyBtn").show();
		$("#addBtn").show();
	});



	$("#addBtn").click(function() {
		var p_itemcode = $("#saleItemSelect").val();
		var p_name = $("#saleItemSelect option:selected").text();
		var sd_cnt = $("#sd_cnt").val();
		var sd_price = $("#saleItemSelect option:selected").data("saleprice");
		var totalMoney = sd_cnt * sd_price;


		// 이미 등록된 상품인지 확인
		var isExistingProduct = false;
		$(".saleListItem").each(function() {
			if ($(this).find(".p_itemcode").val() === p_itemcode) {
				isExistingProduct = true;
				return false; // 중복된 상품이 있으면 반복문 종료
			}
		});

		if (!isExistingProduct) {
			var newItemHTML = `
                <li class="saleListItem">
                    <input type="hidden" class="p_itemcode" name="p_itemcode" value="${p_itemcode}">
                    <input value="${p_name}" disabled="disabled">
                    <input value="${sd_price}"name="sd_price" disabled="disabled">
                    <input class="sdCnt" value="${sd_cnt}" name="sd_cnt">
                    <input value="${totalMoney}" disabled="disabled">
                    <button type="button" class="btn btn-primary pModifyBtn">수정</button>
                    <button type="button" class="btn btn-primary pDeleteBtn">삭제</button>
                </li>
            `;
			$("#saleItemSelect").val("item 1");
			$(".saleItemCnt").val("");
			$(".saleList").append(newItemHTML);

			addProduct(p_itemcode, $("#cust_no").val(), $("#s_date").val(), sd_cnt, sd_price);
		} else {
			alert("이미 등록된 상품입니다.");
			$("#saleItemSelect").val("item 1");
			$(".saleItemCnt").val("");
		}
	});

	// 제품 추가

	function addProduct(p_itemcode, cust_no, s_date, sd_cnt, sd_price) {


		$.ajax({
			type: "POST",
			url: "/addSaleProduct",
			data: {
				p_itemcode: p_itemcode,
				sd_cnt: sd_cnt,
				cust_no: cust_no,
				s_date: s_date,
				sd_price: sd_price
			},
			success: function(productDetail) {
				console.log("productData" + productDetail);

			},
			error: function(error) {
				console.log("에러 발생:", error);
			}
		});
	}

	// 삭제 버튼 클릭시 제품 삭제
	$(document).on("click", ".pDeleteBtn", function() {
		var cust_no = $("#cust_no").val();
		var s_date = $("#s_date").val();
		var p_itemcode = $(this).closest('.saleListItem').find('.p_itemcode').val();

		console.log(p_itemcode);

		var $deletedItem = $(this).closest("li");

		$.ajax({
			type: "POST",
			url: "/deleteSaleProduct",
			data: {
				p_itemcode: p_itemcode,
				cust_no: cust_no,
				s_date: s_date
			},
			success: function(response) {
				console.log("삭제 완료", response);
				$deletedItem.remove();
			},
			error: function(error) {
				console.log("에러", error);
			}
		});
	});
	$("#saleComple").click(function() {
		$("input[type='text']").attr("disabled", "disabled");
		$("textarea").attr("disabled", "disabled");
		$(".sdCnt").attr("disabled", "disabled");
		$(".pDeleteBtn").hide();
		$(".pModifyBtn").hide();
		$("#addBtn").hide();

		// 필요한 데이터 수집
		var s_note = $("#colNoteBox").val();
		var cust_no = $("#cust_no").val();
		var s_date = $("#s_date").val();


		// 수정된 구매 데이터를 서버로 전송
		var saleModifyData = {
			s_note: s_note,
			cust_no: cust_no,
			s_date: s_date
		};

		console.log(saleModifyData);

		$.ajax({
			type: "POST",
			url: "/saleModify",
			contentType: 'application/json',
			data: JSON.stringify(saleModifyData),
			success: function(response) {
				console.log("판매 등록 성공:", response);

				var redirectURL = "http://localhost:8587/saleDetail?cust_no=" + cust_no + "&s_date=" + s_date;
				window.location.href = redirectURL;
			},
			error: function(error) {
				console.error("판매 등록 실패:", error);
			}
		});
	});

	// 제품 수정 
	$(document).on("click", ".pModifyBtn", function() {
		var sd_cnt = $(this).closest('.saleListItem').find('.sdCnt').val();
		var cust_no = $("#cust_no").val();
		var s_date = $("#s_date").val();
		var p_itemcode = $(this).closest('.saleListItem').find('.p_itemcode').val();
		var sd_price = $(this).closest('.saleListItem').find('#p_saleprice').val();

		var productCntModify = {
			sd_cnt: sd_cnt,
			cust_no: cust_no,
			s_date: s_date,
			p_itemcode: p_itemcode,
			sd_price: sd_price
		};
		
		console.log(productCntModify);


		$.ajax({
			type: "POST",
			url: "/productSaleCntModify",
			data: JSON.stringify(productCntModify),
			dataType: 'json',
			contentType: 'application/json',
			success: function(response) {
				console.log("saleModifyData", productCntModify);
			},
			error: function(error) {
				console.log("전송 실패");
				console.log(error);
			}
		});
	});

	$("#saleStatusSelect").change(function() {
		var cust_no = $("#cust_no").val();
		var s_date = $("#s_date").val();
		var s_status = $(this).val();
		console.log(s_status);

		console.log("s_status >>" + s_status);

		var saleStatusChange = {
			cust_no: cust_no,
			s_date: s_date,
			s_status: s_status
		};

		console.log("saleStatusChange >>" + JSON.stringify(saleStatusChange));

		$.ajax({
			type: "POST",
			url: "/saleStatusChange",
			data: JSON.stringify(saleStatusChange),
			dataType: 'json',
			contentType: 'application/json',
			success: function(response) {
				if (response == "0") {
					$("#saleStatusBox").text("판매 진행중");

				} else if (response == "1") {
					$("#saleStatusBox").text("판매 취소");

				} else if (response == "2") {
					$("#saleStatusBox").text("생산 작업 요청");

				} else if (response == "3") {
					$("#saleStatusBox").text("생산 완료");

				} else if (response == "4") {
					$("#saleStatusBox").text("판매 완료");

				} else if (response == "5") {
					$("#saleStatusBox").text("수불 완료");

				}
				var selectedOptionText = $("#saleStatusSelect option:selected").text();
				$("#saleStatusBox").text(selectedOptionText);
			},
			error: function(error) {
				console.log("전송 실패");
				console.log(error);
			}
		});


	});


	// 생산 요청 제품 표시

	var cust_no = $("#cust_no").val();
	var s_date = $("#s_date").val();

	console.log(cust_no);
	console.log(s_date);


	$.ajax({
		type: "GET",
		url: "getMakeItemCode",
		data: {
			cust_no: cust_no,
			s_date: s_date
		},
		success: function(response) {
			console.log(response);
			var makeItemCode = response.p_itemcode;

			$(".saleListItem").each(function() {
				var listItem = $(this);
				var itemCode = listItem.find(".p_itemcode").val();

				if (itemCode == makeItemCode) {
					listItem.append('<div class="makeItem">생산 요청 완료</div>');
				}
			});
		},
		error: function(error) {
			console.error("실패", error);
		}
	});




	// 수블 마감 체크 
	function checkClosingStatus() {
		$.ajax({
			url: '/closingStatus',
			type: 'GET',
			success: function(closingStatus) {
				
				if (closingStatus !== 0 ) {

					$("#saleModify").hide();
					$("#saleComple").hide();
					$("#saleStatusSelect").prop("disabled", true);
				} else {

					$("#saleModify").show();
					$("#saleComple").show();
				}
			},
			error: function() {
				console.log("수불 마감 상태를 확인하는 중 에러 발생");
			}
		});
	}

});
