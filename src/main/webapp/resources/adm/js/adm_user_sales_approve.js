$(function(){

	// 승인 버튼 클릭 이벤트
	$("#approveButton").on("click",function(){
		
		//alert("승인클릭");
		
		// approve를 1로 변경 후 전송
		$("#approve").val("1");
		
		// 변경 후 전송
		$("#sellerForm").submit();
	});
	
	// 거절 버튼 클릭 이벤트
	$("#rejectButton").on("click",function(){
		
		//alert("거절클릭");
		
		// approve를 0으로 변경 후 전송
		$("#approve").val("0");
		
		// 변경 후 전송
		$("#sellerForm").submit();
	});
});