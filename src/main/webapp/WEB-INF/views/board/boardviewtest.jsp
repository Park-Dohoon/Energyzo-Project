<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>자유게시판</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="resources/static/css/styles.css" rel="stylesheet" />
<link href="resources/static/css/board.css" rel="stylesheet">

<!-- favicon -->
<link rel="shortcut icon" href="./resources/static/base_template/favicon.png" type="image/x-icon" />

<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script src="https://api.jquery.com/jquery.ajax/"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function() {
	
	let loggedInUser = "";
	// 세션 값 확인
	if($('#isLogined').val()){
		loggedInUser = $('#loginedId').val();
	}
	
	console.log("loggedInUser: ", loggedInUser); 
	
//	let reported = $(reported);
	
	// 세션에 저장된 게시글번호랑 작성자 값 가져오기 및 확인
 	let reportBoard = localStorage.getItem('reportBoard');
	let boardWriter = localStorage.getItem('boardWriter');
	
	// 브라우저 콘솔에 찍기
	console.log('저장된 게시글: ' + reportBoard);

	
	// 신고 후 가리기
     if (reportBoard && loggedInUser === boardWriter) {
        // 신고된 게시글이 있다면, 해당 게시글을 가리기
        $("tr").each(function() {
            // 게시글 번호와 일치하는 행을 찾아서 숨기기
            if ($(this).find("td:first").text() === reportBoard) {
				$(this).addClass('hidden'); // 게시글 숨기기
            }
        }); 
    }
		
	// 로그인시 글쓰기 버튼추가, 아닐시 버튼 지우기
	if (loggedInUser && loggedInUser.trim() !== "") {
		// datatable-info 앞에 동적으로 버튼 추가 및 버튼 있을때 클래스 위치 조정
		$('.datatable-info').before('<button id="newBoard">글쓰기</button>');
		$('.datatable-info').css({'position': 'relative', 'right': '5%', 'left': 'auto'});
	} else {
		// 버튼 지우기 및 버튼없을때 datatable-info 클래스 위치조정
		$('#newBoard').remove();
		$('.datatable-info').css({'position': 'relative'});
	}

	//글쓰기 버튼 이벤트
	$('#newBoard').on('click', function() {
		window.location = 'insertBoard.do';
	});
	// 게시글 갯수 보여주는 템플릿 div의 글씨만 지우기
	$('.datatable-info').remove();
	// 셀렉트 태그 옆에 글씨만 지우기
 	$('.datatable-dropdown label').contents().filter(function() {
	// 텍스트 노드만 선택
	return this.nodeType === 3;
	}).remove();
});
</script>
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
		
	</nav>
	<div id="layoutSidenav">
	
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading"></div>
						<a class="nav-link" href="main.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 메인페이지
						</a>
						
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 부동산 검색
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="search/searchmain.do?est_addr=서울+강남구">검색하기</a> 
							</nav>
						</div>
						
						
						 <a class="nav-link" href="tabletest.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 자유게시판
						</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<input id='isLogined' type='hidden' value='${not empty sessionScope.showNewLoginPage}'>
					<c:if test="${not empty sessionScope.showNewLoginPage}">
						<input id='loginedId' type='hidden' value='${sessionScope.showNewLoginPage}'>
						<div class="small">Logged in as:</div>
						${sessionScope.showNewLoginPage}
					</c:if>
					
					<c:if test="${empty sessionScope.showNewLoginPage}">
						<p>
							로그인하지 않았습니다.<br>
							<a href="user/newlogin2.do">로그인</a>
						</p>
					</c:if>
				</div>
			</nav>
		</div>
		
		
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">자유게시판</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href='main.do'>메인페이지</a></li>
						<li class="breadcrumb-item active">자유게시판</li>
					</ol>
					<div class="card mb-4"></div>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i>전체목록
						</div>
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>글번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>등록일</th>
										<th>최근 수정일</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items='${boardList}' var='board'>
										<tr id='reportBoard'>
											<td id='free_num'>${board.free_num }</td>
											<td><a href='getBoard.do?free_num=${board.free_num }'>${board.free_title }</a></td>
								 			<td>${board.user_id }</td>
											<td><fmt:formatDate value='${board.free_date }'
													pattern='yyyy-MM-dd HH:mm:ss' /></td>
											<td><fmt:formatDate value='${board.free_recent }'
													pattern='yyyy-MM-dd HH:mm:ss' /></td>
											<td>${board.free_count }</td>
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