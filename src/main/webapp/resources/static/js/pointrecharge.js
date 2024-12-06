
	 $(document).ready(function() {
	        // 버튼 클릭 이벤트
	        $("#pointRechargeButton").on("click", function() {
	            // 팝업 열기
	            window.open(
	                "pointrecharge.do", // 팝업으로 띄울 페이지
	                "포인트 구매",        // 팝업 창 이름
	                "width=900,height=800,scrollbars=yes,resizable=yes,top=100,left=100" // 옵션
	            );
	        });
	    });


