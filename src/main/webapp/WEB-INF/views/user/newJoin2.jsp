<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 화면 - Bootstrap</title>

<!-- jQuery (최신 버전 3.6.0) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Custom JS Files -->
<script type="text/javascript" src="../resources/js/address.js"></script>
<!-- 우편번호 api  -->
<script type="text/javascript" src="../resources/js/passtoggle.js"></script>
<!-- 보이기/감추기 패스워드 토글 -->
<script type="text/javascript" src="../resources/js/phverifyAuthCode.js"></script>

<!-- 필수입력사항 유효성검사  -->

<!-- Daum Postcode API -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<!-- 필수입력사항 유효성검사  -->
<script type="text/javascript" src="../resources/js/address.js"></script>
<!-- 우편번호 api  -->
<script type="text/javascript" src="../resources/js/passtoggle.js"></script>
<!-- 보이기/감추기 패스워드 토글 -->
<script type="text/javascript" src="../resources/js/phverifyAuthCode.js"></script>


<!-- Popper.js (Bootstrap 4.x에 필요) -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>

<!-- Bootstrap JS (최신 버전 4.4.1) -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>


<!-- <script type="text/javascript" src="../resources/js/js_userinput.js"></script> -->

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<!-- Custom CSS -->
<link rel="stylesheet" href="../resources/style/newjoin.css"
	type="text/css">

<!-- Bootstrap Icons (아이콘 사용) -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">

<script type="text/javascript">
	let pageName = '1';
	/*휴대폰 인증  */
	function sendSMS() {
		console.log("sendSMS 함수 호출됨"); // 로그 출력
		const to = $("input[name='to']").val();
		console.log("입력된 번호:", to); // 로그 출력

		if (!to) {
			alert("수신 번호를 입력하세요!");
			return;
		}

		let pageName = "/javaproject/user/sendSms";

		console.log("AJAX 요청 준비 중..."); // 로그 출력

		$.ajax({
			url : pageName + ".do",
			type : "POST",
			data : JSON.stringify({
				'to' : to
			}),
			contentType : "application/json; charset=UTF-8",
			success : function(response) {
				console.log("응답 성공:", response);
			},
			error : function(xhr, status, error) {
				console.log("AJAX 에러:", error);
			}
		});
	}
	
	// 회원가입폼에서 필수값 4개 입력해야만 가입제출 가능 
    function checkFormAndRedirect() {
        // 입력 필드 값 확인
        var nickName = document.getElementById('nickName').value;
        var userId = document.getElementById('userId').value;
        var email = document.getElementById('email').value;
        var to = document.getElementById('to').value;

        // 필수 입력 값이 비어있는지 확인
        if (!nickName || !userId || !email || !to ) {
            alert('모든 필수 항목을 입력해 주세요.'); // 필수 항목 미입력 시 경고
            return false; // 페이지 이동을 막고 폼 제출을 중지
        }

        // 모든 조건이 맞으면 페이지 이동
        location.href = 'newjointest.do';  // 페이지 이동
        return true;  // 폼 제출을 허용
    }
</script>


</head>

<body>
	<div class="container">
		<form method="post" action="signup.do" name="userinput" id="userinput"
			novalidate  onsubmit="return checkFormAndRedirect()">
			<!-- 필수입력사항 유효성검사 경고메시지  -->
			<div id="checkMessage"
				style="color: red; font-weight: bold; text-align: center;"></div>
			<div class="input-form-backgroud row">
				<div class="input-form col-md-12 mx-auto">
					<h4 class="mb-3" style="text-align: center; position: relative;">
						회원가입 <sup style="position: absolute; top: -10px; right: -10px;">방과
							사람을 잇다. 방잇다</sup>
					</h4>

					<!-- 아이디 -->
					<label for="userId" style="margin-right: 10px;"><small
						style='color: red;'> <필수></small>아이디</label>
					<div class="mb-3" style="display: flex; align-items: center;">
						<input type="text" class="form-control" id="userId" name="userId"
							placeholder="영문/숫자 15자 이하" style="flex: 1;" required
							maxlength="15" pattern="^[a-zA-Z0-9]{1,15}$"></input>
						<button type="button" id="checkUserIdBtn"
							style="margin-left: 10px; width: 120px; height: 38px; background-color: #005555; color: white; border: none; cursor: pointer;">중복확인</button>
					</div>
					<p id="userIdMessage"
						style="color: red; font-size: 14px; margin-top: 10px;"></p>
					<!--  중복확인 메시지 -->
					
					<!-- 사용자 ID 표시 -->
					<div id="userIdDisplay" style="display: none; margin-top: 20px;">
   						 <p>사용자 ID: <span id="userId"></span></p>
					</div>

					<script type="text/javascript">
						/* 유효성 검사만 포함이고 중복검사는 불포함 */
						$(document).ready(function() {
						// 아이디 유효성 검사
						$('#userId').on('input',function() {
							var userId = $(this).val(); // id입력값 가져오기
							var userIdMessage = $('#userIdMessage'); // 중복확인 메시지
							// 아이디 유효성검사
							var regex = /^[a-zA-Z0-9]{1,15}$/;

							if (regex.test(userId)) {
							// id가 유효하면
							userIdMessage.text("아이디가 유효합니다");
							userIdMessage.css("color","green"); // 유효하면 녹색
							userIdMessage.show(); // 메시지 표시
							} else {userIdMessage.text("아이디는 영문/숫자 15자 이내로 입력해주세요");
									userIdMessage.css("color","red"); // 유효하지 않으면 빨간색
									userIdMessage.show(); // 메시지 표시
							}
							}); // end of $('#userId')

							function confirmid() {
									if (!inputform.userId.value) {
										alert(iderror);
										} else {url = 'confirmid.jsp?id='
												+ inputform.id.value;
											open(url, 'confirm','menubar=no, statusbar=no, scrollbar=no, width=400, height=400');
												}
											}
										});

						//두 번째 $(document).ready()
						$(document).ready(function() {
								// id 중복 확인, id 입력칸 벗어나면 동작
								$('#checkUserIdBtn').click(
									function() {
										var id = $("#userId").val();
										// 아이디 입력칸 비어있는지 확인
										if (id == ''|| id.length == 0) {
										$('#userIdMessage').css("color","red").text("공백은 사용 불가");
											return false;
										}
										// 아이디 중복 검사
										checkIdDuplicate(id);
										});
										
										// 아이디 중복검사
										function checkIdDuplicate(id) {
											    $.ajax({
													url : '../check-id', // URL 수정 (서버에서 아이디 중복 확인을 처리하는 컨트롤러 URL)
													type : 'post', // 요청 타입 수정
													data : {userId : id}, // 서버로 보낼 데이터
													success : function(response) {
														var label = $("#userIdMessage");
														if (response.isDuplicate) {label.css("color","red").text("이미 존재하는 아이디입니다.");
																} else {label.css("color","green").text("사용 가능한 아이디입니다.");
															}
														},
														error : function() {
															alert("아이디 중복 확인에 실패했습니다. 다시 시도해주세요.");
														}
												});
											}
										});
					</script>



					<!-- 닉네임 -->
					<label for="nickName" style="margin-right: 10px;"><small
						style='color: red;'> <필수></small>닉네임</label>
					<div class="mb-3" style="display: flex; align-items: center;">
						<input type="text" class="form-control" id="nickName"
							name="nickName" placeholder="영문/숫자 15자 이하" style="flex: 1;"
							required maxlength="15" pattern="^[a-zA-Z0-9]{1,15}$"></input>
						<button type="button" id="checkNicknameBtn"
							style="margin-left: 10px; width: 120px; height: 38px; background-color: #005555; color: white; border: none; cursor: pointer;">
							중복확인</button>
					</div>
					<p id="nickMessage"
						style="color: red; font-size: 14px; margin-top: 5px;"></p>
					<!--  중복확인 메시지 -->

					<script type="text/javascript">
						// 아이디 유효성 검사
						$(document).ready(
							function() {
							$('#nickName').on('input',
								function() {
								var nick = $(this).val(); // id입력값 가져오기
								var nickMessage = $('#nickMessage'); // 중복확인 메시지
								// 닉네임 유효성 검사
								var regex = /^[a-zA-Z0-9]{1,15}$/;
								if (regex.test(nick)) {
								// id가 유효하면
									nickMessage.text("아이디가 유효합니다");
									nickMessage.css("color","green"); // 유효하면 녹색
									nickMessage.show(); // 메시지 표시
									} else {nickMessage.text("아이디는 영문/숫자 15자 이내로 입력해주세요");
											nickMessage.css("color","red"); // 유효하지 않으면 빨간색
											nickMessage.show(); // 메시지 표시
											}
									}); // end of $('#userId')

									function confirmid() {
										if (!inputform.nick.value) {
											alert(nickerror);
										} else {
												url = 'confirmid.jsp?nick='+ inputform.nick.value;
													open(url, 'confirm','menubar=no, statusbar=no, scrollbar=no, width=400, height=400');
												}
											}
										});

						//닉네임 중복확인
						$(document).ready(function() {
							// 닉네임 중복 확인, id 입력칸 벗어나면 동작
							$('#checkNicknameBtn').click(
								function() {
								var nick = $("#nickName").val();
								// 아이디 입력칸 비어있는지 확인
								if (nick == ''|| nick.length == 0) {
									$('#nickMessage').css("color","red").text("공백은 사용 불가");
									return false;
										}

									// 닉네임 중복 검사
									checkNickDuplicate(nick);
									});

									// 닉네임 중복검사
									function checkNickDuplicate(nick) {
										$.ajax({
										url : '../check-nick', // URL 수정 (서버에서 아이디 중복 확인을 처리하는 컨트롤러 URL)
										type : 'post', // 요청 타입 수정
										data : {nickName : nick}, // 서버로 보낼 데이터
										success : function(response) {
												var label1 = $("#nickMessage");
												if (response.isNickDuplicate) { // 서버 응답의 'isNickDuplicate' 속성
														label1.css("color","red").text("이미 존재하는 닉네임입니다.");
														} else {
															label1.css("color","green").text("사용 가능한 닉네임입니다.");
														}
													},
														error : function() {
														alert("닉네임 중복 확인에 실패했습니다. 다시 시도해주세요.");
													}
												});
											}
										});
					</script>

					<!-- 비밀번호 -->
					<div class="mb-3">
						<label for="password">비밀번호 <small><영문 /숫자 10자리 이내></small></label>
						<div class="input-group">
							<input type="password" class="form-control" id="password"
								name="password" placeholder="비밀번호를 입력하세요" required
								maxlength="10" pattern="^[a-zA-Z0-9]{1,10}$"
								onblur="handleBlur()"></input>
							<div class="input-group-append">
								<span class="input-group-text" id="toggle-password"> <i
									class="bi bi-eye"></i>
								</span>
							</div>
						</div>
						<div class="invalid-feedback" style="display: none;">영문/숫자
							10자리 이내 확인해주세요</div>
					</div>

					<!-- 비밀번호 확인 -->
					<div class="mb-3">
						<label for="confirm-password">비밀번호 확인</label>
						<div class="input-group">
							<input type="password" class="form-control" id="confirm-password"
								name="confirm-password" placeholder="비밀번호를 확인하세요" required
								maxlength="10" pattern="^[a-zA-Z0-9]{1,10}$"
								onblur="handleBlur()"></input>
							<div class="input-group-append">
								<span class="input-group-text" id="toggle-confirm-password">
									<i class="bi bi-eye"></i>
								</span>
							</div>
						</div>
						<div class="invalid-feedback" style="display: none;"></div>
					</div>

					<script>
						/* 비번 일치여부 스크립트  */
						function handleBlur() {
							const password = document
									.getElementById('confirm-password').value;
							const confirmPassword = document
									.getElementById('password').value;
							const feedback = document
									.querySelector('.invalid-feedback');

							// 비밀번호와 비밀번호 확인이 일치하지 않으면 경고 메시지 표시
							if (password !== confirmPassword) {
								feedback.textContent = "비밀번호가 일치하지 않습니다."; // 메시지 설정
								feedback.style.display = "block"; // 경고 메시지를 보이게 설정
							} else {
								feedback.textContent = ""; // 메시지 제거
								feedback.style.display = "none"; // 경고 메시지 숨기기
							}
						}
						/*-------------------------------------------------------  */
					</script>


					<!-- 이름, 생년월일 -->
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="name">이름 <small><한글 5자이하></small></label> <input
								type="text" class="form-control" id="name" name="name"
								placeholder="" value="" required maxlength="5"
								pattern="^[가-힣]{1,5}$"></input>
							<div class="invalid-feedback">한글을 입력해 주세요</div>
						</div>
						<script type="text/javascript">
							$(function() {
								$('#name').on('input',
									function() {
										const nameInput = $(this); //#name 참조
										const nameMessage = nameInput.next('.invalid-feedback');
											// 검사
											const regex = /^[가-힣]{1,5}$/; // 가~힣 사이의 한글 5글자 이내인지 검사하겠다
											//한글 아니면 오류메시지 뜨게 (여기서 test는 문자열이 정규식 패턴과 일치하는지 검사하는 기능)
											if (!regex.test(nameInput.val())) { // 입력받은 이름이 가~힣 사이의 한글 5글자 이내 아니면
												nameInput.addClass('is-invalid'); //빨간테두리로 바뀜 
												nameMessage.show();
												} else {
													nameInput.removeClass('is-invalid');
													nameMessage.hide();
													}
											});
										});
						</script>

						<div class="col-md-6 mb-3">
							<label for="birth">생년월일</label> <input type="date"
								class="form-control" id="birth" name="birth" placeholder=""
								value="" required></input>
							<div class="invalid-feedback"></div>
						</div>
					</div>

					<!-- ///////////////////////////////////////////////////////////////////////////////////////-->
					<script type="text/javascript">
							$(document).ready(function() {
							    // 휴대폰 인증요청 버튼 클릭 이벤트
							    $('#sendPhoneVerificationBtn').click(function() {
							        var to = $("#to").val();
							        
							        // 아이디 입력칸이 비어있는지 확인
							        if (to == '' || to.length == 0) {
							            $('#userToMessage').css("color", "red").text("공백은 사용 불가");
							            return false;
							        }
							        
							        // 휴대전화 중복 검사 함수 호출
							        checkToDuplicate(to);
							    });

							    // 휴대전화 중복검사 함수
							    function checkToDuplicate(to) {
							        $.ajax({
							            url: '../check-to', // 서버에서 아이디 중복 확인을 처리하는 URL
							            type: 'POST', // 요청 타입은 POST
							            data: { to: to }, // 서버로 보낼 데이터 (아이디)
							            success: function(response) {
							                var label = $("#userToMessage");

							                // 중복 여부에 따른 메시지 출력
							                if (response.isToDuplicate) {
							                    label.css("color", "red").text("이미 존재하는 아이디입니다.");
							                } else {
							                    label.css("color", "green").text("사용 가능한 아이디입니다.");
							                }
							            },
							            error: function() {
							                alert("아이디 중복 확인에 실패했습니다. 다시 시도해주세요.");
							            }
							        });
							    }
							});
	
							</script>



					<!-- 휴대전화번호 입력칸 -->
					<div class="row">
						<div class="col-md-6 mb-3 d-flex align-items-center">
							<div class="flex-grow-1">
								<label for="mobile" style="width: 170px;"><small
									style='color: red;'> <필수></small>휴대전화</label> <input type="text"
									class="form-control" id="to" name="to"
									placeholder="휴대폰번호를 입력해 주세요" value="" required></input>
								<div class="invalid-feedback"></div>
							</div>
							<p id="userToMessage"
								style="color: red; font-size: 14px; margin-top: 10px;"></p>
							<!--  중복확인 메시지 -->

							<div>
								<label for="verifyPhoneBtn" style="width: 170px;">&nbsp;</label>
								<button type="button" id="sendPhoneVerificationBtn"
									style="margin-left: 5px; width: 120px; height: 38px; background-color: #005555; color: white; border: none; cursor: pointer;"
									onclick="sendSMS()">인증번호요청</button>
							</div>
						</div>
						
						<script type="text/javascript">
						
						
						
						
						</script>

						<!-- 인증번호 입력칸  -->
						<div class="col-md-6 mb-3 d-flex align-items-center">
							<div class="flex-grow-1">
								<label for="text" style="width: 170px;">&nbsp;</label> <input
									type="text" class="form-control" id="authCode" name="authCode"
									placeholder="숫자6자리" value="" required maxlength="6"
									oninput="validateCheck()" pattern="^[0-9]{1,6}$"></input>
								<div class="invalid-feedback"></div>
							</div>
							<div>
								<label for="phone" style="width: 170px;">&nbsp;</label>
								<button type="button" id="checkButton1"
									style="margin-left: 5px; width: 120px; height: 38px; background-color: #005555; color: white; border: none; cursor: pointer;"
									onclick="phverifyAuthCode()">인증확인</button>
							</div>
						</div>
						<!-- 인증성공메시지  -->
						<div class="col-md-12 mb-3 d-flex align-items-center">
							<div class="flex-grow-1">
								<!-- successMessage 클래스 추가 -->
								<div class="successMessage"
									style="display: none; color: green; font-weight: bold;">
									인증이 성공적으로 완료되었습니다!</div>
							</div>
						</div>



						<!-- ///////////////////////////////////////////////////////////////////////////////////////-->														
						<!-- 이메일 입력칸 -->
								<div class="col-md-6 mb-3 d-flex align-items-center">
									<div class="flex-grow-1">
										<label for="email" style="width: 170px;"><small
											style='color: red;'> <필수></small>email</label> <input
											type="text" class="form-control" id="email" name="email"
											placeholder="이메일입력하세요" value="ksuwyg91@nate.com" required></input>
										<div class="invalid-feedback"></div>
										  <!-- 이메일 관련 메시지를 표시할 공간 -->
       									 <p id="emailMessage" style="color: red;"></p>
									</div>

									<div>
										<label for="sendEmailVerificationBtn" style="width: 170px;">&nbsp;</label>
										<!-- 버튼을 하나로 사용 / 동적 변경 -->
										<button type="button" id="sendEmailVerificationBtn"
											style="margin-left: 5px; width: 120px; height: 38px; background-color: #005555; color: white; border: none; cursor: pointer;"
											onclick="sendEmail('signup')">인증번호요청</button>
									</div>
								</div>
								<p id="emailMessage" style="color: red; font-size: 14px; margin-top: 10px;"></p>
							<!--  중복확인 메시지 -->
								
								<script type="text/javascript">
								$(document).ready(function() {
								    // 버튼 클릭 시 처리
								    $('#sendEmailVerificationBtn').click(function() {
								        var email = $('#email').val();  // 이메일 입력값 가져오기
								        var buttonText = $(this).text();  // 버튼 텍스트 가져오기

								        if (!email) {
								            alert("이메일을 입력하세요.");
								            return;
								        }

								        // 이메일 형식 확인 (정규식 예시)
								        var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
								        if (!emailPattern.test(email)) {
								            alert("유효하지 않은 이메일 형식입니다.");
								            return;
								        }

								        if (buttonText === "중복확인") {
								            // 중복 확인 요청
								            $.ajax({
								                type: 'POST',
								                url: '/checkEmailDuplicate',  // 중복 확인 API 엔드포인트
								                data: { email: email },
								                success: function(response) {
								                    if (response === "중복된 이메일입니다.") {
								                        $('#emailMessage').text('중복된 이메일입니다. 다른 이메일을 사용해주세요.');
								                        $('#sendEmailVerificationBtn').prop('disabled', false);  // 버튼 활성화
								                    } else {
								                        $('#emailMessage').text('유효한 이메일입니다. 인증번호를 요청하세요.');
								                        $('#sendEmailVerificationBtn').text('인증번호 요청');  // 버튼 텍스트 변경

								                        // 인증번호 요청 클릭 핸들러로 변경
								                        $('#sendEmailVerificationBtn').off('click').on('click', function() {
								                            sendEmail(email);  // 인증번호 요청 함수 호출
								                        });
								                    }
								                },
								                error: function() {
								                    $('#emailMessage').text('오류가 발생했습니다. 다시 시도해주세요.');
								                }
								            });
								        } else if (buttonText === "인증번호 요청") {
								            // 인증번호 요청
								            sendEmail(email);
								        }
								    });

								    // 인증번호 요청 함수
								    function sendEmail(email) {
								        if (!email) {
								            alert("이메일을 입력하세요");
								            return;
								        }

								        let param = {'email': email};  // 이메일을 파라미터로 서버에 전송

								        $.ajax({
								            url: "../emailCheck.do",  // 인증번호 요청 API 엔드포인트
								            type: "get",  // GET 방식
								            data: param,
								            success: function(response) {
								                // 서버에서 인증번호 발송 성공 시
								                alert("인증코드를 메일로 전송했습니다. 메일 확인해주세요.");
								                $('#sendEmailVerificationBtn').prop('disabled', true);  // 인증번호 요청 후 버튼 비활성화
								            },
								            error: function(error) {
								                // 서버와의 통신 에러 시
								                console.log("에러 발생:", error);
								                alert("인증번호 요청에 실패했습니다. 다시 시도해주세요.");
								            }
								        });
								    }
								});
		  								   
								</script>
							<!-- 인증번호 입력칸 -->
							<div class="col-md-6 mb-3 d-flex align-items-center">
								<div class="flex-grow-1">
									<label for="text" style="width: 170px;">&nbsp;</label> <input
										type="text" class="form-control" id="check2" name="check2"
										placeholder="숫자6자리" value="" required maxlength="6"
										oninput="validateCheck2()" pattern="^[0-9]{1,6}$"></input>
									<div class="invalid-feedback"></div>
								</div>
								<div>
									<label for="email" style="width: 170px;">&nbsp;</label>
									<button type="button" id="checkButton2"
										style="margin-left: 5px; width: 120px; height: 38px; background-color: #005555; color: white; border: none; cursor: pointer;"
										onclick="verifyAuthCode()">인증확인</button>
								</div>

							<script type="text/javascript">
								// 인증번호 입력칸에서 숫자만 입력 가능하도록 실시간 검증
								function validateCheck2() {
									var inputField = document
											.getElementById("check2");
									var value = inputField.value;

									// 숫자만 입력하도록
									inputField.value = value.replace(/[^0-9]/g,
											''); // 숫자가 아닌 모든 문자 제거
								}

								 ////////////이메일 인증 요청 삭제금지///////////////					 
								/* let authCode = null;

								function sendEmail(pageName) {

									const email = $("input[name='email']")
											.val(); // 이메일 입력값 가져오기
									if (!email) {
										alert("이메일 입력하세요");
										return;
									}

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
											alert("인증코드를 메일로 전송했습니다. 메일 확인해주세요");
											},
										error : function(error) {
											//실패시
											console.log("에러발생 :",
											error);
											alert("인증번호 요청 실패");
											}
										});
								} //end of sendEmail 
 */
								//인증번호 서버랑 내꺼랑 확인하는거 삭제금지 
								function verifyAuthCode() {
									var userInputCode = document.getElementById("check2").value; // 입력된 인증 코드
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
										success : function(response) {
											// 서버의 응답 처리 (인증 성공 또는 실패 메시지)
											alert(response); // 서버에서 보낸 메시지를 alert로 표시
										},
										error : function() {
											alert("인증 코드 확인 중 오류dp가 발생했습니다.");
										}
									});
								} //end of verifyAuthCode
							</script>
						</div>
					</div>



					<!-- ///////////////////////////////////////////////////////////////////////////////////////-->

					<!-- 주소 입력 -->
					<label for="address" style="margin-right: 10px;">주소</label>
					<div class="mb-3" style="display: flex; align-items: center;">
						<input type="text" class="form-control" id="address"
							name="address" placeholder="주소" required readonly
							style="width: 100%;"></input>
						<button type="button" id="postcodeIframe"
							style="margin-left: 10px; width: 120px; height: 38px; background-color: #005555; color: white; border: none; cursor: pointer;"
							onclick="openPostcode()">우편번호</button>
					</div>

					<div class="mb-3">
						<label for="address2">상세주소<span class="text-muted">&nbsp;(필수
								아님)</span></label> <input type="text" class="form-control" id="address2"
							name="address2" placeholder="상세주소를 입력해주세요."></input>
					</div>


					<!-- 가입 버튼 -->
					<button class="btn btn-primary btn-lg btn-block" id="registBtn"
						style="background-color: #005555;" type="submit">가입하기</button>
				</div>
			</div>
		</form>
	</div>

	<script type="text/javascript">
		// 휴대전화번호 입력시 한글입력 불가
		document.getElementById('to').addEventListener('input',
				function(event) {
					// 입력 값에서 한글을 제외한 숫자만 남긴다.
					this.value = this.value.replace(/[^0-9]/g, '');
				});

		function openPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					document.getElementById('address').value = data.address;
				}
			}).open();
		}

		//비번 눈보이기랑 감추기 
		document.addEventListener('DOMContentLoaded', function() {
			// 비밀번호 보이기/숨기기
			document.getElementById('toggle-password')
					.addEventListener(
							'click',
							function() {
								var passwordField = document
										.getElementById('password');
								var icon = this.querySelector('i');
								if (passwordField.type === 'password') {
									passwordField.type = 'text';
									icon.classList.replace('bi-eye',
											'bi-eye-slash');
								} else {
									passwordField.type = 'password';
									icon.classList.replace('bi-eye-slash',
											'bi-eye');
								}
							});

			document.getElementById('toggle-confirm-password')
					.addEventListener(
							'click',
							function() {
								var confirmPasswordField = document
										.getElementById('confirm-password');
								var icon = this.querySelector('i');
								if (confirmPasswordField.type === 'password') {
									confirmPasswordField.type = 'text';
									icon.classList.replace('bi-eye',
											'bi-eye-slash');
								} else {
									confirmPasswordField.type = 'password';
									icon.classList.replace('bi-eye-slash',
											'bi-eye');
								}
							});
		});
	</script>


</body>
</html>


