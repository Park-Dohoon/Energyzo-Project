$(function(){
	// 뒤로가기 버튼
	$('#back').click(function(){
		window.location.href = 'tabletest';
});

	// 목록보기 버튼
	$('#boardList').click(function(){
		window.location.href = 'tabletest';
});
	
	// 상세보기 페이지의 수정하기 버튼
	$('#modify').click(function(){
	let free_num = $('#free_num').val();
		 window.location.href = 'modifytable?free_num=' + free_num;
		
	});
	
	//삭제하기 버튼
	$('#delete').on('click delete', function(){
		let param = {free_num: $('#free_num').val()}
		
		let isConfirmed = confirm("정말 삭제하시겠습니까?");

		if (isConfirmed) {
			$.ajax({
				type : 'post',
				url	: 'deleteBoard',
				data : param,
				success : function(){
					 window.location.href = 'tabletest';
				},
				error : function(){
				alert('삭제실패');
				}
			});
		}
	});

	// 신고버튼
	$('#report ').click(function(){
		$('#myModal').show();
	});
	
	// 팝업 닫기 버튼 클릭 시
	$('#close').click(function() {
		event.preventDefault();  // 폼 제출을 막기 위해
		$('.cbox').prop('checked', false); // 모든 체크박스 초기화
		$('#myModal').hide();  // 팝업 창 숨기기
	});
	
	// 페이지 로딩 시, 기본적으로 텍스트 입력란을 비활성화
    $('#text').prop('disabled', true);
	
	// 체크박스 하나만 선택
	$('.cbox').click(function(){
		// 모든 체크박스 비활성화
 		if ($(this).prop('checked')) {
            // 다른 체크박스를 모두 해제
            $('.cbox').not(this).prop('checked', false);
            
            // 선택된 체크박스가 cbox5이면 텍스트 입력란을 활성화
            if ($(this).attr('id') === 'cbox5') {
                $('#text').prop('disabled', false);
            } else {
                // 다른 체크박스가 선택되면 텍스트 입력란을 비활성화
                $('#text').prop('disabled', true);
            }
        } else {
            // 체크박스가 해제될 때, 텍스트 입력란을 비활성화
            $('#text').prop('disabled', true);
        }
	});
	
	// 신고 확인 버튼 클릭 시
	$('#reportConfirm').click(function() {
		// 선택된 체크박스 값을 가져오기
		let selectedReasons = [];
			
		$('.cbox:checked').each(function() {
			selectedReasons.push($(this).val());
	});

	// '기타' 체크박스가 선택되었고, 추가 텍스트가 작성되었으면 텍스트 입력값을 가져오기
	let additionalText = '';
	if ($('#whatnot:checked').length > 0) {
        additionalText = $('#text').val();  // '기타'가 선택된 경우, textarea에서 입력된 값 가져오기
    }

	// 폼에 hidden 필드를 동적으로 추가해서 값을 서버로 전송하도록 처리
    if (selectedReasons.length > 0	) {
        // 선택된 사유를 hidden 필드에 추가
        $('#selectedReasons').val(selectedReasons.join(','));

      	// '기타' 텍스트를 hidden 필드에 추가
        $('#hiddenAdditionalText').val(additionalText);

		// 팝업에서 선택된 게시글 ID를 저장
        let reportBoard = $('#reportBoard').val();

		// 해당 게시글을 세션에 저장
		sessionStorage.setItem('reportBoard', reportBoard);
		} else {
		alert("신고 사유를 선택해주세요.");
		}
	});
});