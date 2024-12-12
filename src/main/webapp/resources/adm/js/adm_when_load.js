// 문서가 로드되었을 때
$(document).ready(function() {
    // 1. 탭 활성화
    const navLinks = document.querySelectorAll('.nav-link');
    const currentPage = window.location.pathname.split('/').pop();
    navLinks.forEach(function(link) {
        if (link.getAttribute('href').includes(currentPage)) {
            link.classList.add('active');
        } else {
            link.classList.remove('active');
        }
    });

    // 2. 테이블 클릭 이벤트 처리 (tbody의 tr 클릭)
    $('tbody').on('click', 'tr', function() {
        let Id = $(this).find('td:first').text();  // 첫 번째 td에서 id를 가져옴
        if (!Id) {
            alert('자료가 존재하지 않습니다!');
            return;
        }
        const currentPage = window.location.pathname.split('/').pop();
        const category = currentPage.replace('.do',''); // 카테고리 추출
        const detailPage = category + '_Detail?id=' + Id;
        window.open(detailPage, '_blank');
    });

    // 3. 게이지 업데이트
    const gaugeContainers = document.querySelectorAll('.gauge-container');
    gaugeContainers.forEach(function(gaugeContainer) {
        const gaugeText = gaugeContainer.querySelector('.gauge-text').textContent;
        const percentage = parseInt(gaugeText);
        updateGauge(percentage, gaugeContainer.id);
    });

    // 4. 삭제 모달
    // 모달을 띄우기 위한 함수
    function showDeleteModal(optNum) {
        document.getElementById("deleteModal").style.display = "block";
        document.getElementById("deleteButton").onclick = function() {
            window.location.href = "/deleteOption?optNum=" + optNum;
        };
    }

    // 모달 창을 닫기 위한 함수
    function closeModal() {
        document.getElementById("deleteModal").style.display = "none";
    }

    // 날짜 관련 처리
    setDateInputs();
});

// 퍼센트에 맞게 게이지를 업데이트하는 함수
function updateGauge(percentage, gaugeId) {
    const gaugeContainer = document.getElementById(gaugeId);
    const gaugeFill = gaugeContainer.querySelector('.gauge-fill');
    const gaugeFill2 = gaugeContainer.querySelector('.gauge-fill2');
    const gaugeText = gaugeContainer.querySelector('.gauge-text');
    gaugeFill.style.width = percentage + '%';
    gaugeFill2.style.width = percentage + '%';
    gaugeText.textContent = percentage + '%';

    if (percentage <= 30) {
        gaugeFill2.style.backgroundColor = 'green';
    } else if (percentage <= 70) {
        gaugeFill2.style.backgroundColor = 'yellow';
    } else {
        gaugeFill2.style.backgroundColor = 'red';
    }
}

// 날짜 계산 및 입력 처리 함수
function setDateInputs() {
    let today = new Date();
    let year = today.getFullYear();
    let month = today.getMonth() + 1;
    let day = today.getDate();

    month = month < 10 ? '0' + month : month;
    day = day < 10 ? '0' + day : day;
    let todayDate = year + '-' + month + '-' + day;

    let preDate = new Date(today);
    preDate.setMonth(today.getMonth() - 1);
    let preYear = preDate.getFullYear();
    let preMonth = preDate.getMonth() + 1;
    let preDay = preDate.getDate();

    preMonth = preMonth < 10 ? '0' + preMonth : preMonth;
    preDay = preDay < 10 ? '0' + preDay : preDay;
    let preDateFormatted = preYear + '-' + preMonth + '-' + preDay;

    $('#today').val(todayDate);
    $('#preday').val(preDateFormatted);

    const todayString = today.toISOString().split('T')[0];
    document.getElementById('preday').setAttribute('max', todayString);
    document.getElementById('today').setAttribute('max', todayString);
    document.getElementById('preday').addEventListener('change', function() {
        let predays = document.getElementById('preday').value;
        document.getElementById('today').setAttribute('min', predays);
    });
}
