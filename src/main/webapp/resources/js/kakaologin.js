// 카카오 초기화 (카카오 개발자 사이트에서 발급받은 JavaScript 키 입력)
Kakao.init('aebb147b09a5ba45c0f8f1c854730495');  
console.log(Kakao.isInitialized());  // 초기화 여부 확인

// 카카오 로그인 버튼 클릭 시 실행될 함수
document.getElementById('kakao-login-btn').onclick = function() {
    loginWithKakao();  // 로그인 함수 호출
};

// 카카오 로그인 함수
function loginWithKakao() {
    Kakao.Auth.login({
        success: function(authObj) {
            console.log(authObj);  // 로그인 성공 시 access_token 출력
            getUserInfo();  // 사용자 정보 가져오기
        },
        fail: function(err) {
            console.log(err);  // 로그인 실패 시 오류 출력
        }
    });
}

// 사용자 정보 가져오기
function getUserInfo() {
    Kakao.API.request({
        url: '/v2/user/me',  // 카카오 사용자 정보 API
        success: function(res) {
            console.log(res);  // 사용자 정보 출력

            // 사용자 정보를 가져오는 예시
            var email = res.kakao_account.email;
            var gender = res.kakao_account.gender;
            var profile_nickname = res.kakao_account.profile.nickname;
            var profile_image = res.kakao_account.profile.thumbnail_image_url;
            var birthday = res.kakao_account.birthday;

            // 필요한 사용자 정보 활용 (예: 콘솔에 출력)
            console.log(email, gender, profile_nickname, profile_image, birthday);
            
            // 사용자 정보를 서버로 전송하는 등의 추가 작업을 할 수 있습니다.
        },
        fail: function(error) {
            console.log('사용자 정보 요청 실패:', error);  // 사용자 정보 요청 실패 시 오류 출력
        }
    });
}
