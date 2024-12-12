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




<!-- 헤더관련 -->
<link rel="stylesheet" href="../resources/static/fonts/icomoon/style.css" />
<link rel="stylesheet" href="../resources/static/fonts/flaticon/font/flaticon.css" />

<link rel="stylesheet" href="../resources/static/css/tiny-slider.css" />
<link rel="stylesheet" href="../resources/static/css/aos.css" />
<link rel="stylesheet" href="../resources/static/css/stylemain.css" />
<link rel="stylesheet" href="../resources/static/css/nev.css" />
<!-- Bootstrap JS 추가 (헤드 섹션 또는 바디 끝에 추가) 건들지말것!!!-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<!-- 헤더관련 -->




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



<!-- 헤더관련 -->
<div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-body"></div>
    </div>   
<nav class="site-nav">
  <div class="container">
    <div class="menu-bg-wrap">
      <div class="site-navigation">
        <!-- 왼쪽 메뉴 -->
        <ul class="menu-left js-clone-nav d-none d-lg-inline-block text-start site-menu">
          <li class="#"><a href="../search/searchmain.do?est_addr=서울+강남구">매물 검색</a></li>
          <li><a href="../search/searchmain.do?est_addr=서울+강남구">추천매물</a></li>
          <li>
            <a href="../tabletest.do">자유게시판</a>
          </li>
        </ul>

        <!-- 로고 -->
		<a href="../main.do" class="logo m-0 site-logo">
		    <img src="../resources/static/images/방잇다로고_최종_누끼.png" alt="방 잇다" style="width: 100px;">
		</a>

 		<!-- 오른쪽 메뉴 -->
		<ul
		  class="menu-right js-clone-nav d-none d-lg-inline-block text-end site-menu"
		>
  <!-- 로그인 상태 -->
		<li class="logged-in d-none">
		  <a href="../seller.do">판매자 전환</a>
		</li>
		<li class="logged-in d-none">
		  <a href="#" class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
		    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
		      <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
		      <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1" />
		    </svg>
		    <!-- SVG 아래에 사용자 이름을 표시 -->
		    <span id="username" style="display: inline-block; margin-top: 5px;">${sessionScope.showNewLoginPage}</span>
		  </a>
		  <!-- 드롭다운 메뉴 -->
		  <ul class="dropdown-menu">
		    <li><a class="dropdown-item" href="../mypages.do">마이페이지</a></li>
			<li><a class="dropdown-item" href="../logout.do">로그아웃</a></li>
		  </ul>
		</li>

		
		  <!-- 비로그인 상태 -->
		  <li class="logged-out d-none"><a href="../user/policy.do">회원가입</a></li>
		  <li class="logged-out d-none"><a href="../user/newlogin2.do">로그인</a></li>
		</ul>


        <!-- 모바일 메뉴 버튼 -->
        <a
          href="#"
          class="burger light me-auto float-end mt-1 site-menu-toggle js-menu-toggle d-inline-block d-lg-none"
          data-toggle="collapse"
          data-target="#main-navbar"
        >
          <span></span>
        </a>
      </div>
    </div>
  </div>
</nav>

<br><br><br><br><br><br><br>
<!-- 헤더관련 -->





		<div id="layoutSidenav_content" class='container'>
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">판매자 정보</h1>
						<br>
						<!-- <div class="btn-section">
								    <button class="btn btn-primary" onclick="location.href='searchmain.do?est_addr=서울+강남구'">검색화면으로 돌아가기</button>
								</div> -->
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
        




<!-- footer -->
	<div class="site-footer">
      <div class="container">
        <div class="row">
          <div class="col-lg-4">
            <div class="widget">
              <h3>형태별 검색</h3>
                <ul class="list-unstyled float-start links">
                <li><a href="../search/searchmain.do?est_addr=서울+강남구">원/투룸</a></li>
                <li><a href="../search/searchmain.do?est_addr=서울+강남구">주택/빌라</a></li>
                <li><a href="../search/searchmain.do?est_addr=서울+강남구">오피스텔</a></li>
                <li><a href="../search/searchmain.do?est_addr=서울+강남구">아파트</a></li>
              </ul>
            </div>
            <!-- /.widget -->
          </div>
          <!-- /.col-lg-4 -->
          <div class="col-lg-4">
            <div class="widget">
              <h3>방 잇다 뉴스</h3>
              <ul class="list-unstyled float-start links">
                <li><a href="../tabletest.do">자유게시판</a></li>
              </ul>
             
            </div>
            <!-- /.widget -->
          </div>
          <!-- /.col-lg-4 -->
          <div class="col-lg-4">
            <div class="widget">
              <h3>고객 지원</h3>
              <ul class="list-unstyled links">
                <li><a href="#">자주 묻는 질문</a></li>
                <li><a href="#">챗봇</a></li>
              </ul>

              <ul class="list-unstyled social">
              <h3>Join Us</h3>
                <li>
                  <a href="#"><span class="icon-instagram"></span></a>
                </li>
                <li>
                  <a href="#"><span class="icon-twitter"></span></a>
                </li>
                <li>
                  <a href="#"><span class="icon-facebook"></span></a>
                </li>
                <li>
                  <a href="#"><span class="icon-linkedin"></span></a>
                </li>
                <li>
                  <a href="#"><span class="icon-pinterest"></span></a>
                </li>
                <li>
                  <a href="#"><span class="icon-dribbble"></span></a>
                </li>
              </ul>
            </div>
            <!-- /.widget -->
          </div>
          <!-- /.col-lg-4 -->
        </div>
        <!-- /.row -->

        <div class="row mt-5">
          <div class="col-12 text-center">
            <!-- 
              **==========
              NOTE: 
              Please don't remove this copyright link unless you buy the license here https://untree.co/license/  
              **==========
            -->

            <p>
              Copyright &copy;
              <script>
                document.write(new Date().getFullYear());
              </script>
              . All Rights Reserved. &mdash; Designed with love by
              <a href="#">seoyeon</a>
              <!-- License information: https://untree.co/license/ -->
            </p>
            <div>
              Distributed by
              <a href="https://themewagon.com/" target="_blank">에너자이조</a>
            </div>
          </div>
        </div>
      </div>
      <!-- /.container -->
    </div>
    <!-- /.site-footer -->



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="../resources/static/js/datatables-simple-demo.js"></script>
  


<!-- 헤더관련 -->
    <script src="../resources/static/js/bootstrap.bundle.min.js"></script>
    <script src="../resources/static/js/tiny-slider.js"></script>
    <script src="../resources/static/js/aos.js"></script>
    <script src="../resources/static/js/navbar.js"></script>
    <script src="../resources/static/js/counter.js"></script>
    <!-- <script src="../resources/static/js/custom.js"></script> -->

	<!-- 지우지 말것!!!!!! js로 빼지도 말것 못 가지고 옴 -->
	<script type="text/javascript">
	
    document.addEventListener("DOMContentLoaded", () => {
        const userId = "${sessionScope.showNewLoginPage}";  

        const loggedInElements = document.querySelectorAll(".logged-in");
        const loggedOutElements = document.querySelectorAll(".logged-out");

        if (userId) {  // userId가 있으면 로그인 상태
            loggedInElements.forEach((el) => el.classList.remove("d-none"));
            loggedOutElements.forEach((el) => el.classList.add("d-none"));
        } else {  // userId가 없으면 비로그인 상태
            loggedInElements.forEach((el) => el.classList.add("d-none"));
            loggedOutElements.forEach((el) => el.classList.remove("d-none"));
        }
        
        $.ajax({
        	type: "POST"
        	,data: {user_id: userId}
        	,url : "searchAgentById"
        	,success: function(result){
        		if(result){
        			$('a[href="../seller.do"]').show();
        		} else {
        			$('a[href="../seller.do"]').hide();
        		}
        	}
        	,error: function(e){
        		console.log(e);
        	}
        })
    });
	
	
	</script>




</body>
</html>