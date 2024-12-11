<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인 - 방잇다</title>

<!-- Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link rel="stylesheet" href="../resources/style/newlogin.css"
	type="text/css">

<!-- JS Libraries -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>


<!-- Custom JS Files -->
<!-- <script type="text/javascript" src="../resources/js/kakaologin.js"></script> -->

<!-- 카카오 스크립트 -->
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.4/kakao.min.js"></script>


<!-- 네이버 스크립트 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
 <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

</head>

<body oncontextmenu="return false" class="snippet-body">
	<div class="container">
		<div class="row">
			<div class="offset-md-2 col-lg-5 col-md-7 offset-lg-4 offset-md-3">
				<div class="panel border bg-white">
					<div class="panel-heading">
						<h3 class="pt-3 font-weight-bold">로그인</h3>
						<sub class="sub1">방과 사람을 잇다. 방잇다</sub>
					</div>

					<div class="panel-body p-3">
						<!-- 로그인 폼 -->
						<form action="newlogin.do" method="POST" name="newlogin">
							<!-- ID 입력 -->
							<label for="userId" style="margin-right: 10px;">아이디</label>
							<div class="form-group py-1 pb-2">
								<div class="input-field">
									<input type="text" id="userId" name="userId"
										placeholder="아이디를 입력하세요" required>
								</div>
							</div>

							<!-- 비밀번호 입력 -->
							<label for="password">비밀번호</label>
							<div class="form-group py-1 pb-2">
								<div class="input-field">
									<input type="password" id="password" name="password"
										placeholder="비밀번호를 입력하세요" required>
									<button type="button" class="btn bg-white text-muted" style="float: right;">
										<span class="far fa-eye-slash"></span>
									</button>
								</div>
							</div>

							<!-- 로그인 상태 유지 -->
							<div class="form-inline">
								<input type="checkbox" name="remember" id="remember"> <label
									for="remember" class="text-muted">로그인 상태 유지하기</label>
							</div>

							<!-- 로그인 메시지 -->
							<p id="loginMessage"></p>


							<!-- 링크들 -->
						<div style="text-align:center;">
							<a href="searchid.do" class="blink1" id="blink1" name="blink1">아이디찾기</a>
							<a href="searchpass.do" class="blink2" id="blink2" name="blink2">비밀번호찾기</a>
							<a href="policy.do" class="blink3" id="blink3" name="blink3">회원가입하기</a>
						</div>
						
							<!-- 로그인 메인 버튼 -->
							<button type="submit" class="btn btn-primary btn-block mt-3"
								>로그인</button>
						<!-- </form> -->

			
						<!-- 네이버 로그인 버튼 추가 -->
            <div class="text-center py-3">
        <!--    <a style="font-size:18px; font-weight: bold;">간편인증 서비스</a> -->
            <hr>
              <div id="naver_id_login" class=""></div>  <!-- 네이버 로그인 버튼 위치 -->
            </div>
           <!--  </form> -->
					</div>
				</div>
			</div>
		</div>
	</div>
   </form>
	<script type="text/javascript">
	//비밀번호 숨기기/보이기 기능
    $(".btn.bg-white.text-muted").click(function() {
        var passwordField = $("input[type='password']");
        var type = passwordField.attr("type") === "password" ? "text" : "password";
        passwordField.attr("type", type);
        $(this).find("span").toggleClass("fa-eye-slash fa-eye");
    });
</script>

	<!--  네이버 로그인 스크립트 -->
<!-- 	<script type="text/javascript">
	    var naver_id_login = new naver_id_login("YOUR_CLIENT_ID", "YOUR_CALLBACK_URL");  // 실제 클라이언트 ID와 콜백 URL로 설정
	    var state = naver_id_login.getUniqState();
	    naver_id_login.setButton("white", 2, 40);
	    naver_id_login.setDomain("YOUR_SERVICE_URL");
	    naver_id_login.setState(state);
	    naver_id_login.setPopup();
 	    naver_id_login.init_naver_id_login(); 
	  </script> -->
	  
</body>
</html>
