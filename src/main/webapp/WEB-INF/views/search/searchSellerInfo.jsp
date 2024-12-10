<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 상세정보 보기</title>

<!-- favicon -->
<link rel="shortcut icon" href="../resources/static/base_template/favicon.png" type="image/x-icon" />
<!-- bootstrap -->
<link rel="stylesheet" href="../resources/static/bootstrap/css/bootstrap.min.css"/>
<!-- template -->

<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- font -->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

<!-- user css -->
<link href="../resources/static/css/styles.css" rel="stylesheet" />
<style>
table {
	width:100%; 
	font-size:130%;
}
.card-body > table {
	text-align:center; 
}
img {
	width:60%; 
	align: center;
}
.img-container {
	border: 1px solid lightgray;
	
	align-items: center;
	padding: 3%;
	margin-bottom: 2%;
}
.card-header{
	font-size: 15px;
}
input.form-control[type="text"]{
	font-size: 15px;
	background-color: white;
}
.form-label{
	background-color: #055;
	color: white;
	width: 98%;
	border-radius: 10%;
	padding: 2%;
}
.btn-section > .btn{
	width:200px;
	font-size:15px;
	background-color: #055;
	color: white;
}

</style>
</head>
<body>
		<div id="layoutSidenav_content" class='container'>
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">판매자 정보</h1>
						<br>
						<div class="btn-section">
								    <button class="btn btn-primary" onclick="location.href='searchmain.do?est_addr=서울+강남구'">검색화면으로 돌아가기</button>
								</div>
						<div class="card mb-4">
							<div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                판매자 정보
                            </div>
                            <div class="card-body">
                            	<div align='center' class='img-container'>
                            		<img alt="" src="../resources/static/base_template/logo/방잇다로고_최종_누끼.png">
                            	</div>
                            	<table style='width:100%; text-align:center; font-size:15px;'>
		                            	<tr>
		                            		<td><label class="form-label">판매자번호</label></td>
		                            		<td><input type="text" class="form-control" value='${agent.agent_num }' readonly></td>
		                            	</tr>
		                            	<tr>
		                            		<td><label class="form-label">방잇다아이디</label></td>
		                            		<td><input type="text" class="form-control" value='${agent.user_id }' readonly></td>
		                            	</tr>
		                            	<tr>
		                            		<td><label class="form-label">대표자명</label></td>
		                            		<td><input type="text" class="form-control" value='${agent.agent_name }' readonly></td>
		                            	</tr>
		                            	<tr>
		                            		<td><label class="form-label">대표번호</label></td>
		                            		<td><input type="text" class="form-control" value='${agent.agent_tel }' readonly></td>
		                            	</tr>
		                            	<tr>
		                            		<td><label class="form-label">중개사무소명</label></td>
		                            		<td><input type="text" class="form-control" value='${agent.agent_office }' readonly></td>
		                            	</tr>
		                            	<tr>
		                            		<td><label class="form-label">중개등록번호</label></td>
		                            		<td><input type="text" class="form-control" value='${agent.agent_reg_num }' readonly></td>
		                            	</tr>
		                            	
		                            	<tr>
		                            		<td><label class="form-label">소재지</label></td>
		                            		<td><input type="text" class="form-control" value='${agent.agent_addr }' readonly></td>
		                            	</tr>
		                            	
	                            </table>
                            </div>
						</div>
						
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                ${agent.agent_name}님이 등록한 부동산 목록
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>상품번호</th>
                                            <th>건물유형</th>
                                            <th>거래유형</th>
                                            <th>가격(만원)</th>
                                            <th>주소</th>
                                            <th>등록일</th>
                                            <th>거래완료일</th>
                                        </tr>
                                    </thead>
                             		
                                    <tbody>
                                 		<c:forEach var='list' items='${estate}'>
										    <tr>
											    <td>
												    <a href="searchinfo.do?est_id=${list.est_id}" class="link-class">${list.est_id}</a>
												</td>
										        <td>${list.est_type}</td>
										        <td>${list.est_tra_type}</td>
										        <td>${list.est_tra_cond}</td>
										        <td>
												    <a href="searchinfo.do?est_id=${list.est_id}" class="link-class">${list.est_addr}</a>
												</td>
										        <td>${list.est_reg_date}</td>
										        <td>${list.est_tra_com_date}</td>
										    </tr>
										</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                
            </div>
        </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="../resources/static/js/datatables-simple-demo.js"></script>
  

</body>
</html>