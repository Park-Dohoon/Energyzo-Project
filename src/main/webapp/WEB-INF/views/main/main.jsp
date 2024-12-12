<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="author" content="Untree.co" />
    <link rel="shortcut icon" href="favicon.png" />

    <meta name="description" content="" />
    <meta name="keywords" content="bootstrap, bootstrap5" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap"
      rel="stylesheet"
    />

	<!-- favicon -->
	<link rel="shortcut icon" href="./resources/static/base_template/favicon.png" type="image/x-icon" />
	
    <link rel="stylesheet" href="resources/static/fonts/icomoon/style.css" />
    <link rel="stylesheet" href="resources/static/fonts/flaticon/font/flaticon.css" />

    <link rel="stylesheet" href="resources/static/css/tiny-slider.css" />
    <link rel="stylesheet" href="resources/static/css/aos.css" />
    <link rel="stylesheet" href="resources/static/css/stylemain.css" />
    <link rel="stylesheet" href="resources/static/css/nev.css" />
	
	<!-- Bootstrap JS 추가 (헤드 섹션 또는 바디 끝에 추가) 건들지말것!!!-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

	<!-- user js -->
	<script type="text/javascript">
		$(function(){
			
			// 가격 세팅
			for (let i= 0; i<$('#item-price-value').length; i++){
				console.log( $('#item-price-value') );
			}
			
			
			
		})
	</script>
	
    <title>
      방잇다
    </title>
</head>
<body>
 	<div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-body"></div>
    </div>   
<nav class="site-nav">
  <div class="container">
    <div class="menu-bg-wrap">
      <div class="site-navigation">
        <!-- 왼쪽 메뉴 -->
        <ul class="menu-left js-clone-nav d-none d-lg-inline-block text-start site-menu">
          <li class="#"><a href="./search/searchmain.do?est_addr=서울+강남구">매물 검색</a></li>
          <li><a href="./search/searchmain.do?est_addr=서울+강남구">추천매물</a></li>
          <li>
            <a href="tabletest.do">자유게시판</a>
          </li>
        </ul>

        <!-- 로고 -->
		<a href="main.do" class="logo m-0 site-logo">
		    <img src="resources/static/images/방잇다로고_최종_누끼.png" alt="방 잇다" style="width: 100px;">
		</a>

 		<!-- 오른쪽 메뉴 -->
		<ul
		  class="menu-right js-clone-nav d-none d-lg-inline-block text-end site-menu"
		>
  <!-- 로그인 상태 -->
		<li class="logged-in d-none">
		  <a href="#">판매자 전환</a>
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
		    <li><a class="dropdown-item" href="#">마이페이지</a></li>
			<li><a class="dropdown-item" href="logout.do">로그아웃</a></li>
		  </ul>
		</li>

		
		  <!-- 비로그인 상태 -->
		  <li class="logged-out d-none"><a href="user/policy.do">회원가입</a></li>
		  <li class="logged-out d-none"><a href="user/newlogin2.do">로그인</a></li>
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
	
    <div class="hero">
      <div class="hero-slide">
      	<div
          class="img overlay"
          style="background-image: url('resources/static/base_template/logo/방잇다로고_최종.png');
          		width:50%;	"
        ></div>
		<div
          class="img overlay"
          style="background-image: url('resources/static/images/hero_bg_3.jpg')"
        ></div>
        <div
          class="img overlay"
          style="background-image: url('resources/static/base_template/logo/방잇다로고_최종.png');
          		width:50%;	"
        ></div>
        <div
          class="img overlay"
          style="background-image: url('resources/static/images/hero_bg_3.jpg')"
        ></div>
        
      </div>

      <div class="container">
        <div class="row justify-content-center align-items-center">
          <div class="col-lg-9 text-center">
            <h1 class="heading" data-aos="fade-up">
            	<p>방과 사람을 잇다,</p>
              	<p> 방 잇다</p>
             	<p class="hedding-sub2" style='color:#FFCD4A'> 주택/빌라, 오피스텔, 아파트까지 모~든 부동산을 한번에!</p>
            </h1>
             
            <form
              action="search/searchmain.do"
              class="narrow-w form-search d-flex align-items-stretch mb-3"
              data-aos="fade-up"
              data-aos-delay="200"
            >
            	<input type='hidden' name='est_addr' value='서울 강남구'>
			 	<button type="submit" class="btn btn-primary" style="left:50%">
			 		부동산 매물 검색하기
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
						<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
					</svg>
				</button>
            </form>
          </div>
        </div>
      </div>
    </div>
    

    <div class="section">
      <div class="container">
        <div class="row mb-5 align-items-center">
		  <div class="col-lg-12"> <!-- col-lg-6을 col-lg-12로 변경 -->
          	<h5 style='color:navy;font-weight: bold'>서울 강남구 검색 조건으로 추천된 매물입니다.</h5>
            <h2 class="font-weight-bold text-primary heading" style='font-weight: bold'>
              방 잇다가 딱 맞는 강남구 매물을 추천했어요
            </h2>
          </div>
        </div>
        <div class="row">
          <div class="col-12">
            <div class="property-slider-wrap">
              <div class="property-slider">
              
              
              	<c:forEach var='list' items='${itemList}'>
	                <div class="property-item">
	                	<div style="height:295px; width:100%">
		                  <a href="./search/searchinfo.do?est_id=${list.est_id}" class="img">
		                  	<c:choose>
		                  		<c:when test="${list.realfname1 != null }">
		                  			<img src="resources/static/upload/${list.realfname1 }" alt="Image" class="img-fluid" style="width:100%"/>
		                  		</c:when>
		                  		<c:otherwise>
		                  			<img src="resources/static/base_template/logo/Re_방잇다로고_최종_누끼.png" alt="Image" class="img-fluid" />
		                  		</c:otherwise>
		                  	</c:choose>
		                    
		                  </a>
						</div>
	                  <div class="property-content">
	                    <div class="price mb-2"><span id='item-price-value'>${list.est_tra_cond}만원</span></div>
	                    <div>
	                      <span class="d-block mb-2 text-black-50"
	                        >${list.est_addr }</span
	                      >
	                      <span class="city d-block mb-3">${list.est_type }</span>
	
	                      <div class="specs d-flex mb-4">
	                      	<span class="d-block d-flex align-items-center">
	                          <span class="caption">${list.est_tra_type }ㆍ</span>
	                        </span>
	                        <span class="d-block d-flex align-items-center">
	                          <span class="caption"  id='item-floor-value'>${list.est_m_floor }층</span>
	                        </span>
	                        <span class="d-block d-flex align-items-center">
	                          <span class="caption">ㆍ${list.est_m_area }㎡</span>
	                        </span>
	                      </div>
	
	                      <a
	                        href="./search/searchinfo.do?est_id=${list.est_id}"
	                        class="btn btn-primary py-2 px-3"
	                        >자세히 보기
	                      </a>
	                    </div>
	                  </div>
	                </div>
	                <!-- .item -->
				</c:forEach>


              </div>

              <div
                id="property-nav"
                class="controls"
                tabindex="0"
                aria-label="Carousel Navigation"
              >
                <span
                  class="prev"
                  data-controls="prev"
                  aria-controls="property"
                  tabindex="-1"
                  >이전</span
                >
                <span
                  class="next"
                  data-controls="next"
                  aria-controls="property"
                  tabindex="-1"
                  >다음</span
                >
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    
	  <div class="fixed-box">
	  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
	  <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6m-5.784 6A2.24 2.24 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.3 6.3 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5"/>
	</svg>
	    <a href="https://www.gov.kr/portal/main/nologin">정부24</a>
	    <hr>
	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16">
	  <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5"/>
	  <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708z"/>
	</svg>
	    <a href="resources/static/file/주택임대차 표준계약서(사용용).hwp" download="주택임대차 표준계약서(사용용).hwp">계약서 양식</a>
	 	<hr>
	 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
	  <path d="M2.678 11.894a1 1 0 0 1 .287.801 11 11 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8 8 0 0 0 8 14c3.996 0 7-2.807 7-6s-3.004-6-7-6-7 2.808-7 6c0 1.468.617 2.83 1.678 3.894m-.493 3.905a22 22 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a10 10 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9 9 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105"/>
	</svg> 
	    <a href="http://pf.kakao.com/_XEwMn">챗봇</a>
	 <hr>
	 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-qr-code" viewBox="0 0 16 16">
	  <path d="M2 2h2v2H2z"/>
	  <path d="M6 0v6H0V0zM5 1H1v4h4zM4 12H2v2h2z"/>
	  <path d="M6 10v6H0v-6zm-5 1v4h4v-4zm11-9h2v2h-2z"/>
	  <path d="M10 0v6h6V0zm5 1v4h-4V1zM8 1V0h1v2H8v2H7V1zm0 5V4h1v2zM6 8V7h1V6h1v2h1V7h5v1h-4v1H7V8zm0 0v1H2V8H1v1H0V7h3v1zm10 1h-1V7h1zm-1 0h-1v2h2v-1h-1zm-4 0h2v1h-1v1h-1zm2 3v-1h-1v1h-1v1H9v1h3v-2zm0 0h3v1h-2v1h-1zm-4-1v1h1v-2H7v1z"/>
	  <path d="M7 12h1v3h4v1H7zm9 2v2h-3v-1h2v-1z"/>
	</svg>
	    <a href="resources/static/images/QR.png">챗봇QR</a>
	  </div>


    <div class="section"  style="background-color: white;">
      <div class="row justify-content-center footer-cta" data-aos="fade-up">
        <div class="col-lg-7 mx-auto text-center">
          <h2 class="mb-4" style="font-weight: bold">방 잇다는 고객과의 신뢰의 약속입니다</h2>
			<h6 class="mb-4" style="margin-bottom:20px">아래의 버튼을 통해 계약서 양식과 정부24 링크로 이동할 수 있습니다</h6>
          <p>
            <a
              href="resources/static/file/주택임대차 표준계약서(사용용).hwp"
               download="주택임대차 표준계약서(사용용).hwp"
              target="_blank"
              class="btn btn-primary text-white py-3 px-4"
              >계약서 양식 다운로드</a
            >
      		   <a
              href="https://www.gov.kr/portal/main/nologin"
              target="_blank"
              class="btn2 btn-primary2 py-3 px-4"
              >정부24로 이동</a
            >
          </p>
        </div>
        <!-- /.col-lg-7 -->
      </div>
      <!-- /.row -->
    </div>

    <div class="site-footer">
      <div class="container">
        <div class="row">
          <div class="col-lg-4">
            <div class="widget">
              <h3>형태별 검색</h3>
                <ul class="list-unstyled float-start links">
                <li><a href="./search/searchmain.do?est_addr=서울+강남구">원/투룸</a></li>
                <li><a href="./search/searchmain.do?est_addr=서울+강남구">주택/빌라</a></li>
                <li><a href="./search/searchmain.do?est_addr=서울+강남구">오피스텔</a></li>
                <li><a href="./search/searchmain.do?est_addr=서울+강남구">아파트</a></li>
              </ul>
            </div>
            <!-- /.widget -->
          </div>
          <!-- /.col-lg-4 -->
          <div class="col-lg-4">
            <div class="widget">
              <h3>방 잇다 뉴스</h3>
              <ul class="list-unstyled float-start links">
                <li><a href="tabletest.do">자유게시판</a></li>
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

    <!-- Preloader -->
    <div id="overlayer"></div>
    <div class="loader">
      <div class="spinner-border" role="status">
        <span class="visually-hidden">Loading...</span>
      </div>
    </div>

    <script src="resources/static/js/bootstrap.bundle.min.js"></script>
    <script src="resources/static/js/tiny-slider.js"></script>
    <script src="resources/static/js/aos.js"></script>
    <script src="resources/static/js/navbar.js"></script>
    <script src="resources/static/js/counter.js"></script>
    <script src="resources/static/js/custom.js"></script>

<!-- 지우지 말것!!!!!! js로 빼지도 말것 못 가지고 옴 -->
	<script type="text/javascript">
	
    document.addEventListener("DOMContentLoaded", () => {
        const userId = "${sessionScope.showNewLoginPage}";  
        console.log(userId);

        const loggedInElements = document.querySelectorAll(".logged-in");
        const loggedOutElements = document.querySelectorAll(".logged-out");

        if (userId) {  // userId가 있으면 로그인 상태
            loggedInElements.forEach((el) => el.classList.remove("d-none"));
            loggedOutElements.forEach((el) => el.classList.add("d-none"));
        } else {  // userId가 없으면 비로그인 상태
            loggedInElements.forEach((el) => el.classList.add("d-none"));
            loggedOutElements.forEach((el) => el.classList.remove("d-none"));
        }
    });
	
	
	
	</script>



</body>
</html>