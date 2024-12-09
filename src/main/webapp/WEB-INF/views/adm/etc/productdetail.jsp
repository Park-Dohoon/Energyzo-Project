<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Static Navigation - SB Admin</title>

<!-- favicon -->
<link rel="shortcut icon" href="../resources/static/base_template/favicon.png" type="image/x-icon" />

<link href="resources/static/css/styles.css" rel="stylesheet" />

<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

<title>Insert title here</title>
</head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">방 잇다</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Layouts
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="layout-static.html">Static Navigation</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Pages
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Authentication
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="login.html">Login</a>
                                            <a class="nav-link" href="register.html">Register</a>
                                            <a class="nav-link" href="password.html">Forgot Password</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        Error
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="401.html">401 Page</a>
                                            <a class="nav-link" href="404.html">404 Page</a>
                                            <a class="nav-link" href="500.html">500 Page</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Charts
                            </a>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Tables
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
            <h1 class="mt-4">상품상세</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="index.html">상품 관리</a></li>
                <li class="breadcrumb-item active">상품상세</li>
            </ol>
            <div class="card mb-4">
                <div class="card-body">
                    <div class="row">
                        <!-- 왼쪽: 상품 정보 -->
                        <div class="col-md-6">
                            <form>
                              <div class="mb-3">
								    <label for="productName" class="form-label">상품번호</label>
								    <input type="text" class="form-control" id="productName" value="${estate.est_id}" readonly>
								</div>
                                <div class="mb-3">
                                    <label for="category" class="form-label">중개인번호</label>
                                    <input type="text" class="form-control" id="category" value="${estate.agent_num}" readonly>
                                </div>
                                <div class="mb-3">
                                    <label for="registrationDate" class="form-label">등록일</label>
                                    <input type="text" class="form-control" id="registrationDate" value="${estate.est_reg_date}" readonly>
                                </div>
                                 <div class="mb-3">
                                    <label for="registrationDate" class="form-label">거래완료일</label>
                                    <input type="text" class="form-control" id="traDate" value="${estate.est_tra_com_date}" readonly>
                                </div>
                                <div class="mb-3">
                                    <label for="type" class="form-label">부동산 유형</label>
                                    <input type="text" class="form-control" id="type"  value="${estate.est_type}" readonly>
                                </div>
                                <div class="mb-3">
                                    <label for="dealType" class="form-label">거래 유형</label>
                                    <input type="text" class="form-control" id="dealType" value="${estate.est_tra_type}" readonly>
                                </div>
          						 <div class="mb-3">
                                    <label for="dealType" class="form-label">용도</label>
                                    <input type="text" class="form-control" id="dealType" value="${estate.est_usage}" readonly>
                                </div>
      
                                <div class="mb-3">
                                    <label for="office" class="form-label">관리비</label>
                                    <input type="text" class="form-control" id="office"  value="${estate.est_manage}" readonly>
                                </div>
                                <div class="mb-3">
                                    <label for="realEstateInfo" class="form-label">주소</label>
                                    <input type="text" class="form-control" id="office"  value="${estate.est_addr}" readonly>
                                </div>
                            
                            </form>
                        </div>
                        <!-- 오른쪽: 이미지 및 추가 필드 -->
                        <div class="col-md-6">
                            <h5>외부사진 / 내부사진</h5>
                            <div class="product-main-image mb-3">
                                 <img src="${estpic.path}" alt="상품 이미지">
                            </div>
                            <div class="product-images d-flex flex-row gap-3">
                           <c:forEach var="subPic" items="${subpiclist}">
						        <img src="${subPic.path}" alt="썸네일 이미지">
						    </c:forEach>
                            </div>
							<div class="d-flex justify-content-end">
							    <label for="declaration" class="form-label2">신고수 0회</label>
							</div>
                            
                            <p>
                            <form>
			                    <div class="mb-3">
								    <label for="option" class="form-label">옵션</label>
								    <input type="text" class="form-control" id="option" 
								           value="<c:forEach var='option' items='${estOptionlist}'> ${option.est_opt_name} <c:if test='${!empty option.est_opt_name}'> </c:if> </c:forEach>" readonly>
								</div>

                                <div class="mb-3">
                                    <label for="discountPrice" class="form-label">방수</label>
                                    <input type="text" class="form-control" id="discountPrice" value="${estate.est_room_num}" readonly>
                                </div>
                                <div class="mb-3">
                                    <label for="realPrice" class="form-label">욕실수</label>
                                    <input type="text" class="form-control" id="realPrice" value="${estate.est_bath_num}" readonly>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- 버튼 섹션 -->
                    <div class="btn-section">
                   <!--      <button class="btn btn-danger">삭제</button> -->
                        <button class="btn btn-primary">찜 취소</button>
                    </div>
                </div>
            </div>
        </div>
    </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2025</div>
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
        <script src="./resources/static/js/datatables-simple-demo.js"></script>
        
    </body>
</html>