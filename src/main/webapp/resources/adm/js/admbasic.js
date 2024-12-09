$(function() {

    // ##########################################
    // Tab 활성화
    // ##########################################
    // .hover-box 클래스를 가진 모든 링크에 대해 현재 페이지 URL과 일치하는 링크에 'active' 클래스를 추가
	document.addEventListener('DOMContentLoaded', function() {
	
	    // navi 요소들 가져오기
	    const navLinks = document.querySelectorAll('.navi');
	    
	    // 현재 페이지의 경로를 가져오기 (파일명만 추출)
	    const currentPage = window.location.pathname.split('/').pop(); 
	
	    // 각 navi를 반복하며 현재 페이지와 일치하는 링크에 'active' 클래스를 추가
	    navLinks.forEach(function(link) {
	        // 링크의 href 속성 값과 currentPage를 비교
	        
	        alert(currentPage);
	        
	        if (link.getAttribute('href').includes(currentPage)) {
	            link.classList.add('active');  // 'active' 클래스 추가
	        } else {
	            link.classList.remove('active');  // 일치하지 않으면 'active' 클래스 제거
	        }
	    });
	});


    // ##########################################
    // 동적 이벤트 처리 (tbody의 tr 클릭)
    // ##########################################
    // 테이블의 <tbody> 부분에서 <tr>을 클릭하면, 첫 번째 <td>에 있는 user_id를 호출
    // 새 창을 열거나 경고 메시지를 표시
	$(document).ready(function() {
	    $('tbody').on('click', 'tr', function() {
	        // 첫 번째 td에서 id를 가져옴
	        let Id = $(this).find('td:first').text();  
	
	        // id가 없으면 경고 메시지 표시
	        if (!Id) {
	            alert('자료가 존재하지 않습니다!');
	            console.log('아이디 체크')
	            return;
	        }
	
	        // 현재 페이지의 경로를 가져오기 (파일명만 추출)
	        const currentPage = window.location.pathname.split('/').pop();
	
	        // 카테고리를 추출 (예: adm_user_alluser.do -> user)
	        //const category = currentPage.split('_')[1]; // '_all' 이후 부분을 추출
	        
	        // 카테고리를 추출 (예: adm_user_alluser.do -> adm_user_alluser)
	        const category = currentPage.replace('.do',''); // '.do'를 제외하고 추출
	
	        // 생성할 상세 페이지 URL (카테고리 + '_Detail?id=ID')
	        const detailPage = category + '_Detail?id=' + Id;

			
	        // 새 창으로 상세 페이지 열기
	        window.open(detailPage, '_blank');
	        
	        
/*
	        
        // 새 창을 열고 POST 방식으로 데이터 전달하기 위한 폼을 생성
        let form = document.createElement('form');
        form.method = 'POST';
        form.action = detailPage;

        // ID 파라미터를 폼에 추가
        let input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'id'; // 파라미터 이름
        input.value = Id;  // 파라미터 값

        form.appendChild(input);
        
        // 폼을 body에 추가하고 제출
        document.body.appendChild(form);
        form.submit();
*/	        
	    });
	});



    // ##########################################
    // 날짜 계산 (직전 1개월)
    // ##########################################
    // 현재 날짜와 한 달 전 날짜를 계산하여 각각 today와 preday 입력 필드에 값을 삽입
    // 현재 날짜와 직전 1개월 범위 내에서 날짜를 선택
    let today = new Date();
    let year = today.getFullYear();
    let month = today.getMonth() + 1;  // 월은 0부터 시작하므로 +1
    let day = today.getDate();

    // 0을 추가하는 로직: 월과 일이 한 자리 수일 경우 앞에 0을 추가
    month = month < 10 ? '0' + month : month;
    day = day < 10 ? '0' + day : day;

    let todayDate = year + '-' + month + '-' + day;

    // 한 달 전 날짜 계산
    let preDate = new Date(today);
    preDate.setMonth(today.getMonth() - 1);  // 한 달 전으로 설정
    let preYear = preDate.getFullYear();
    let preMonth = preDate.getMonth() + 1;
    let preDay = preDate.getDate();

    // 월과 일이 한 자리 수일 경우 0을 추가
    preMonth = preMonth < 10 ? '0' + preMonth : preMonth;
    preDay = preDay < 10 ? '0' + preDay : preDay;

    let preDateFormatted = preYear + '-' + preMonth + '-' + preDay;

    // #today와 #preday 입력 필드에 각각 오늘 날짜와 한 달 전 날짜를 삽입
    $('#today').val(todayDate);
    $('#preday').val(preDateFormatted);

    // ##########################################
    // 날짜 선택 제한 (max, minDate 설정)
    // ##########################################
    // #preday와 #today 날짜 필드에 대해 날짜 범위를 제한
    // predays : 시작 날짜, today : 종료 날짜
    // 날짜 선택 시, 'preday'의 날짜가 변경되면 'today' 필드의 최소값을 자동으로 갱신
    const todayString = today.toISOString().split('T')[0];  // 오늘 날짜를 yyyy-mm-dd 형식으로 변환
    document.getElementById('preday').setAttribute('max', todayString);  // predays는 오늘 날짜 이전을 선택할 수 없도록 설정
    document.getElementById('today').setAttribute('max', todayString);  // today는 오늘 날짜 이전을 선택할 수 없도록 설정

    // predays 날짜가 변경되면 today의 최소 날짜를 predays로 설정
    document.getElementById('preday').addEventListener('change', function() {
        let predays = document.getElementById('preday').value;
        document.getElementById('today').setAttribute('min', predays);  // predays 이후의 날짜만 today에서 선택 가능
    });

    // ##########################################
    // 날짜 입력에서 키보드 입력 제한
    // ##########################################
    // 날짜 입력 필드에서 숫자, 탭, 화살표, 백스페이스 외의 키 입력 제한
    const dateInputs = document.querySelectorAll('input[type="date"]');
    dateInputs.forEach(function(input) {
        input.addEventListener('keydown', function(event) {
            // 허용된 키들만 통과시키고 나머지는 제한
            if (event.key === 'Backspace' || event.key === 'Tab' || event.key === 'ArrowLeft' || event.key === 'ArrowRight') {
                return;  // 허용된 키는 기본 동작을 계속 진행
            } else {
                event.preventDefault();  // 허용되지 않은 키 입력 제한
            }
        });
    });

    // ##########################################
    // Gauge 업데이트
    // ##########################################
    // JSP에서 .gauge-container 클래스를 가진 각 요소에 대해 .gauge-text에 표시된 퍼센트를 호출,
    // 해당 퍼센트에 맞게 게이지의 채워진 부분과 색상을 업데이트
    // 페이지가 로드되면 모든 게이지를 업데이트
    window.onload = function() {
        const gaugeContainers = document.querySelectorAll('.gauge-container');
        gaugeContainers.forEach(function(gaugeContainer) {
            const gaugeText = gaugeContainer.querySelector('.gauge-text').textContent;
            const percentage = parseInt(gaugeText);  // 텍스트에서 숫자만 추출
            updateGauge(percentage, gaugeContainer.id);  // 게이지 업데이트 함수 호출
        });
    };

    // 퍼센트에 맞게 게이지를 업데이트하는 함수
    function updateGauge(percentage, gaugeId) {
        const gaugeContainer = document.getElementById(gaugeId);
        const gaugeFill = gaugeContainer.querySelector('.gauge-fill');
        const gaugeText = gaugeContainer.querySelector('.gauge-text');

        // 퍼센트에 맞게 게이지 채우기
        gaugeFill.style.width = percentage + '%';
        gaugeText.textContent = percentage + '%';  // 텍스트 업데이트

        // 색상 설정: 퍼센트에 따라 색상이 변경됩니다.
        if (percentage <= 30) {
            gaugeFill.style.backgroundColor = 'green';  // 30% 이하: 초록색
        } else if (percentage <= 70) {
            gaugeFill.style.backgroundColor = 'yellow';  // 31% ~ 70%: 노란색
        } else {
            gaugeFill.style.backgroundColor = 'red';  // 71% 이상: 빨간색
        }
    }

});