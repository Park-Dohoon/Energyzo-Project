<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>결제 테스트</title>
    <script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
    <h1>아임포트 결제 테스트</h1>
    <button id="payButton">결제하기</button>

    <script>
        document.getElementById('payButton').addEventListener('click', function () {
            const IMP = window.IMP; // 생략 가능
            IMP.init("<%= "imp83235240" %>"); // 고객사 식별 코드 JSP 표현식 사용

            IMP.request_pay({
                pg: "html5_inicis", // 테스트 PG사
                pay_method: "card", // 결제 방법
                merchant_uid: "merchant_" + new Date().getTime(), // 상점에서 생성한 고유 주문 ID
                name: "테스트 결제",
                amount: 100, // 결제 금액
                buyer_email: "test@iamport.kr",
                buyer_name: "테스트 유저",
                buyer_tel: "010-1234-5678",
                buyer_addr: "서울특별시 강남구 삼성동",
                buyer_postcode: "123-456"
            }, function (rsp) {
                if (rsp.success) {
                    alert('결제가 성공적으로 완료되었습니다.');
                    console.log(rsp);
                } else {
                    alert('결제에 실패했습니다. 에러 내용: ' + rsp.error_msg);
                    console.error(rsp);
                }
            });
        });
    </script>
</body>
</html>
