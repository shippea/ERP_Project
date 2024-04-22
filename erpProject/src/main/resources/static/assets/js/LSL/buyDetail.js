$(document).ready(function() {
	$(".pDeleteBtn").hide();
	$(".pModifyBtn").hide();
	$("#addBtn").hide();

	checkClosingStatus();


	// 수정 버튼 클릭 시 입력 필드 활성화
	$("#buyModify").click(function() {
		$("input[type='text']").removeAttr("disabled");
		$("textarea").removeAttr("disabled");
		$(".bdCnt").removeAttr("disabled");
		$(".pDeleteBtn").show();
		$(".pModifyBtn").show();
		$("#addBtn").show();
	});

		

	$("#addBtn").click(function() {
		var p_itemcode = $("#buyingItemSelect").val();
		var p_name = $("#buyingItemSelect option:selected").text();
		var bd_cnt = $("#bd_cnt").val();
		var bd_price = $("#buyingItemSelect option:selected").data("buyprice");
		var totalMoney = bd_cnt * bd_price;


		// 이미 등록된 상품인지 확인
		var isExistingProduct = false;
		$(".buyListItem").each(function() {
			if ($(this).find(".p_itemcode").val() === p_itemcode) {
				isExistingProduct = true;
				return false; // 중복된 상품이 있으면 반복문 종료
			}
		});

		if (!isExistingProduct) {
			var newItemHTML = `
                <li class="buyListItem">
                    <input type="hidden" class="p_itemcode" name="p_itemcode" value="${p_itemcode}">
                    <input value="${p_name}" disabled="disabled">
                    <input value="${bd_price}"name="bd_price" disabled="disabled">
                    <input class="bdCnt" value="${bd_cnt}" name="bd_cnt">
                    <input value="${totalMoney}" disabled="disabled">
                    <button type="button" class="btn btn-primary pModifyBtn">수정</button>
                    <button type="button" class="btn btn-primary pDeleteBtn">삭제</button>
                </li>
            `;
			$("#buyingItemSelect").val("item 1");
			$(".buyItemCnt").val("");
			$(".buyList").append(newItemHTML);

			addProduct(p_itemcode, $("#cust_no").val(), $("#buy_date").val(), bd_cnt, bd_price);
		} else {
			alert("이미 등록된 상품입니다.");
			$("#buyingItemSelect").val("item 1");
			$(".buyItemCnt").val("");
		}
	});

	// 제품 추가

	function addProduct(p_itemcode, cust_no, buy_date, bd_cnt, bd_price) {


		$.ajax({
			type: "POST",
			url: "/addProduct",
			data: {
				p_itemcode: p_itemcode,
				bd_cnt: bd_cnt,
				cust_no: cust_no,
				buy_date: buy_date,
				bd_price: bd_price
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
		var buy_date = $("#buy_date").val();
		var p_itemcode = $(this).closest('.buyListItem').find('.p_itemcode').val();

		console.log(p_itemcode);

		var $deletedItem = $(this).closest("li");

		$.ajax({
			type: "POST",
			url: "/deleteProduct",
			data: {
				p_itemcode: p_itemcode,
				cust_no: cust_no,
				buy_date: buy_date
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
	$("#buyComple").click(function() {
		$("input[type='text']").attr("disabled", "disabled");
		$("textarea").attr("disabled", "disabled");
		$(".bdCnt").attr("disabled", "disabled");
		$(".pDeleteBtn").hide();
		$(".pModifyBtn").hide();
		$("#addBtn").hide();

		// 필요한 데이터 수집
		var buy_note = $("#colNoteBox").val();
		var cust_no = $("#cust_no").val();
		var buy_date = $("#buy_date").val();


		// 수정된 구매 데이터를 서버로 전송
		var buyModifyData = {
			buy_note: buy_note,
			cust_no: cust_no,
			buy_date: buy_date
		};

		console.log(buyModifyData);

		$.ajax({
			type: "POST",
			url: "/buyingModify",
			contentType: 'application/json',
			data: JSON.stringify(buyModifyData),
			success: function(response) {
				console.log("구매 등록 성공:", response);

				var redirectURL = "http://localhost:8587/buyDetail?cust_no=" + cust_no + "&buy_date=" + buy_date;
				window.location.href = redirectURL;
			},
			error: function(error) {
				console.error("구매 등록 실패:", error);
			}
		});
	});

	// 제품 수정 
	$(document).on("click", ".pModifyBtn", function() {
		var bd_cnt = $(this).closest('.buyListItem').find('.bdCnt').val();
		var cust_no = $("#cust_no").val();
		var buy_date = $("#buy_date").val();
		var p_itemcode = $(this).closest('.buyListItem').find('.p_itemcode').val();
		var bd_price = $(this).closest('.buyListItem').find('#p_buyprice').val();

		var productCntModify = {
			bd_cnt: bd_cnt,
			cust_no: cust_no,
			buy_date: buy_date,
			p_itemcode: p_itemcode,
			bd_price: bd_price
		};



		$.ajax({
			type: "POST",
			url: "/productCntModify",
			data: JSON.stringify(productCntModify),
			dataType: 'json',
			contentType: 'application/json',
			success: function(response) {
				console.log("buyModifyData", productCntModify);
			},
			error: function(error) {
				console.log("전송 실패");
				console.log(error);
			}
		});
	});

	$("#buyStatusSelect").change(function() {
		var cust_no = $("#cust_no").val();
		var buy_date = $("#buy_date").val();
		var buy_status = $(this).val();
		console.log(buy_status);

		console.log("buy_status >>" + buy_status);

		var buyStatusChange = {
			cust_no: cust_no,
			buy_date: buy_date,
			buy_status: buy_status
		};

		console.log("buyStatusChange >>" + JSON.stringify(buyStatusChange));

		$.ajax({
			type: "POST",
			url: "/buyStatusChange",
			data: JSON.stringify(buyStatusChange),
			dataType: 'json',
			contentType: 'application/json',
			success: function(response) {
				if (response == "1") {
					$("#buyStatusBox").text("구매 취소");

				} else if (response == "2") {
					$("#buyStatusBox").text("구매 완료");

				} else if (response == "5") {
					$("#buyStatusBox").text("수불 완료");

				} else if (response == "0") {
					$("#buyStatusBox").text("구매 진행중");

				}
				var selectedOptionText = $("#buyStatusSelect option:selected").text();
				$("#buyStatusBox").text(selectedOptionText);
			},
			error: function(error) {
				console.log("전송 실패");
				console.log(error);
			}
		});


	});


	// 수블 마감 체크 
	function checkClosingStatus() {
		$.ajax({
			url: '/closingStatus',
			type: 'GET',
			success: function(closingStatus) {
				if (closingStatus !== 0) {

					$("#buyModify").hide();
					$("#buyComple").hide();
					$("#buyStatusSelect").prop("disabled", true);
				} else {

					$("#buyModify").show();
					$("#buyComple").show();
				}
			},
			error: function() {
				console.log("수불 마감 상태를 확인하는 중 에러 발생");
			}
		});
	}

});
