<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>포인트 충전</title>
<link href="resources/static/css/pointRecharge.css" rel="stylesheet" />
<script>
let currentAmount = 0;
let powerDate = "${agent.power_date}"; 
let currentDate = new Date(powerDate);

function formatDate(date) {
    return date.toISOString().split('T')[0];
}

function addDaysToCurrentDate(days) {
    currentDate.setDate(currentDate.getDate() + days); // 날짜에 일수 추가
    const formattedDate = formatDate(currentDate);
    document.getElementById("updatedPowerDate").textContent = formatDate(currentDate); // 변경된 날짜 화면에 업데이트
    document.getElementById("powerDateInput").value = formattedDate;
}

function addAmount(amount) {
    currentAmount += amount;
    document.getElementById("chargePoint").textContent = formatNumber(currentAmount);
    document.getElementById("paymentPoint").textContent = formatNumber(currentAmount);
    document.getElementById("point_pt").value = currentAmount;
}

// 숫자를 1,000 단위로 콤마 형식으로 변환
function formatNumber(num) {
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// AJAX로 폼 데이터를 전송하는 함수
function submitForm(event) {
    event.preventDefault();  // 폼 제출을 막고 AJAX로 처리

    // 현재 보유 포인트와 결제 예정 포인트 가져오기
    const totalPoints = parseInt("${payment.total_points}".replace(/,/g, "")) || 0; // ${payment.total_points}는 서버에서 전달
    const paymentPoints = currentAmount;

    // 비교 로직
    if (paymentPoints > totalPoints) {
        alert("현재 보유 포인트보다 결제 예정 포인트가 큽니다. 결제를 진행할 수 없습니다.");
        return; // 폼 제출 중단
    }

    // 폼 데이터 가져오기
    var formData = new FormData(event.target);

    // AJAX로 폼 데이터를 서버로 전송
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "pointrecharge2.do", true);

    xhr.onload = function() {
        if (xhr.status === 200) {
            // 서버에서 성공적으로 처리한 후, 창을 닫고 테이블을 갱신
            closeWindow();
            updateTable();  // 테이블 갱신
        } else {
            alert("오류가 발생했습니다.");
        }
    };

    xhr.send(formData);
}

// 팝업창 닫기 함수
function closeWindow() {
     window.close();  // 창을 닫음
}

// 테이블 갱신 함수 (페이지 새로 고침)
function updateTable() {
    // 페이지 새로 고침하여 테이블 갱신
    window.opener.location.reload();  // 부모 창을 새로 고침
}
</script>
</head>
<body>
	<div class="container">
		<div class="section">
			<div class="label">현재 만료일자:</div>
			<div class="value">${agent.power_date}</div>
		</div>

		<form action="pointrecharge2.do" method="post"
			onsubmit="submitForm(event);">
			<div class="section">
				<div class="label">추가 구매 후 만료일자:</div>
				<div class="value" id="updatedPowerDate">${agent.power_date}</div>
				<input type="hidden" id="powerDateInput" name="power_date" value="${agent.power_date}" />
				<p>
				<div class="label">현재 보유 포인트:</div>				
				<div class="value">${payment.total_points}</div> 
				<p>
				<div class="label">① 충전할 포인트:</div>
				<div class="value" id="chargePoint">${pointVO.point_pt}</div>
				<input type="hidden" id="point_pt" name="point_pt"
					value="${pointVO.point_pt}" />
				<!-- 포인트를 전송 -->
				<hr>
			</div>
			<div class="section">
				<div class="label">② 결제 예정 포인트:</div>
				<div class="value big" id="paymentPoint">${pointVO.point_pt}</div>
				<hr>
			</div>
			<div class="section buttons">
				<button type="button"
					onclick="addAmount(10000); addDaysToCurrentDate(10)">+ 10일</button>
				<button type="button"
					onclick="addAmount(30000); addDaysToCurrentDate(30)">+ 30일</button>
				<button type="button"
					onclick="addAmount(50000); addDaysToCurrentDate(50)">+ 50일</button>
				<button type="button"
					onclick="addAmount(100000); addDaysToCurrentDate(100)">+ 100일</button>
			</div>
			<div class="section">
				<button type="submit" class="pay-button">결제하기</button>
			</div>
			<div class="section notice">
				<span>※ 주의사항: 결제 완료 후 환불이 되지 않습니다.</span>
			</div>
		</form>
	</div>
</body>
</html>
