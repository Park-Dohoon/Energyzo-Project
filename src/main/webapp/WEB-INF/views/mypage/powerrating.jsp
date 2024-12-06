<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Static Navigation - SB Admin</title>
    <link href="resources/static/css/styles.css" rel="stylesheet" />
    <link href="resources/static/css/powerrating.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- jQuery 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="resources/static/js/pointrecharge2.js"></script>
</head>

<body>
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
						<div class="sb-sidenav-menu-heading">판매자 페이지</div>
						<a class="nav-link" href="seller.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 판매자 정보
						</a>
	<!-- 					<a class="nav-link" href="powerrating.do">
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
                <div class="container-fluid px-4">
                    <h1 class="mt-4">파워링크 등급</h1>
									
						<div class="power-link">
						    <div class="power-link-header">
						        <!-- "빅파워 등급" 이미지 -->
						        <img src="resources/static/images/빅파워등급.png" alt="빅파워 등급" class="power-link-image" />
						    </div>
					    
						    <div class="power-link-body">
						      <div class="row">
						      		<div class="power-link2" style="margin-top:20px; margin-bottom:20px">
									    <span class="rank" style="float: left; font-weight: bold; font-size: 16px;">12월 판매자 등급</span>
									</div>
						      
							    <div class="label">판매 건수</div>
							        <div class="value">
							            7,281 건 <br> 
							            <span class="condition">(최소조건: 500건)</span>
							        </div>
							    </div>
							    <div class="row">
							        <div class="label">판매 금액</div>
							        <div class="value">
							            7,281 원 <br>
							            <span class="condition">(최소조건: 40,000,000원)</span>
							        </div>
							    </div>
							    <div class="row">
							        <div class="label">파워링크 잔여기간 / 잔여 건</div>
							        <div class="value">기간 / 건</div>
							    </div>
						        <div class="note" style="margin-top:20px; margin-bottom:20px">
						            * 괄호 안 숫자는 판매자님 등급 조건입니다.
						        </div>
						    </div>
						    <div class="power-link-footer">
					<!-- 	        <button class="btn add-info">추가 결제</button> -->
						    		<button class="btn btn-primary" style="width:120px" id="pointRechargeButton">결제내역</button>
						    
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
        <script src="resources/static/js/datatables-simple-demo.js"></script>
        
        

</body>
</html>