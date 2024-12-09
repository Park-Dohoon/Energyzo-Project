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
<link href="../resources/static/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="../resources/static/css/getBoardView.css"
	rel="stylesheet">
<%
	// 세션에서 로그인 사용자 정보 가져오기
    String loggedInUser = (String) session.getAttribute("loggedInUser");
%>

<script>
	// 세션 값에 따라 로그인 여부 판단
	let isLoggedIn = <%= (loggedInUser != null ? "true" : "false") %>;
	
$(function(){
	
	// 가릴 버튼들 id통한 변수등록
	let modifyBtn	= $('#modify');
	let deleteBtn	= $('#delete' );
	let reportBtn	= $('#report' );
		
		// 버튼가리기
		if (isLoggedIn) {
			// 로그인 상태일 때 hidden 클래스 제거
			modifyBtn.removeClass('hidden');
			deleteBtn.removeClass('hidden');
			// 로그인한 사용자랑 작성자랑 같으면 신고 버튼 가리기
			if(  boardWriter === "<%= loggedInUser %>") {
				reportBtn.addClass('hidden');
			}else {
				// 다르면 hidden 클래스 제거
				reportBtn.removeClass('hidden');
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
	<div class='container'>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">자유게시판</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="resources/static/index.html">메인페이지</a></li>
						<li class="breadcrumb-item active">자유게시판</li>
					</ol>
					<div class="card mb-4"></div>
					<h1 id='main-title' class="mt-4">게시글 상세보기</h1>
					<c:if test="${not empty loggedInUser}">
						<p>로그인한 사용자: ${loggedInUser}</p>
					</c:if>
					<c:if test="${empty loggedInUser}">
						<p>
							로그인하지 않았습니다. <a href="login.do">로그인</a>
						</p>
					</c:if>
					<button id='report'>신고하기</button>
					<input id='free_num' name="free_num" type="hidden"
						value="${board.free_num}">
					<table class="table table-striped table-bordered">
						<tr>
							<th id='cool' style="font-size: 90%">제목</th>
							<td id='cool' class='center'>${board.free_title }</td>
						</tr>
						<tr>
							<th id='call'  style="font-size: 90%" valign="middle">조회수</th>
							<td id='call' class='center'>${board.free_count }</td>
						</tr>
						<tr>
							<th id='cool' style="font-size: 90%" valign="middle">작성자</th>
							<td id='cool'>${board.user_id }</td>
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
						<button id='boardList'>목록보기</button>
						<button id='modify'	>수정하기</button>
						<button id='delete'		>삭제하기</button>
					</span>
				</div>
			</main>
		</div>
	</div>
	
	<!-- 팝업 모달 -->
	<div id="myModal" class="modal">
		<div class="modal-content">
			<h3 id='popup_title'>신고사유를 선택해주세요</h3>
			<form action='reportBoard.do' method="post">
				<label><input id='cbox1' name='comp_bull_reason' value='욕설/부적절한 표현'
				class='cbox' type="checkbox">욕설/부적절한 표현</label><br>
				
				<label><input id='cbox2' name='comp_bull_reason' value='스팸홍보/도배'
				class='cbox' type="checkbox">스팸홍보/도배		</label><br>
				
				<label><input id='cbox3' name='comp_bull_reason' value='불쾌한 표현'
				class='cbox' type="checkbox">불쾌한 표현			</label><br> 
				
				<label><input id='cbox4' name='comp_bull_reason' value='거짓매물 홍보'
				class='cbox' type="checkbox">거짓매물 홍보		</label><br> 
				
				<label><input id='cbox5' name='comp_bull_reason' value='기타'
				class='cbox' type="checkbox">기타						</label><br>
					<textarea id='text' rows="5" cols="126"></textarea><br>
				<span>
					<button type="submit" id='reportConfirm'>신고</button>
					<button id='close'>닫기</button>
				</span>
			</form>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script src="../resources/static/js/scripts.js"></script>
	<script src="../resources/static/js/button.js"></script>
	<script src="../resources/static/js/datatables-simple-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
</body>
</html>