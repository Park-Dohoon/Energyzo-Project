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
<script src="resources/static/js/pointrecharge.js" rel="stylesheet" ></script>


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
                        <h1 class="mt-4">등록상품목록</h1>
                        <ol class="breadcrumb mb-4">
<!--                             <li class="breadcrumb-item">상품관리</li> 
                            <li class="breadcrumb-item active">등록상품목록</li> -->
                        </ol>

                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                등록상품목록
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                     <thead>
                                        <tr>
                                            <th>상품등록번호</th>
                                            <th>판매자명</th>
                                            <th>거래유형</th>
                                            <th>월세</th>
                                            <th>관리비</th>
                                            <th>등록일</th>
                                        </tr>
                                    </thead>
                             
                                    <tbody>
                                 		<c:forEach var='list' items='${estate}'>
                                 			<c:set var="user_id" value="psbbsp303" />
												<c:if test="${list.user_id == 'psbbsp303'}">
										    <tr>
										      <td>
											    <a href="seller/seller_productdetail.do?est_id=${list.est_id}" class="link-class">${list.est_id}</a>
											</td>

										        <td>${list.agent_name}</td>
										        <td>${list.est_tra_cond}</td>
										        <td>${list.est_monthpay}</td>
										        <td>${list.est_manage}</td>
										        <td>${list.est_reg_date}</td>
										    </tr>
										    </c:if>
										</c:forEach>
                                  
                                    </tbody>
                                </table>
			          <!--           <div class="btn-section">
								    <a href="pointrecharge.do" id="pointRechargeButton" class="btn btn-primary" style="width:120px; display: inline-block; text-align: center; padding: 10px 0; text-decoration: none; color: white;">포인트 구매</a>
								</div> -->
								<div class="btn-section">
								    <button class="btn btn-primary" style="width:120px" onclick="location.href='seller/seller_productinsert.do'">상품추가</button>
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