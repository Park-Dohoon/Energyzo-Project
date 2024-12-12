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
            <div class="value" id="pointAmount">0</div> <!-- 포인트를 동적으로 업데이트할 요소 -->
            <hr>
            <div class="subtext">1,000P = 1,000원</div>
        </div>
        <div class="section">
            <div class="label">② 결제 예정 금액:</div>
            <div class="value big" id="paymentAmount">0</div> <!-- 금액을 동적으로 업데이트할 요소 -->
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
        
        <!-- 다른 내용과 겹치지 않도록 하단에 숨겨놓은 폼 -->
		<form id="addPointForm" action="addPoint.do" method="POST" style="display:none;">
		    <input type="hidden" name="amount" id="amount" value="0" />
		</form>
		        
        <div class="section notice">
            <span>※ 주의사항: 결제 완료 후 환불이 되지 않습니다.</span>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let currentAmount = 0; // 초기 금액
            let currentPoints = 0; // 초기 포인트

            // 금액과 포인트를 추가하는 함수
            function addAmount(amount) {
                currentAmount += amount; // 금액을 추가
                currentPoints += amount; // 포인트도 동일하게 추가
                document.getElementById("paymentAmount").innerText = currentAmount.toLocaleString(); // 결제 금액 업데이트
                document.getElementById("pointAmount").innerText = currentPoints.toLocaleString(); // 포인트 업데이트
            }

            // 각 버튼에 이벤트 리스너 추가
            document.getElementById("button1000").addEventListener("click", function () {
                addAmount(1000);
            });
            document.getElementById("button3000").addEventListener("click", function () {
                addAmount(3000);
            });
            document.getElementById("button5000").addEventListener("click", function () {
                addAmount(5000);
            });
            document.getElementById("button10000").addEventListener("click", function () {
                addAmount(10000);
            });

            // 결제 버튼 클릭 시 처리
            document.getElementById("payButton").addEventListener("click", function () {
                const IMP = window.IMP; // 생략 가능
                IMP.init("<%= "imp83235240" %>"); // 고객사 식별 코드 JSP 표현식 사용

                // 결제 요청
                IMP.request_pay({
                    pg: "html5_inicis", // 테스트 PG사
                    pay_method: "card", // 결제 방법
                    merchant_uid: "merchant_" + new Date().getTime(), // 고유 주문 ID
                    name: "방 잇다 결제",
                    amount: currentAmount, // 결제 금액
                    buyer_email: "test@iamport.kr",
                    buyer_name: "김서연",
                    buyer_tel: "010-1234-5678",
                    buyer_addr: "서울특별시 강남구 삼성동",
                    buyer_postcode: "123-456",
                    popup: true // 팝업 모드 활성화
                }, function (rsp) {
                    if (rsp.success) {
                        alert("결제가 성공적으로 완료되었습니다.");
                        console.log(rsp);
                        
                        document.getElementById("amount").value = currentAmount; // 폼에 금액 설정
                        document.getElementById("addPointForm").submit(); // 폼 전송
                        
                    } else {
                        alert("결제에 실패했습니다. 에러 내용: " + rsp.error_msg);
                        console.error(rsp);
                    }
                });
            });
        });
    </script>
</body>
</html>
