<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="resources/static/css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>


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
			        <h1 class="mt-4">비밀번호 변경</h1>
			        	<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">보안설정</li>
					</ol>
			        <hr>
			        <div style="border: 1px solid #ddd; border-radius: 5px; padding: 20px; background-color: #f8f9fa; line-height: 1.6; color: #6c757d;">
			            <p style="margin-bottom: 20px; text-align: left;">
			                안전한 비밀번호로 내 정보를 보호하세요.<br>
			                이전에 사용한 적 없는 비밀번호가 안전합니다.<br>
			                영문/숫자 조합 8자 이상으로 지정하세요.
			            </p>
			            <p>
							<form action="changepassword.do" method="post" enctype="multipart/form-data">
							    <div class="mb-3">
							        <label for="currentPassword" class="form-label">현재 비밀번호</label>
							        <input type="text" class="form-control" id="currentPassword" name="currentPassword" 
							               placeholder="현재 비밀번호를 입력해주세요."
							               value="${currentPassword}"> <!-- 입력한 값을 그대로 표시 -->
							        <c:if test="${not empty message}">
							            <div class="alert alert-danger">${message}</div>
							        </c:if>
							    </div>
							    
							    <div class="mb-3">
							        <label for="newPassword" class="form-label">새 비밀번호</label>
							        <input type="text" class="form-control" id="newPassword" name="newPassword" 
							               placeholder="새 비밀번호를 입력해주세요."
							               value="${newPassword}"> <!-- 입력한 값을 그대로 표시 -->
							    </div>
							    
							    <div class="mb-3">
							        <label for="registrationNumber" class="form-label">새 비밀번호 확인</label>
							        <input type="text" class="form-control" id="registrationNumber" name="registrationNumber" 
							               placeholder="새 비밀번호를 확인해주세요."
							               value="${registrationNumber}"> <!-- 입력한 값을 그대로 표시 -->
							        <c:if test="${not empty message1}">
							            <div class="alert alert-danger">${message1}</div>
							        </c:if>
							    </div>
							
							    <div>
							        <button type="submit" class="btn btn-primary w-100 mb-2">비밀번호 변경</button>
							    </div>
							          <c:if test="${not empty successMessage}">
							            <div class="alert alert-success">${successMessage}</div>
							        </c:if>
							</form>

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