<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="resources/static/css/styles.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="resources/static/css/secession.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

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
 -->						<a class="nav-link" href="wishlist.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 찜목록
						</a>
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
			        <h1 class="mt-4">탈퇴 안내</h1>
			        
			          <p class="subtitle">정말로 회원탈퇴를 시작하시겠습니까?</p>
						<hr>
					        <div class="section">
					            <label class="reason" for="reason">어떤 점이 불편하셨나요?</label>
					            <p>이용하면서 불편했던 점을 말씀해주시면, '방잇다'의 서비스 개선에 참고하도록 하겠습니다.</p>
					            
					            <select id="reason">
					                <option value="low_satisfaction">사용빈도 낮음</option>
					                <option value="service_issue">서비스 문제</option>
					                <option value="other">기타</option>
					            </select>
					        </div>
							
					        <div class="warning">
					            <h3>탈퇴 시 유의해주세요!</h3>
					            <ul>
					                <li>탈퇴 시 회원님의 동의 내역, 기록 등은 즉시 삭제되며 복원이 불가능합니다.</li>
					                <li>탈퇴 전에 개인자료는 다운로드받으시는 것을 권장합니다.</li>
					                <li>탈퇴 이후 동일한 계정으로 재가입은 불가능합니다.</li>
					                <li>일부 자료는 탈퇴일로부터 90일 동안 보관될 수 있습니다.</li>
					            </ul>
					        </div>
					
					        <div class="checkbox">
					            <input type="checkbox" id="agree" />
					            <label for="agree">상기 탈퇴 시 유의사항을 확인하였고, 이에 동의합니다.</label>
					        </div>
					
					        <div class="actions">
      							<button class="btn secession" onclick="handleSecession()">회원탈퇴 인증서비스</button>
					            <button class="btn cancel">계정 유지하기</button>
					        </div>
			        
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
			          <h5 class="modal-title" id="unregisterModalLabel">탈퇴 안내</h5>
			          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			        </div>
			        <!-- 모달 바디 -->
			        <div class="modal-body">
			          유의사항 확인 후 동의해 주세요.
			        </div>
			        <!-- 모달 푸터 -->
			        <div class="modal-footer">
			          <!-- 확인 버튼 -->
			          <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
			        </div>
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
        
	<script>
	  // 회원탈퇴 버튼 클릭 시 동작
	  function handleSecession() {
	    var checkbox = document.getElementById("agree");
	
	    if (!checkbox.checked) {
	      // 모달 띄우기
	      var unregisterModal = new bootstrap.Modal(document.getElementById('unregisterModal'));
	      unregisterModal.show();
	    } else {
	      // 체크된 경우, 인증서비스로 이동
	      location.href = 'emailsecession.do';
	    }
	  }
	</script>
        
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="resources/static/js/datatables-simple-demo.js"></script>
  
        
    </body></html>