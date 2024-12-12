<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="resources/static/css/styles.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="resources/static/css/emailsecession.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<script src="resources/static/js/verifyAuthCode.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>


    function sendSMS(pageName) {
        const to = $("input[name='to']").val();
        if (!to) {
            alert("수신 번호를 입력하세요!");
            return;
        }
        console.log("수신 번호:", to);

        // AJAX로 데이터를 서버로 전송
        $.ajax({
            url: pageName + ".do",  // 요청할 서버의 URL
            type: "POST",           // POST 방식으로 요청
            data: { to: to },       // 보내는 데이터
            success: function(response) {
                // 요청 성공 시 처리할 내용
                console.log("응답:", response);
               
            },
            error: function(xhr, status, error) {
                // 요청 실패 시 처리할 내용
                console.log("에러 발생:", error);
                alert("인증번호 요청에 실패했습니다.");
            }
        });
    }


    </script>

</head>
 <body class="sb-nav-fixed">
     <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="mypages.do">방 잇다</a>
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

					<li><a class="dropdown-item" href="logout.do">Logout</a></li>
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
 -->			<!-- 			<a class="nav-link" href="wishlist.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 찜목록
						</a> -->
						<a class="nav-link" href="point.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 내 포인트
						</a>
					<!-- 	<div class="sb-sidenav-menu-heading">Addons</div> -->
						<a class="nav-link" href="sellerapplication.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 판매자 신청
						</a> 
						<a class="nav-link" href="changepassword.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 비밀번호 변경
						</a>
							<a class="nav-link" href="secession.do">
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
			            <li class="breadcrumb-item active">회원가입시 등록한 전화번호로 인증하기</li>
			        </ol>
			        <hr>
			        
			        

						<div class="container-head">
							<div class="headmenu">
							                        
		                        <ul class="nav nav-tabs">
								  <li class="nav-item">
								    <a class="nav-link hover-box "  aria-current="adm_item_all.do" href="emailsecession.do">이메일</a>
								  </li>
								  <li class="nav-item">
								    <a class="nav-link hover-box active" href="phonesecession.do">전화번호</a>
								  </li>
								</ul>
								
							</div>


							<div class="headsearch">
			        
			        <div style="border: 1px solid #ddd; border-radius: 5px; padding: 20px; background-color: #f8f9fa; line-height: 1.6; color: #6c757d;">								            
			            <form id="smsForm" method="post"> 
			                <label for="to" style="margin-bottom: 10px">전화번호 인증요청</label>
			                <div class="form-group">
			                    <input type="text" id="to" name="to" placeholder="휴대폰번호를 입력해 주세요.">
			                    <input type="button" class="verify-button" onclick="sendSMS('sendSms')" value="인증번호요청">
			                </div>
			                <label for="to">*숫자로만 넣어주세요.</label>
			                <hr>
			            </form>
			            <form id="authForm">
			                <label for="authCode" style="margin-bottom: 10px">인증코드 입력</label>
			                <div class="form-group">
			                    <input type="text" id="authCode" name="authCode" maxlength="6" placeholder="인증코드를 입력해 주세요.">
			                    <input type="button" class="verify-button" onclick="verifyAuthCode()" value="확인">
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
			               <!--  <button type="submit" class="btn btn-primary" form="sellerForm">확인</button> -->
			                   <button type="button" class="btn btn-primary" onclick="window.location.href='remain.do';">확인</button>
			            </div>
			        </div>
			    </div>
			</div>
          

			
			</main>



                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>


        
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="resources/static/js/datatables-simple-demo.js"></script>
  
        
    </body></html>