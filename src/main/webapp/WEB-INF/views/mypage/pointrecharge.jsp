<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>포인트 충전 </title>
    <link href="resources/static/css/pointRecharge.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <div class="section">
            <div class="label">① 충전할 포인트:</div>
            <div class="value">1,000</div>
            <hr>
            <div class="subtext">1,000P = 1,000원</div>
        </div>
        <div class="section">
            <div class="label">② 결제 예정 금액:</div>
            <div class="value big" id="paymentAmount">1,000</div> <!-- 금액을 동적으로 업데이트할 요소에 id 추가 -->
            <hr>
        </div>
        <div class="section buttons">
            <!-- 버튼 클릭 시 addAmount 함수를 호출하도록 수정 -->
            <button id="button1000">+ 1,000</button>
            <button id="button3000">+ 3,000</button>
            <button id="button5000">+ 5,000</button>
            <button id="button10000">+ 10,000</button>
        </div>
        <div class="section">
            <button class="pay-button" id="payButton">결제하기</button>
        </div>
        <div class="section notice">
            <span>※ 주의사항: 결제 완료 후 환불이 되지 않습니다.</span>
        </div>
    </div>

    <script>
        // DOM이 로드된 후 JavaScript가 실행되도록 함
        document.addEventListener("DOMContentLoaded", function () {
            let currentAmount = 1000; // 초기 금액

            // 금액을 추가하는 함수
            function addAmount(amount) {
                currentAmount += amount; // 금액을 더함
                document.getElementById("paymentAmount").innerText = currentAmount.toLocaleString(); // 결제 예정 금액 표시 업데이트
            }

            // 각 버튼에 이벤트 리스너 추가
            document.getElementById("button1000").addEventListener("click", function() {
                addAmount(1000);
            });
            document.getElementById("button3000").addEventListener("click", function() {
                addAmount(3000);
            });
            document.getElementById("button5000").addEventListener("click", function() {
                addAmount(5000);
            });
            document.getElementById("button10000").addEventListener("click", function() {
                addAmount(10000);
            });

            // 결제 버튼 클릭 시 처리
            document.getElementById('payButton').addEventListener('click', function () {
                const IMP = window.IMP; // 생략 가능
                IMP.init("<%= "imp83235240" %>"); // 고객사 식별 코드 JSP 표현식 사용

                // 결제 요청
                IMP.request_pay({
                    pg: "html5_inicis", // 테스트 PG사
                    pay_method: "card", // 결제 방법
                    merchant_uid: "merchant_" + new Date().getTime(), // 고유 주문 ID
                    name: "방 잇다 결제",
                    amount: currentAmount, // 결제 금액을 동적으로 설정
                    buyer_email: "test@iamport.kr",
                    buyer_name: "김서연",
                    buyer_tel: "010-1234-5678",
                    buyer_addr: "서울특별시 강남구 삼성동",
                    buyer_postcode: "123-456",
                    popup: true // 팝업 모드 활성화
                }, function (rsp) {
                    // 응답 처리
                    if (rsp.success) {
                        alert('결제가 성공적으로 완료되었습니다.');
                        console.log(rsp);
                    } else {
                        alert('결제에 실패했습니다. 에러 내용: ' + rsp.error_msg);
                        console.error(rsp);
                    }
                });
            });
        });
    </script>
</body>
</html>
