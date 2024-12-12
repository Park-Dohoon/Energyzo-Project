<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>비밀번호 찾기 - 방잇다</title>

<!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" rel="stylesheet">


<!-- JS Libraries -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<style>
    body {
        background: linear-gradient(to bottom right, #2c3e50, #34495e); /* 고급스러운 그라데이션 배경 */
        font-family: 'Arial', sans-serif;
        color: #ecf0f1; /* 밝은 글자 색상 */
    }

    .container {
        margin-top: 100px;
    }

    .panel {
        border-radius: 12px;
        background-color: #ffffff;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }

    .panel-heading {
        text-align: center;
        padding: 30px;
        font-size: 28px;
        font-weight: bold;
        color: #2c3e50;
        border-bottom: 2px solid #2980b9; /* 고급스러운 파란색 */
    }

    .panel-body {
        padding: 40px;
    }

    .form-control {
        margin-bottom: 20px;
        padding: 15px;
        border-radius: 8px;
        border: 1px solid #bdc3c7;
        font-size: 16px;
    }

    .form-control:focus {
        border-color: #3498db; /* 포커스 시 파란색 */
        box-shadow: 0 0 5px rgba(52, 152, 219, 0.5);
    }

    .btn-custom {
        background: linear-gradient(45deg, #3498db, #2ecc71); /* 그라데이션 버튼 */
        color: white;
        padding: 15px 30px;
        font-size: 16px;
        width: 100%;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: all 0.3s ease; /* 버튼에 부드러운 애니메이션 효과 */
    }

    .btn-custom:hover {
        background: linear-gradient(45deg, #2980b9, #27ae60);
        transform: translateY(-3px); /* 호버 시 버튼이 올라가는 애니메이션 */
    }

    .btn-custom:active {
        transform: translateY(2px); /* 클릭 시 버튼이 눌리는 효과 */
    }

    .sub1 {
        font-size: 14px;
        color: #95a5a6;
    }

    #userIdDisplay {
        margin-top: 20px;
        text-align: center;
        display: none;
        background-color: #ecf0f1;
        padding: 15px;
        border-radius: 8px;
        font-weight: bold;
        color: #2c3e50;
    }

    .form-group label {
        font-size: 16px;
        font-weight: 500;
		color : black;    
    }
</style>

</head>

<body oncontextmenu="return false" class="snippet-body">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6 col-md-8">
                <div class="panel border">
                    <div class="panel-heading">
                        <i class="fas fa-lock fa-2x"></i> 비밀번호 찾기
                        <sub class="sub1">방과 사람을 잇다. 방잇다</sub>
                    </div>

                    <div class="panel-body">
                        <!-- 인증 폼 -->
                        <form action="searchpass.do" method="POST" name="searchpass" id="searchpass">
                            <div class="form-group">
                                <label for="useremail">&nbsp;&nbsp;E-mail</label>
                                <input type="email" class="form-control" id="useremail" name="useremail" placeholder="이메일을 입력하세요" value="" required>
                                <button type="button" id="sendPhoneVerificationBtn" class="btn-custom" onclick="sendEmail()">인증번호 요청</button>
                            </div>

                            <!-- 인증번호 입력칸 -->
                            <div class="form-group">
                                <label for="numcheck">&nbsp;&nbsp;인증번호</label>
                                <input type="text" class="form-control" id="numcheck" name="numcheck" placeholder="인증번호 6자리" maxlength="6" required oninput="validateCheck2()" pattern="^[0-9]{1,6}$">
                                <button type="button" id="checkButton1" class="btn-custom" onclick="verifyAuthCode()">인증확인</button>
                            </div>

                            <!-- 인증 성공 시 아이디 표시 -->
                            <div id="userIdDisplay">
                                <p>비밀번호: <span id="userPassword"></span></p>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        // 인증번호 입력칸에서 숫자만 입력 가능하도록 실시간 검증
        function validateCheck2() {
            var inputField = document.getElementById("numcheck"); //id값 입력
            var value = inputField.value;
            inputField.value = value.replace(/[^0-9]/g, ''); // 숫자가 아닌 모든 문자 제거
        }

        // 이메일 인증 요청
        function sendEmail() {
            const email = $("input[name='useremail']").val(); // 이메일 입력값 가져오기
            if (!email) {
                alert("이메일을 입력하세요");
                return;
            }

            let param = { 'email': email };

            $.ajax({
                url: "../emailCheck.do",
                type: "get",
                data: param,
                success: function(response) {
                    alert("인증코드를 메일로 전송했습니다. 메일 확인해주세요");
                },
                error: function(error) {
                    alert("인증번호 요청 실패");
                }
            });
        }

        // 인증번호 확인
        function verifyAuthCode() {
            var userInputCode = document.getElementById("numcheck").value; // 입력된 인증 코드
            if (!userInputCode) {
                alert("인증번호를 입력해주세요.");
                return;
            }

            let param = { 'authCode': userInputCode };

            $.ajax({
                url: '../verifyAuthCode.do', // 서버의 verifyAuthCode.do URL로 요청
                type: 'GET',
                data: param, // 입력한 인증 코드를 파라미터로 전송
                dataType: 'json',
                success: function(response) {
                    alert("["+response.resultMessage+"]");
                    if (response.resultMessage.trim() === "인증성공") {
                        alert("비밀번호: " + response.password); // 팝업통해 출력
                    } else {
                        alert(response.resultMessage); // 인증 실패 시 메시지 표시
                    }
                },
                error: function(error) {
                    alert("인증 코드 확인 중 오류가 발생했습니다.");
                }
            });
        }
    </script>
</body>

</html>
