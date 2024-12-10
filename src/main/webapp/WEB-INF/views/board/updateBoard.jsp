<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>댓글 수정</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="resources/static/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<link href="resources/static/css/getBoardView.css"
	rel="stylesheet" />
</head>
<body class="sb-nav-fixed">
		<div class='container'>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">자유게시판</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="index.html">메인페이지</a></li>
						<li class="breadcrumb-item active">자유게시판</li>
					</ol>
					<div class="card mb-4"></div>
					<h1 id='main-title' class="mt-4">게시글 상세보기</h1>
					<form id='update' action='BoardUpdate.do' method="post" class="form-horizontal">
						<input id='free_num' name="free_num" type="hidden"  value="${board.free_num}">
						<table class="table table-striped table-bordered">
							<tr>
								<th id='cool'>제목</th>
								<td id='cool'><input id='frtitle' name='free_title' class="form-control" value="${board.free_title }"></td>
							</tr>
							<tr>
								<th id='call'>조회수</th>
								<td id='call' class='center'>${board.free_count }</td>
							</tr>
							<tr>
								<th id='cool'>유저</th>
								<td id='cool' class='center'>${board.user_id }</td>
							</tr>
							<tr>
								<th id='cnt'>내용</th>
								<td id='content'><textarea 
								rows="10" cols="100" class="form-control" 
								name='free_cont'>${board.free_cont }</textarea></td>
							</tr>
							<tr>
								<th id='cool'>등록일</th>
								<td id='cool' class='center'>${board.free_date}</td>
							</tr>
						</table>
						<span>
							<button id='boardList'>목록보기</button>
							<button id='submit' type="submit">수정하기</button>
						</span>
					</form>
				</div>
			</main>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script src="resources/static/js/scripts.js"></script>
	<script src="resources/static/js/button.js"></script>
	<script src="resources/static/js/datatables-simple-demo.js"></script>
	<script 
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
</body>
</html>