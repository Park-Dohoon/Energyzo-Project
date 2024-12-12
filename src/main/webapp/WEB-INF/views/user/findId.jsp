<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인 - 방잇다</title>

<!-- favicon -->
<link rel="shortcut icon" href="../resources/static/base_template/favicon.png" type="image/x-icon" />

<!-- Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link rel="stylesheet" href="../resources/style/findid.css"
	type="text/css">

<!-- JS Libraries -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>

<body oncontextmenu="return false" class="snippet-body">
	<div class="container">
		<div class="row">
			<div class="offset-md-2 col-lg-5 col-md-7 offset-lg-4 offset-md-3">
				<div class="panel border bg-white ">
					<div class="panel-heading">
						<h3 class="pt-3 font-weight-bold"
							style="display: flex; justify-content: center; align-items: center;">
							<i class="fas fa-search fa-2x"></i>아이디 찾기
						</h3>
						<sub class="sub1">방과 사람을 잇다. 방잇다</sub>
					</div>

					<div class="panel-body p-3"
						style="display: flex; justify-content: center; align-items: center;">
						<!--인증 폼 -->
						<form action="searchid.do" method="POST" name="searchid"
							id="searchid">
							<div class="col-md-6 mb-3 d-flex align-items-center style="">
								<div class="flex-grow-1">
									<label for="useremail" style="width: 210px;">&nbsp;</label> <input
										type="email" class="form-control" id="useremail"
										name="useremail" placeholder="이메일을 입력하세요" value="ksuwyg91@nate.com" required>
									<div class="invalid-feedback"></div>
								</div>
								<div>
									<label for="verifyPhoneBtn" style="width: 170px;">&nbsp;</label>
									<button type="button" id="sendPhoneVerificationBtn"
										style="margin-left: 5px; width: 120px; height: 38px; 
										background-color: #005555; color: white; border: none; cursor: pointer;"
										onclick="sendEmail()">인증번호요청</button>
								</div>
							</div>

							<!-- 인증번호 입력칸  -->
							<div class="col-md-6 mb-3 d-flex align-items-center">
								<div class="flex-grow-1">
									<label for="numcheck" style="width: 210px;">&nbsp;</label> <input
										type="text" class="form-control" id="numcheck" name="numcheck"
										placeholder="인증번호6자리" value="" required maxlength="6"
										oninput="validateCheck2()" pattern="^[0-9]{1,6}$">
									<div class="invalid-feedback"></div>
								</div>
								<div>
									<label for="phone" style="width: 170px;">&nbsp;</label>
									<button type="button" id="checkButton1"
										style="margin-left: 5px; width: 120px; height: 38px; background-color: #005555; color: white; border: none; cursor: pointer;"
										onclick="verifyAuthCode()">인증확인</button>
								</div>
							</div>
							<!-- userIdDisplay 추가 부분 -->
							<div id="userIdDisplay" style="display: none; margin-top: 20px;">
								<!-- 인증 성공 시 실제 사용자 ID가 여기에 표시됩니다 -->
								<p>
									사용자 ID: <span id="userId"></span>
								</p>



								<script type="text/javascript">
									// 인증번호 입력칸에서 숫자만 입력 가능하도록 실시간 검증
									function validateCheck2() {
										var inputField = document
												.getElementById("numcheck"); //id값 입력
										var value = inputField.value;

										// 숫자만 입력하도록
										inputField.value = value.replace(/[^0-9]/g, ''); // 숫자가 아닌 모든 문자 제거
									}
	
									//이메일 인증 요청 삭제금지  --> 중요도 극상!!!					 
									let authCode = null;
								
									function sendEmail() {

										const email = $("input[name='useremail']").val(); // 수신자(받을사람) 이메일 입력값 가져오기
										if (!email) {
											alert("이메일 입력하세요");
											return;
										}
										
										//data에 들어갈 값
										let param = {
											'email' : email
										};

										$.ajax({
											url : "../emailCheck.do",
											type : "get",
											data : param,
											success : function(response) {
												//성공시
												//authCode = response.authCode; //서버에서 받은 인증번호 저장 
												//console.log("메시지 출력");
												alert("인증코드를 메일로 전송했습니다. 메일 확인해주세요");
												},
												error : function(error) {
												//실패시
												console.log("에러발생 :",error);
													alert("인증번호 요청 실패");
													}
												});
									} //end of sendEmail

									//인증번호 서버랑 내꺼랑 확인하는거 삭제금지 
									function verifyAuthCode() {
										var userInputCode = document.getElementById("numcheck").value; // 입력된 인증 코드
										if (!userInputCode) {
											alert("인증번호를 입력해주세요.");
											return;
										}
								
									let param = {
											'authCode' : userInputCode
										};
									
									
										// 인증 코드를 서버로 전송
										$.ajax({
											url : '../verifyAuthCode.do', // 서버의 verifyAuthCode.do URL로 요청
											type : 'GET',
											data : param, // 입력한 인증 코드를 파라미터로 전송
											dataType : 'json',
											success : function(response) {
												console.log(response); 
												// 서버의 응답 처리 (인증 성공 또는 실패 메시지)
												//alert(response); // 서버에서 보낸 메시지를 alert로 표시
												alert("["+response.resultMessage+"]");
												
												if(response.resultMessage.trim() === "인증성공") { // 컨트롤러의 resultMessage와 동일하게 해줘얗
												//$('#userIdDisplay').show(); // 아이디를 표시할 div를 보이게 함
												//$('#userId').text(response.userId); // userId를 화면의 특정 요소에 표시
												alert("아이디: "+ response.userId); // 팝업통해 출력
												
												} else {
													alert(response.resultMessage); //인증실패시 메시지 표시
													$('#userIdDisplay').hide(); // 인증실패시 id 표시 숨김
												}
										},
											error : function(error) {
											alert("인증 코드 확인 중 오류가 발생했습니다.");
											console.log(error);
											}
										});
									}
							</script>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>
