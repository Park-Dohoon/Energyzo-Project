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
<title>새글쓰기</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="resources/static/css/styles.css"	rel="stylesheet" />
<link href="resources/static/css/board.css"	rel="stylesheet">

<!-- favicon -->
<link rel="shortcut icon" href="./resources/static/base_template/favicon.png" type="image/x-icon" />

</head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script>
    $(function() {
        $('#submit').click(function(event) {
            // 제목과 내용이 비어있는지 확인
            let title = $('#free_title').val().trim();
            let content = $('#free_cont').val().trim();
            
            // 제목과 내용이 비어 있으면 경고 메시지
            if (title === "" || content === "") {
                event.preventDefault(); // 폼 제출 막기
                alert("제목과 내용을 모두 입력해주세요.");
            }
        });
    });
</script>
</head>
<body id='insertbody' class="sb-nav-fixed">
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
				<c:if test="${not empty sessionScope.showNewLoginPage}">
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
				<div class='container'>
					<h1 class="mt-4">새글쓰기</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="main.do">메인페이지</a></li>
						<li class="breadcrumb-item active">자유게시판</li>
					</ol>
					<div class="card mb-4"></div>
						<form id='insertBoard' action='insertBoardSave.do' method="post" class="form-horizontal">
							<table class="table table-striped table-bordered" id='insertBoardTable'>
								<tr>
									<th id='title' style="font-size: 90%">제목</th>
									<td id='title'><input id='free_title' class="form-control"  type='text' name='free_title'></td>
								</tr>
								<tr>
									<th id='user' style="font-size: 90%">작성자</th>
									<!-- 세션 속 유저id값 -->
									<td id='user'>${loggedInUser}</td>
								</tr>
								<tr>
									<th id='content' style="font-size: 90%">내용</th>
									<td id='content'><textarea id='free_cont' class="form-control" id='cont' rows="15" cols="120" name='free_cont'></textarea></td>
								</tr>
							</table>
							<span>
								<button type='button' id='back'>돌아가기</button>
								<button id='reset'		type="reset"	>작성취소</button>
								<button id='submit'	type="submit" >등록하기 </button>
							</span>
						</form>
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