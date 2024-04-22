// datePicker 검색
$(document).ready(function() {
    $('#datePicker').change(function() {
        var s_date = $(this).val();
        var formattedDate = s_date.replace(/-/g, ''); 

		location.href="salectedSaleDateSearch?s_date="+formattedDate;
    
    });
      $('#optionBox').change(function(){
		var s_status = $(this).val();
		
		location.href = "salectedStatusSearch?s_status=" + s_status;
		
		console.log(s_status);
	});
	
	
	// 버튼 클릭 시 수불마감 여부 확인
	$('#saleProBtn').click(function() {
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
					$('#saleProBtn').prop('disabled', true);
					 window.location.href = "sale";
				} else {
					 window.location.href = "saleApply";
				}
			}
		});
	}
    
    
});

