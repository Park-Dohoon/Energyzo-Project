<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />

        <title>에너자이조-관리자</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="resources/adm/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <link rel="icon" href="resources/adm/assets/img/favicon.jpg" type="image/x-icon">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="resources/adm/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="resources/adm/assets/demo/chart-area-demo.js"></script>
        <script src="resources/adm/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="resources/adm/js/datatables-simple-demo.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<!-- 직접 작성 관리자 -->
		<script src="resources/adm/js/admbasic.js"></script>
		<link href="resources/adm/css/admcss.css" rel="stylesheet" />
	



        
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="adm_main.do">
            <img src="resources/adm/assets/img/favicon.jpg" alt="company-logo" class="company-logo">
            <span class="company-name">방잇다</span></a>
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
                            <div class="sb-sidenav-menu-heading"></div>
                            <a class="nav-link" href="adm_main.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                사업현황
                            </a>
                            <div class="sb-sidenav-menu-heading"></div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="user_list.do">회원</a>
                                    <a class="nav-link" href="est_list.do">상품</a>
                                    <a class="nav-link" href="event_main.do">이벤트</a>
                                    <a class="nav-link" href="popup_list.do">팝업</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#pagesCollapseAuth.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                비밀번호 변경
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
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

                                </nav>
                            </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        관리자모드
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">사업현황</h1>
                        <ol class="breadcrumb mb-4">
                            현재위치 :&nbsp; <a href="adm_main_point.do"><li class="breadcrumb-item active">사업현황(홈)</li></a>
                        </ol>

						<div class="container-head">
							<div class="headmenu">
								<ul class="nav nav-tabs">
									<li class="nav-item"><a class="nav-link hover-act active"
										aria-current="page" href="adm_main_point.do">포인트</a></li>
									<li class="nav-item"><a class="nav-link hover-box"
										href="adm_main_attend.do">출석체크</a></li>
									<li class="nav-item"><a class="nav-link hover-box"
										href="adm_main_auct.do">경매</a></li>
								</ul>
							</div>


							<div class="headsearch">
	
								<form
									class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
									<div class="input-group">조회 기간 :  &nbsp;
									<label for='preday'></label>
									<input class="form-control" type="date" id="preday" placeholder="시작일..."/> 
									<label for='today'></label>
									<input class="form-control" type="date" id="today"
										aria-label="Search for end..." aria-describedby="btnNavbarSearch" />
									<button class="btn btn-primary" id="btnNavbarSearch"
											type="button">
											<i class="fas fa-search"></i>
										</button>
									</div>
								</form>
	
							</div>
						</div>

						<div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                </div>
                            </div>
                        </div>

                        <div class="row">
							<div class="col-xl-12">
								<div class="card mb-4">
								<div class="card-header">
									<div class="row-left-container">
										<div>
											<i class="fas fa-chart-area me-1"></i> 미회수 총액 :&nbsp;<i>12,568</i>&nbsp;P
										</div>
									</div>
								</div>

								<div class="card-body">
										<div class="row-container">
											<div class="gauge-name">출석체크</div>
											<div class="gauge-proper">12,568</div>
											<div class="gauge-unit">P</div>
											
											<div class="gauge-container" id='gauge1'>
												<div class="gauge-fill" style="width: 70%;">
													<span class="gauge-text">30%</span>
												</div>
											</div>
										</div>
										<hr />
										<div class="row-container">
											<div class="gauge-name">판매</div>
											<div class="gauge-proper">12,568</div>
											<div class="gauge-unit">P</div>
											
											<div class="gauge-container" id='gauge2'>
												<div class="gauge-fill" style="width: 70%;">
													<span class="gauge-text">90%</span>
												</div>
											</div>
										</div>
									</div>
									
								</div>
							</div>
						</div>

						<div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        총 지급액 :&nbsp;<i>12,568</i>&nbsp;P
                                    </div>
                                    <div class="card-body">
                                    
		                                    <div class="row-container">                                
		                                    <div class="gauge-name">출석이벤트
		                                    </div>	                                    
		                                    <div class="gauge-proper">&nbsp;1
		                                    </div>	                                    
		                                    <div class="gauge-unit">P
		                                    </div>
		                                    </div> 
                                    
											<hr />
										
		                                    <div class="row-container">                                
		                                    <div class="gauge-name">판매
		                                    </div>	                                    
		                                    <div class="gauge-proper">&nbsp;1
		                                    </div>	                                    
		                                    <div class="gauge-unit">P
		                                    </div>
		                                    </div> 
		                                    	                                    
		                                    <hr />
										
		                                    <div class="row-container">                                
		                                    <div class="gauge-proper">&nbsp;
		                                    </div>	                                    
		                                    <div class="gauge-proper">&nbsp;
		                                    </div>	                                    
		                                    <div class="gauge-unit">&nbsp;
		                                    </div>
		                                    </div>             
                                    
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        총 회수액 :&nbsp;<i>12,568</i>&nbsp;P
                                    </div>
                                    <div class="card-body">
	                                    
		                                    <div class="row-container">                                
		                                    <div class="gauge-name">경매 이벤트
		                                    </div>	                                    
		                                    <div class="gauge-proper">&nbsp;1
		                                    </div>	                                    
		                                    <div class="gauge-unit">P
		                                    </div>
		                                    </div>
                                    
											<hr />
		                                    
		                                    <div class="row-container">                                
		                                    <div class="gauge-name">파워링크 구매
		                                    </div>	                                    
		                                    <div class="gauge-proper">&nbsp;1
		                                    </div>	                                    
		                                    <div class="gauge-unit">P
		                                    </div>
		                                    </div>
                                    
											<hr />
		                                    
		                                    <div class="row-container">                                
		                                    <div class="gauge-name">소멸
		                                    </div>	                                    
		                                    <div class="gauge-proper">&nbsp;1
		                                    </div>	                                    
		                                    <div class="gauge-unit">P
		                                    </div>
		                                    </div>
	                                    
	                                </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                포인트 거래 내역
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>포인트관리번호</th>
                                            <th>아이디</th>
                                            <th>포인트수량</th>
                                            <th>출처(내역)</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>포인트관리번호</th>
                                            <th>아이디</th>
                                            <th>포인트수량</th>
                                            <th>출처(내역)</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td>Tiger Nixon</td>
                                            <td>System Architect</td>
                                            <td>Edinburgh</td>
                                            <td>61</td>
                                        </tr>
                                        <c:forEach var='pointlist' items='${listallPoint }'>
										    <tr>
										        <td>${pointlist.user_id}</td>
										        <td>${pointlist.name}</td>
										        <td>${pointlist.nick_name}</td>
										        <td>
										            ${pointlist.birth != null ? userlist.birth : '1900-01-01'}
										        </td>
										        <td>${pointlist.mobile}</td>
										    </tr>
										</c:forEach>
                                    </tbody>
                                </table>
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
    </body>
</html>
