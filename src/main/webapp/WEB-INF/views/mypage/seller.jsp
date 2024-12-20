<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="resources/static/js/seller.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>판매자 정보</title>

<!-- favicon -->
<link rel="shortcut icon" href="./resources/static/base_template/favicon.png" type="image/x-icon" />

<link href="resources/static/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>

</head>
<body>
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
						<div class="sb-sidenav-menu-heading">판매자 페이지</div>
						<a class="nav-link" href="seller.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 판매자 정보
						</a>
			<!-- 			<a class="nav-link" href="powerrating.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 파워링크 등급
						</a> -->
						<a class="nav-link" href="productmanagement.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 상품 관리
						</a> 
						<a class="nav-link" href="paymenthistory.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 결제 내역
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
                <div class="container-fluid px-4 container">
                    <h1 class="mt-4">판매자 정보</h1>
                 	<ol class="breadcrumb mb-4">

						<li class="breadcrumb-item active">내 정보</li>
					</ol>
					<hr>				
									
				<div style="border: 1px solid #ddd; border-radius: 5px; padding: 20px; background-color: #f8f9fa; line-height: 1.6;">
					
                    <form action="submitSeller.jsp" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                        <div class="mb-3">
                            <label for="officeName" class="form-label">중개사무소명</label>
                            <input type="text" class="form-control" id="officeName" name="officeName" placeholder="중개사무소명을 입력해 주세요." value="${agent.agent_office}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="ceoName" class="form-label">대표명</label>
                            <input type="text" class="form-control" id="ceoName" name="ceoName" placeholder="대표명을 입력해 주세요."  value="${agent.agent_name}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="registrationNumber" class="form-label">중개등록번호</label>
                            <input type="text" class="form-control" id="registrationNumber" name="registrationNumber" placeholder="중개등록번호를 입력해 주세요." value="${agent.agent_reg_num}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="phoneNumber" class="form-label">대표 번호</label>
                            <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="대표 번호를 입력해 주세요." value="${agent.agent_tel}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="address" class="form-label">소재지</label>
                            <input type="text" class="form-control" id="address" name="address" placeholder="소재지를 입력해 주세요." value="${agent.agent_addr}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="fileUpload" class="form-label">첨부 (사업자등록증)</label> 
                           <input type="text" class="form-control" id="fileName" name="fileName" value="${agent.agent_fname}" readonly>
                        </div>
						<div class="d-flex justify-content-end">
						    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#unregisterModal">등록해제</button>
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
				                <h5 class="modal-title" id="unregisterModalLabel">판매자 등록 해제</h5>
				                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				            </div>
				            <!-- 모달 바디 -->
				            <div class="modal-body">
							판매자 등록 해제 시 상품이 모두 내려가며, 완료 후 마이페이지로 이동합니다. 진행하시겠습니까?
				            </div>
				            <!-- 모달 푸터 -->
				            <div class="modal-footer">
				                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
								<button type="submit" class="btn btn-secondary ms-2" style="background-color: #005555; border-color: #005555;"
								  onclick="location.href='mypages.do'"
								>확인</button>
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
	
	 <script>

    </script>
	
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
        <script src="resources/static/js/datatables-simple-demo.js"></script>
        
        

</body>
</html>