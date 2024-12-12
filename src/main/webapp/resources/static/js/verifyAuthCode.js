function verifyAuthCode() {
    const authCode = $("input[name='authCode']").val();  // 사용자가 입력한 인증코드
    if (!authCode) {
        alert("인증코드를 입력하세요!");
        return;
    }

    $.ajax({
        url: 'verifyAuthCode1.do',  // 서버의 인증 처리 URL
        type: 'POST',
        data: { authCode: authCode },  // 입력한 인증코드
        success: function(response) {
            // 서버의 응답 처리 (인증 성공 또는 실패 메시지)
            console.log("서버 응답:", response);
            // 인증 완료 메시지를 모달로 표시
            if (response.message) {
                $('#unregisterModal .modal-body').text(response.message); // 서버에서 보낸 메시지를 모달에 추가
            } else {
                $('#unregisterModal .modal-body').text("인증이 완료되었습니다. 홈 화면으로 이동합니다.");
            }
            // 모달 띄우기
            $('#unregisterModal').modal('show');
        },
    });
}
