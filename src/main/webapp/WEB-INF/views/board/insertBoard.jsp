<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="resources/static/table/css/styles.css"	rel="stylesheet" />
<link href="resources/static/table/css/board.css"	rel="stylesheet">
</head>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<body id='insertbody' class="sb-nav-fixed">
	<div class='container'>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">자유게시판</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="resources/static/table/index.html">메인페이지</a></li>
						<li class="breadcrumb-item active">자유게시판</li>
					</ol>
					<div class="card mb-4"></div>
					<h1 id='main-title' class="mt-4">새글쓰기</h1>
					
						<form id='insertBoard' action='insertBoardSave' method="post" class="form-horizontal">
							<table class="table table-striped table-bordered" id='insertBoardTable'>
								<tr>
									<th id='title' style="font-size: 90%">제목</th>
									<td id='title'><input class="form-control"  type='text' name='free_title'></td>
								</tr>
								<tr>
									<th id='user' style="font-size: 90%">작성자</th>
									<!-- 세션 속 유저id값 -->
									<td id='user'>${loggedInUser}</td>
								</tr>
								<tr>
									<th id='content' style="font-size: 90%">내용</th>
									<td id='content'><textarea class="form-control" id='cont' rows="15" cols="120" name='free_cont'></textarea></td>
								</tr>
							</table>
							<span>
								<button id='back'>돌아가기</button>
								<button id='reset'		type="reset"	>작성취소</button>
								<button id='submit'	type="submit" >등록하기 </button>
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
	<script src="resources/static/table/js/scripts.js"></script>
	<script src="resources/static/table/js/button.js"></script>
	<script src="resources/static/table/js/datatables-simple-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
</body>
</html>