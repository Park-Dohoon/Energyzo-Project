<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>게시글 상세보기</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="resources/static/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="resources/static/css/getBoardView.css" rel="stylesheet">

<!-- favicon -->
<link rel="shortcut icon" href="../resources/static/base_template/favicon.png" type="image/x-icon" />

<% 
	// 세션에서 로그인 사용자 정보 가져오기
    String loggedInUser = (String)session.getAttribute("loggedInUser");
%>

<script>
	// 세션 값에 따라 로그인 여부 판단
	let isLoggedIn = <%= (loggedInUser != null ? "true" : "false") %>;
	
$(function(){
	
	// 가릴 버튼들 id통한 변수등록
	let modifyBtn	= $('#modify');
	let deleteBtn	= $('#delete' );
	let reportBtn	= $('#report' );
	
	// 게시글 작성자 값 가져오기
	let boardWriter = $('.userId').text();
	
		// 로그인 여부에 따른 버튼가리기
		if (isLoggedIn) {
			// 로그인한 사용자랑 작성자랑 같으면 신고 버튼 가리기
			if(  boardWriter === "<%= loggedInUser %>") {
				reportBtn.addClass('hidden');
				// 사용자랑 작성자랑 같으면 hidden 클래스 제거
				modifyBtn.removeClass('hidden');
				deleteBtn.removeClass('hidden');
			}else {
				// 다르면 hidden 클래스 제거
				reportBtn.removeClass('hidden');
				// 다르면 hidden클래스 추가
				modifyBtn.addClass('hidden');
				deleteBtn.addClass('hidden');
			}
		} else {
			// 비로그인 상태일 때 hidden 클래스를 추가
			modifyBtn.addClass('hidden');
			deleteBtn.addClass('hidden');
			reportBtn.addClass('hidden');
		}
});
</script>
</head>
<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="main.do">방잇다</a>
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
					<li><a class="dropdown-item" href="login">Activity Log</a></li>
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
						<div class="sb-sidenav-menu-heading">Core</div>
						<a class="nav-link" href="main.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 메인페이지
						</a>
						<div class="sb-sidenav-menu-heading">Interface</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 공지사항
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="resources/static/table/layout-static.html">Static
									Navigation</a> <a class="nav-link" href="resources/static/table/layout-sidenav-light.html">Light
									Sidenav</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> 이벤트
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<a class="nav-link collapsed" href="eventchulsuk">출석체크 </a>
								<div class="collapse" id="pagesCollapseAuth"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages"></div>
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseError" aria-expanded="false"
									aria-controls="pagesCollapseError">경매
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
							</nav>
						</div>
						<div class="sb-sidenav-menu-heading">Addons</div>
						<a class="nav-link" href="charts.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> Charts
						</a> <a class="nav-link" href="tabletest.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 자유게시판
						</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
				<c:if test="${not empty loggedInUser}">
					<div class="small">Logged in as:</div>
					${loggedInUser}
					</c:if>
					<c:if test="${empty loggedInUser}">
						<p>
							로그인하지 않았습니다.<br>
							<a href="login.do">로그인</a>
						</p>
					</c:if>
				</div>
			</nav>
		</div>
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<div class='container'>
					<h1 class="mt-4">게시글 상세보기</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="resources/static/index.html">메인페이지</a></li>
						<li class="breadcrumb-item active">자유게시판</li>
					</ol>
					<div class="card mb-4"></div>
					<button id='report'>신고하기</button>
					<input id='free_num' name="free_num" type="hidden"
						value="${board.free_num}">
					<table class="table table-striped table-bordered">
						<tr>
							<th id='cool' style="font-size: 90%">제목</th>
							<td id='cool' class='center'>${board.free_title }</td>
						</tr>
						<tr>
							<th id='call' style="font-size: 90%" valign="middle">조회수</th>
							<td id='call' class='center'>${board.free_count }</td>
						</tr>
						<tr>
							<th id='cool' style="font-size: 90%" valign="middle">작성자</th>
							<td id='cool' class='userId'>${board.user_id }</td>
						</tr>
						<tr>
							<th id='cnt' style="font-size: 90%">내용</th>
							<td id='content'>${board.free_cont }</td>
						</tr>
						<tr>
							<th id='cool' style="font-size: 90%">등록일</th>
							<td id='cool' class='center'>${board.free_date }</td>
						</tr>
					</table>
					<span>
						<button type='button' id='boardList'>목록보기</button>
						<button id='modify'	>수정하기</button>
						<button id='delete'		>삭제하기</button>
					</span>
				</div>
			</div>
		</main>
		<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; 방잇다 2024</div>
						<div>
							<a href="#">Privacy Policy</a>&middot;<a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
	</div>
</div>

	<!-- 팝업 모달 -->
	<div id="myModal" class="modal">
		<div class="modal-content">
			<h3 id='popup_title'>신고사유를 선택해주세요</h3>
			<form id='popup' action='reportBoard.do' method="post">
				<label><input id='cbox1' name='comp_bull_reason' value='욕설/부적절한 표현'
					class='cbox' type="checkbox">욕설/부적절한 표현</label><br>

				<label><input id='cbox2' name='comp_bull_reason' value='스팸홍보/도배'
					class='cbox' type="checkbox">스팸홍보/도배		</label><br>

				<label><input id='cbox3' name='comp_bull_reason' value='불쾌한 표현'
					class='cbox' type="checkbox">불쾌한 표현			</label><br>

				<label><input id='cbox4' name='comp_bull_reason' value='거짓매물 홍보'
					class='cbox' type="checkbox">거짓매물 홍보		</label><br>

				<label><input id='cbox5' value='기타' 
					class='cbox' type="checkbox">기타 					</label><br>
				<textarea name='comp_bull_reason' id='text' rows="5" cols=""></textarea>
				<br> <span>
					<button type="submit" id='reportConfirm'>신고</button>
					<button id='close'>닫기</button>
				</span>
			</form>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="resources/static/js/scripts.js"></script>
	<script src="resources/static/js/button.js"></script>
	<script src="resources/static/js/datatables-simple-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
</body>
</html>