
// datePicker 검색
$(document).ready(function() {
    $('#datePicker').change(function() {
        var buy_date = $(this).val();
        var formattedDate = buy_date.replace(/-/g, ''); 

		location.href="selectedDateSearch?buy_date="+formattedDate;
    
    });
      $('#optionBox').change(function(){
		var buy_status = $(this).val();
		
		location.href = "selectedStatusSearch?buy_status=" + buy_status;
		
		console.log(buy_status);
	});
	
		// 버튼 클릭 시 수불마감 여부 확인
	$('#buyProBtn').click(function() {
		checkClosingStatus();
	});
	
	
	// 수불마감 여부 가져오기
	function checkClosingStatus() {
		$.ajax({
			url: '/closingStatus', 
			type: 'GET',
			success: function(closingStatus) {
				if (closingStatus !== 0) {
					alert("금일 수불 마감 처리 되어 등록 할 수 없습니다.");
					$('#buyProBtn').prop('disabled', true);
					 window.location.href = "buying";
				} else {
					 window.location.href = "buyingApply";
				}
			}
		});
	}
	
	
	
	
	
	
});
    


