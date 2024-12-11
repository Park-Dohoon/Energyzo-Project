function phverifyAuthCode() {
    const authCode = $("input[name='authCode']").val();  // 사용자가 입력한 인증코드
    if (!authCode) {
        alert("인증코드를 입력하세요!");
        return;
    }

    $.ajax({
        url: 'phverifyAuthCode.do',  // 서버의 인증 처리 URL
        type: 'POST',
        data: { authCode: authCode },  // 입력한 인증코드
        success: function(response) {
        /*    alert(response);  // 서버에서 받은 인증 결과
*/            alert("인증성공!")
        }
    });
}


