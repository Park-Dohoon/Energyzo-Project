<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입정책 - 방잇다</title>

<!-- favicon -->
<link rel="shortcut icon" href="../resources/static/base_template/favicon.png" type="image/x-icon" />

<!-- jQuery (최신 버전 3.6.0) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Popper.js (Bootstrap 4.x에 필요) -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>

<!-- Custom JS Files -->
<script type="text/javascript" src="../resources/js/policy.js"></script>

<link rel="stylesheet" href="../resources/style/policy.css?v=1.0" type="text/css"> <!-- 한번에 안불러져서 ?~~이거 붙임 -->

<script type="text/javascript">

// 전체 선택 체크박스를 클릭하면, 모든 부분 선택 체크박스를 선택하거나 해제하는 함수
function toggleAll() {
    // 전체 동의하기 체크박스의 상태를 가져옵니다.
    var isChecked = document.getElementById('check_all').checked;
    
    // 각 개별 체크박스를 선택하거나 해제합니다.
    var checkboxes = document.querySelectorAll('.normal');
    checkboxes.forEach(function(checkbox) {
        checkbox.checked = isChecked;
    });

    // 모든 tooltip-content를 선택하여 보이거나 숨깁니다.
    var tooltips = document.querySelectorAll('.tooltip-content');
    tooltips.forEach(function(tooltip) {
        if (isChecked) {
            tooltip.style.display = "block"; // 보이기
        } else {
            tooltip.style.display = "none"; // 숨기기
        }
    });

    // "전체 보기" 링크 텍스트 변경
    var toggleLink = document.getElementById('toggleAllLink');
    if (isChecked) {
        toggleLink.innerText = '전체 숨기기';
    } else {
        toggleLink.innerText = '전체 보기';
    }
}

// 전체 보기/숨기기 링크 클릭 시 호출되는 함수
function toggleTooltipVisibility() {
    // 모든 tooltip-content를 선택
    var tooltips = document.querySelectorAll('.tooltip-content');
    
    tooltips.forEach(function(tooltip) {
        if (tooltip.style.display === "none" || tooltip.style.display === "") {
            tooltip.style.display = "block"; // 보이기
        } else {
            tooltip.style.display = "none"; // 숨기기
        }
    });

    // "전체 보기" 링크 텍스트 변경
    var toggleLink = document.getElementById('toggleAllLink');
    if (toggleLink.innerText === '전체 보기') {
        toggleLink.innerText = '전체 숨기기';
    } else {
        toggleLink.innerText = '전체 보기';
    }
}
 
//다음 페이지로 이동하기 전에 체크박스 상태 확인
function checkFormAndRedirect() {
    // check_1과 check_2 체크박스 상태 확인
    var check1 = document.getElementById('check_1').checked;
    var check2 = document.getElementById('check_2').checked;

    // 체크박스가 모두 선택되어 있을 경우 페이지 이동
    if (check1 && check2) {
        location.href = 'newjointest.do';  // 페이지 이동
    } else {
        alert('필수 항목을 모두 동의해 주세요.');  // 필수 체크박스를 선택하지 않았을 때 경고
    }
}

 
</script>

</head>
<body>

<div class="container">
	<div class="container">
		<div class="header">
			<!-- <img src="C:\Users\user\Desktop\영문.png" alt="Company Logo"> -->
			<h1 class="large-title">
				<a href='../main.do'><img alt="logo" src="../resources/static/images/방잇다로고_최종_누끼.png" style='width:100%'></a> 
				방과 사람을 잇다
			</h1>
		</div>

		<h1>
			<방잇다> 회원가입 약관동의
		</h1>

		
 		<form action="policy.do" method="POST" id="policy">
 		 
        
 		
		 <div class="flex-container">
           <a id="toggleAllLink" class="styled-link" style="color: #005555; font-size: 18px; 
           font-weight: bold; text-decoration: none;" onclick="toggleTooltipVisibility()">&nbsp;&nbsp;전체 보기</a>
        </div> 
			
		 <div class="tooltip-content">
			<p>방잇다(이하 “회사”)는 정보주체의 자유와 권리 보호를 위해 개인정보 보호 관련 주요 법률인 ⌜개인정보 보호법⌟
				및 관계 법령이 정한 바를 준수하여, 적법하게 개인정보를 처리하고 안전하게 관리하고 있습니다. 이에 ⌜개인정보 보호법⌟
				제30조에 따라 정보주체에게 개인정보 처리에 관한 절차 및 기준을 안내하고, 이와 관련한 고충을 신속하고 원활하게 처리할
				수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다.</p>
			<p>“회사”가 운영하고 있는 홈페이지 및 온라인 서비스의 종류는 아래와 같습니다.</p>
			<ul>
				<p>방과 사람을 잇다. 방잇다 웹 사이트 (https:____________)</p>
				
			</ul>
		</div> 



		<div class="tooltip" onclick="toggleContent('content1', 'arrow1')"style="display: flex; align-items: center;">
		<input type="checkbox" id="check_1" class="normal"  style="width: 20px; height: 20px;">
			<strong>&nbsp;&nbsp; 방잇다. 이용약관 [필수] </strong> <span class="arrow" id="arrow1">&#9660;</span>
		</div>
		<div id="content1" class="tooltip-content">
			<p>“회사”는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외로는 이용되지
				않으며, 이용 목적이 변경될 시에는 ⌜개인정보 보호법⌟ 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할
				것입니다.</p>
			<ul>
				
				<p> 여러분을 환영합니다.</p>
				<p class="indent"> 방잇다 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은
					다양한 네이버 서비스의 이용과 관련하여 방잇다 서비스를 제공하는 방잇다 주식회사(이하 ‘방잇다’)와 이를 이용하는 방잇다
					서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 방잇다 서비스 이용에 도움이 될 수 있는
					유익한 정보를 포함하고 있습니다 </p>
				<p class="indent"> 방잇다 서비스를 이용하시거나 방잇다 서비스 회원으로 가입하실 경우 여러분은 본 약관
					및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다</p>
				<p class="indent">다양한 방잇다 서비스를 즐겨보세요. 방잇다는 도메인의 웹사이트 및
					응용프로그램(어플리케이션, 앱)을 통해 정보 검색, 다른 이용자와의 커뮤니케이션, 콘텐츠 제공, 상품 쇼핑 등 여러분의
					생활에 편리함을 더할 수 있는 다양한 서비스를 제공하고 있습니다</p>
				<p class="indent">여러분은 PC, 휴대폰 등 인터넷 이용이 가능한 각종 단말기를 통해 각양각색의 방잇다 서비스를 자유롭게 
					이용하실 수 있으며, 개별 서비스들의 구체적인 내용은 각 서비스 상의 안내, 공지사항, 방잇다 웹고객센터(이하 ‘고객센터’) 
					도움말 등에서 쉽게 확인하실 수 있습니다</p>	
				
			</ul>
		</div>


		<div class="tooltip" onclick="toggleContent('content2', 'arrow2')" style="display: flex; align-items: center;">
		<input type="checkbox" id="check_2" class="normal"  style="width: 20px; height: 20px;">
			<strong>&nbsp;&nbsp;개인정보 수집 및 이용<전체> [필수]</strong> <span class="arrow" id="arrow2">&#9660;</span>
		</div>
		<div id="content2" class="tooltip-content">
			<p>“회사”는 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보
				보유·이용기간 내에서 개인정보를 처리 ·보유합니다. 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다:</p>
			<ul>
				
				<p> 관련 법령에 의한 개인정보 처리 및 보유 기간</p>
				<p class="indent"> 회원탈퇴 기록: 회원탈퇴 완료 후 3개월</p>
				<p class="indent"> 홈페이지 회원 가입 및 관리: 사업자/단체/개인 홈페이지 탈퇴 시까지</p>
				<p class="indent">다만, 다음의 사유에 해당하는 경우에는 해당 사유 종료 시까지</p>
				
			</ul>
			<p>다만, 수집목적 또는 제공받은 목적이 달성된 경우에도 임상시험과 관련된 법률 및 상법 등 법령의 규정에 의하여
				보존할 필요성이 있는 경우에는 정보주체의 개인정보를 보유할 수 있습니다.</p>
		</div>



		<div class="tooltip" onclick="toggleContent('content3', 'arrow3')" style="display: flex; align-items: center;" >
		<input type="checkbox" id="check_3" class="normal" style="width: 20px; height: 20px;">
			<strong>&nbsp;&nbsp;개인정보 수집 및 이용<이벤트 혜택 정보 수신> [선택]</strong> <span class="arrow" id="arrow3">&#9660;</span>
		</div>
		<div id="content3" class="tooltip-content">
			<p>“회사”는 회원 가입 시 또는 서비스 이용 과정에서 웹 사이트 또는 개별 어플리케이션이나 프로그램 등을 통해
				서비스 제공을 위한 필요 최소한의 개인정보를 수집하고 있습니다.</p>
			<ul>
				(1) 회원 가입 및 관리
				<p class="indent">필수항목: 이메일 주소, 이름, 휴대폰 번호, 소속기관, 직군</p>
				(2) 소셜 계정 회원가입 및 간편로그인
				<p class="indent">필수항목: 소셜 계정에서 공개 설정한 정보, 내 정보 페이지에 입력한 정보(소셜
					계정에서 공개 설정한 정보 이외)</p>
				(3) 간편로그인(소셜 계정 연동)
				<p class="indent">필수항목: 소셜 계정 아이디(이메일)</p>
				(4) 재화 또는 서비스 제공
				<p class="indent">필수항목: 이름, 성별, 생년월일, 거주지역, 휴대폰 번호, 통신사업자, 내/외국인
					여부, 중복가입확인정보(DI)</p>
			</ul>
			<p>개인정보를 수집하는 방법은 아래와 같습니다.</p>
			<p>개인정보를 수집하는 경우에는 원칙적으로 사전에 이용자에게 해당 사실을 알리고 동의를 구하고 있으며, 아래와 같은
				방법을 통해 개인정보를 수집합니다.</p>
			<ul>
				<p>(1) 회원가입 및 서비스 이용 과정에서 이용자가 개인정보 수집에 대해 동의를 하고 직접 정보를 입력하는 경우</p>
				<p>(2) 제휴 서비스 또는 단체 등으로 개인정보를 제공받은 경우</p>
			</ul>
			<p>서비스 이용 과정에서 단말기정보, IP주소, 쿠키, 서비스 이용 내역*등의 정보가 자동으로 생성되어 수집될 수
				있습니다.</p>
			<p>*서비스 이용 내역이란 서비스 이용 과정에서 자동화된 방법으로 생성되거나 이용자가 입력한 정보가 송수신되면서
				서버에 자동으로 기록 및 수집될 수 있는 정보를 의미합니다. 이와 같은 정보는 다른 정보와의 결합 여부, 처리하는 방식
				등에 따라 개인정보에 해당할 수 있고 개인정보에 해당하지 않을 수도 있습니다.</p>
		</div>




		<div class="tooltip" onclick="toggleContent('content4', 'arrow4')" style="display: flex; align-items: center;">
		<input type="checkbox" id="check_4" class="normal" style="width: 20px; height: 20px;">
			<strong>&nbsp;&nbsp;실명 인증된 아이디로 가입 [선택]</strong> <span class="arrow" id="arrow4">&#9660;</span>
		</div>
		<div id="content4" class="tooltip-content">
			<ul>
				<p>실명 인증된 아이디로 가입하시면 본인인증이 필요한 서비스(네이버 페이, 쇼핑, 멤버십 등)를 가입 후 바로 이용하실 수 있어요.</p>
				
			</ul>
		</div>




		<div class="tooltip" onclick="toggleContent('content5', 'arrow5')" style="display: flex; align-items: center;">
		<input type="checkbox" id="check_5" class="normal" style="width: 20px; height: 20px;">
			<strong>&nbsp;&nbsp;위치기반서비스 이용약관 [선택]</strong> <span class="arrow" id="arrow5">&#9660;</span>
		</div>
		<div id="content5" class="tooltip-content">
			<ul>
				<p>이 약관은 방잇다 (이하 “회사”)가 제공하는 위치기반서비스와 관련하여 회사와 
				개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
			
				<p>이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 개인정보보호법, 정보통신망 
				이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의 이용약관 및 개인정보처리방침,
				 회사가 별도로 정한 지침 등에 의합니다.</p>
				
			</ul>
		</div>
		
		
 		 <div class="flex-container" style="display: flex; align-items: center; margin-top: 20px;">
            <label for="check_all" class="styled-link" id="agreelink"
             style="font-size: 20px; font-weight: bold; color: #005555; margin-right: 10px;">&nbsp;&nbsp;전체 동의하기&nbsp;&nbsp;</label>
            <input type="checkbox" id="check_all" onclick="toggleAll()"
            style="width: 20px; height: 20px;" >
        </div>
		
		
		<footer>			
		<div class="flex-container"  style="text-align: right;">
          <button type="button" class="styled-button" id="nextBtn" onclick="checkFormAndRedirect()"
           style="width: 120px; height: 38px; font-size: 18px; border-radius: 10px; 
           color: white; background-color: #005555;">다  음</input>         
        </div>
        
		</footer>
		
	
		</form>
	</div>
</div>

</body>
</html>