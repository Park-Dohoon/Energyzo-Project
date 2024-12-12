<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 신청</title>

<!-- favicon -->
<link rel="shortcut icon" href="./resources/static/base_template/favicon.png" type="image/x-icon" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="resources/static/css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- <script src="resources/static/js/wishlist.js" rel="stylesheet" ></script> -->




</head>
 <body class="sb-nav-fixed">
  	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
				<a class="navbar-brand ps-3" href="main.do">
			<img src="resources/static/base_template/favicon.png" alt="company-logo" class="company-logo">
			<span class="company-name">방잇다</span>
		</a>
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
              <div class="container mt-4">
    <h1>판매자 신청</h1>
    <hr>
    
      <div style="border: 1px solid #ddd; border-radius: 5px; padding: 20px; background-color: #f8f9fa; line-height: 1.6;">
    
    <form id="sellerForm" action="sellerapplication2.do" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="officeName" class="form-label">중개사무소명</label>
            <input type="text" class="form-control" id="officeName" name="agent_office" placeholder="중개사무소명을 입력해 주세요.">
        </div>
        <div class="mb-3">
            <label for="ceoName" class="form-label">대표명</label>
            <input type="text" class="form-control" id="ceoName" name="agent_name" placeholder="대표명을 입력해 주세요.">
        </div>
        <div class="mb-3">
            <label for="registrationNumber" class="form-label">중개등록번호</label>
            <input type="text" class="form-control" id="registrationNumber" name="agent_reg_num" placeholder="중개등록번호를 입력해 주세요.">
        </div>
        <div class="mb-3">
            <label for="phoneNumber" class="form-label">대표 번호</label>
            <input type="tel" class="form-control" id="phoneNumber" name="agent_tel" placeholder="대표번호를 입력해 주세요.">
        </div>
        <div class="mb-3">
            <label for="address" class="form-label">소재지</label>
            <input type="text" class="form-control" id="address" name="agent_addr" placeholder="소재지를 입력해 주세요.">
        </div>
        <div class="mb-3">
            <label for="fileUpload" class="form-label">첨부 (사업자등록증)</label> 
            <input type="file" class="form-control" id="fileUpload" name="file">
        </div>
        <p class="mt-3 text-muted text-end">자격심사 후 판매자를 선정해 드립니다. 승인까지 1~2주 소요될 수 있습니다.</p>

        <!-- 모달을 띄우는 버튼 -->
		<div class="d-flex justify-content-end">
		    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#unregisterModal">
		        판매자 신청
		    </button>
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
                <h5 class="modal-title" id="unregisterModalLabel">판매자 신청 확인</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <!-- 모달 바디 -->
            <div class="modal-body">
                신청을 완료하시겠습니까?
            </div>
            <!-- 모달 푸터 -->
            <div class="modal-footer">
                <!-- 취소 버튼 -->
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <!-- 확인 버튼: 폼 제출 -->
                <button type="submit" class="btn btn-primary" form="sellerForm">확인</button>
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