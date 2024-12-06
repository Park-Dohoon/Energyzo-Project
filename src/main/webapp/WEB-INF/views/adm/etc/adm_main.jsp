<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %> <!-- head 포함 -->
<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="adm_main.do">
            <img src="resources/adm/assets/img/favicon.jpg" alt="company-logo" class="company-logo">
            <span class="company-name">방잇다</span>
        </a>
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
        <!-- Navbar Search-->
        <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            <div class="input-group">
                <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
            </div>
        </form>
    </nav>
    <div id="layoutSidenav">
        <%@ include file="../include/sider.jsp" %> <!-- 사이드바 포함 -->
        <div id="layoutSidenav_content">
            <main>
                <!-- 여기에 본문 내용 삽입 -->
                
                
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">사업현황</h1>
                        <ol class="breadcrumb mb-4">
                            현재위치 :&nbsp; <a href="adm_main.do"><li class="breadcrumb-item active">사업현황(홈)</li></a>
                        </ol>

						<%@ include file="../include/item_sub_menu.jsp" %> <!-- 사이드바 포함 -->
               


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
												<div class="gauge-ticks"></div> <!-- 세로줄 눈금을 표시할 부분 -->
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
												<div class="gauge-ticks"></div> <!-- 세로줄 눈금을 표시할 부분 -->
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
                
                
                
                
                
                <!-- 여기까지 본문 내용 삽입 -->
            </main>
        </div>
    </div>
    <%@ include file="../include/footer.jsp" %> <!-- 푸터 포함 -->
</body>
</html>
