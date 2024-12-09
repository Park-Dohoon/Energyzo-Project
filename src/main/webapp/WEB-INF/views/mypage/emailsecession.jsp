<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="resources/static/css/styles.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="resources/static/css/emailsecession.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>


<script>
// 인증번호 입력칸에서 숫자만 입력 가능하도록 실시간 검증
function validateCheck2() {
    var inputField = document.getElementById("numcheck"); //id값 입력
    var value = inputField.value;

    // 숫자만 입력하도록
    inputField.value = value.replace(/[^0-9]/g, '');  // 숫자가 아닌 모든 문자 제거
}
 
 //이메일 인증 요청 	삭제금지					 
 let authCode = null;
 
 function sendEmail(pageName) {

	const email = $("input[name='useremail']").val(); // 이메일 입력값 가져오기
	console.log(email)
/* 	if(!email) {
		alert("이메일 입력하세요");
		return;
	}
		 */					
	let param = {'email': email};
							 
	$.ajax({
		url: "/Energyzo-Project-MyPage/emailCheck.do",
		type : "get" , 								
		data : param,
		success : function (response) {
			//성공시
			//authCode = response.authCode; //서버에서 받은 인증번호 저장 
			alert ("인증코드를 메일로 전송했습니다. 메일 확인해주세요");									
		},
		error : function (error) {
			//실패시
			console.log("에러발생 :" ,error);
			alert("인증번호 요청 실패");
		}							
	});					
} //end of sendEmail

function verifyAuthCode() { 
    var inputElement = document.getElementById("auth-code"); // 입력 필드 요소 찾기
    if (!inputElement) {
        alert("인증번호 입력 필드가 존재하지 않습니다.");
        return;
    }

    var userInputCode = inputElement.value.trim(); // 입력된 인증 코드
    console.log(userInputCode);

    if (!userInputCode) {
        alert("인증번호를 입력해주세요.");
        return;
    }

    let param = { 'authCode': userInputCode };

    // 인증 코드를 서버로 전송
    $.ajax({
        url: '/Energyzo-Project-MyPage/verifyAuthCode2.do', // 서버의 verifyAuthCode.do URL로 요청
        type: 'GET',
        data: param, // 입력한 인증 코드를 파라미터로 전송
        success: function(response) {
            // 서버의 응답 처리 (인증 성공 또는 실패 메시지)
            console.log("서버 응답:", response);
            // 인증 완료 메시지를 모달로 표시
            if (response.message) {
                $('#unregisterModal .modal-body').text(response.message); // 서버에서 보낸 메시지를 모달에 추가
            } else {
                $('#unregisterModal .modal-body').text("인증이 완료되었습니다. 홈 화면으로 이동합니다.");
            }
            // 모달 띄우기
            $('#unregisterModal').modal('show');
        },
        error: function(xhr, status, error) {
            console.error("AJAX 요청 오류:", status, error);
            alert("인증 코드 확인 중 오류가 발생했습니다.");
        }
    });
}



</script>



</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="index.html">방 잇다</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-primary" id="btnNavbarSearch" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#!">Settings</a></li>
					<li><a class="dropdown-item" href="#!">Activity Log</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="#!">Logout</a></li>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">마이페이지</div>
						<a class="nav-link" href="mypages.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 내 정보
						</a>
						<!-- <div class="sb-sidenav-menu-heading">Interface</div>
 -->
						<!-- <a class="nav-link" href="wishlist.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 찜목록
						</a>  --><a class="nav-link" href="point.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 내 포인트
						</a>
						<!-- 	<div class="sb-sidenav-menu-heading">Addons</div> -->
						<a class="nav-link" href="sellerapplication.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 판매자 신청
						</a> <a class="nav-link" href="changepassword.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 비밀번호 변경
						</a> <a class="nav-link" href="secession.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 회원 탈퇴
						</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					Start Bootstrap
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h5 class="mt-4">계정 탈퇴 본인 인증 서비스</h5>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">회원가입시 등록한 이메일로 인증하기</li>
					</ol>
					<hr>


					<div class="container-head">
						<div class="headmenu">

							<ul class="nav nav-tabs">
								<li class="nav-item"><a class="nav-link hover-box active"
									aria-current="adm_item_all.do" href="emailsecession.do">이메일</a>
								</li>
								<li class="nav-item"><a class="nav-link hover-box"
									href="phonesecession.do">전화번호</a></li>
							</ul>

						</div>


						<div class="headsearch"></div>
					</div>
					<div
						style="border: 1px solid #ddd; border-radius: 5px; padding: 20px; background-color: #f8f9fa; line-height: 1.6; color: #6c757d;">
						<!-- 이메일 인증 요청 -->
						<label for="birthdate" style="margin-bottom: 10px">이메일
							인증요청</label>
						<form action="emailsecession.do" method="post">
							<div class="form-group">
								<input type="email" id="useremail" name="useremail"
									placeholder="이메일을 입력하세요" required>
								<button type="button" class="auth-button" onclick="sendEmail()">인증요청</button>
								
							</div>

							<hr>
							<!-- 인증번호 확인 -->
							<div class="form-group">
								<input type="text" id="auth-code" name="authCode"
									placeholder="인증번호 6자리" required>
								<button type="button" class="verify-button"
									onclick="verifyAuthCode()">확인</button>
							</div>
						</form>
					</div>
				</div>
				
				
			<!-- Modal -->
			<div class="modal fade" id="unregisterModal" tabindex="-1" aria-labelledby="unregisterModalLabel" aria-hidden="true">
			    <div class="modal-dialog">
			        <div class="modal-content">
			            <!-- 모달 헤더 -->
			            <div class="modal-header">
			                <h5 class="modal-title" id="unregisterModalLabel">탈퇴가 완료</h5>
			                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			            </div>
			            <!-- 모달 바디 -->
			            <div class="modal-body">
			                탈퇴가 완료되었습니다. 홈 화면으로 이동합니다. 
			            </div>
			            <!-- 모달 푸터 -->
			            <div class="modal-footer">
			                <!-- 확인 버튼: 폼 제출 -->
			                <button type="submit" class="btn btn-primary" form="sellerForm">확인</button>
			            </div>
			        </div>
			    </div>
			</div>
          
			</main>

			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2023</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="resources/static/js/datatables-simple-demo.js"></script>


</body>
</html>