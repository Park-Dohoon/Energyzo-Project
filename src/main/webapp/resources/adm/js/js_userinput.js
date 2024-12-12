$(function(){
	// 사용자의 자료 입력여부를 검사하는 함수
	$('#checkUserIdBtn').click(function(){
    	// 아이디가 비어있는지 확인
    	if( $.trim($("#userId").val()) == '' ){
            alert("아이디를 입력해 주세요.");
            $("#userId").focus();
            return;
        }
    	
    	// 비밀번호가 비어있는지 확인
    	if($.trim($('#password').val()) == ''){
    		alert("비밀번호를 입력해 주세요.");
    		$('#password').focus();
    		return;
    	}
    	
    	// 비밀번호 확인이 일치하는지 확인
    	if($.trim($('#password').val()) != $.trim($('#confirm-password').val())){
    		alert("비밀번호가 일치하지 않습니다.");
    		$('#confirm-password').focus();
    		return;
    	}
    	
    	// 이름 입력 확인을 주석으로 제외시킨 부분이 있으면 다시 복원
    	/*if($.trim($('#userName').val()) == ''){
    		alert("이름을 입력해 주세요.");
    		$('#userName').focus();
    		return;
    	}*/
       
        // 모든 검증 후 폼 제출
        document.userinput.submit();
	});
	
	// 아이디 중복 체크
	$('#userId').keyup(function(){
        $.ajax({
        	type: 'post',
        	url: 'idCheck.do',
        	data: {userId: $('#userId').val()},
        	contentType: 'application/x-www-form-urlencoded;charset=utf-8',
        	success: function(result){
        		$('#checkUserIdBtn').text(result); // 아이디 중복 결과를 버튼 텍스트로 표시
        	}			        
        });
	});
});
