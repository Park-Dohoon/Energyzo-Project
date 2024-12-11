<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>

<!-- favicon -->
<link rel="shortcut icon" href="../resources/static/base_template/favicon.png" type="image/x-icon" />

<!-- font api -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap"rel="stylesheet"/>

<!-- template -->
<link rel="stylesheet" href="../resources/static/base_template/fonts/icomoon/style.css" />
<link rel="stylesheet" href="../resources/static/base_template/fonts/flaticon/font/flaticon.css" />





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




<!-- js -->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- custom css -->
<link href="../resources/static/css/styles.css" rel="stylesheet" />
<style>
label {
	margin-top:10px;
}
h1 {
	font-weight: bold;
}
label{
	color:gray;
}
.item-option {
	margin-top:0px;
}
</style>

<!-- custom js -->
<script>
$(function(){
	
	// 이미지를 붙일 태그 초기화
	$('#image-window').empty();
	// 이미지 넘겨온 값으로 불이기
	let imgcnt=0;
	for(let i=1; i<=6; i++){
		
		if (($('input[name="file'+i+'"]').val()) != ""){
			
			let path 	= "../resources/static/upload/"+$('input[name="file'+i+'"]').val();
			let tag 	= $('<div>').append( $('<img>').attr("src", path) );
			
			$('#image-window').append(tag);
			imgcnt++;
		}
	}
	// 이미지가 없을 경우
	if(imgcnt == 0){
		$('#image-window').append($('<img src="../resources/static/base_template/logo/Re_방잇다로고_최종_누끼.png"/>'));
		
	} else{
		// bxslider 설정
		$('.bxslider').bxSlider({
		      mode: 'fade',
		      captions: true,
		      slideWidth: 600
		    });
	}
	
	
	// 부동산 유형, 거래유형 넘겨온 값으로 설정
	$('option[value="'+$('#est_type').val()+'"]').attr("selected", true);
	$('option[value="'+$('#est_tra_type').val()+'"]').attr("selected", true);
	
	
	// 태그 버튼 설정
	$('.btn-tag').hide();
	
	// 태그 버튼 넘겨온 값으로 설정
	let tagArr = $('#tagArray').val().split(" ");
	for(let i=0; i<tagArr.length; i++){
		$('.btn-tag[value="'+tagArr[i]+'"]').show();
	}
	
	
	// 가격 설정
	let itemPrice = $('#item-price').val();
	
	itemPrice = ( (Math.floor(parseInt(itemPrice)/10000) == 0) ? "" : (Math.floor(parseInt(itemPrice)/10000) + "억") )
				+ ( ((parseInt(itemPrice)%10000) == 0) ? "" : ((parseInt(itemPrice)%10000) + "만원") );
	
	$('#item-price').val( itemPrice );
	
	
	// 층 설정
	$('#item-floor').val( ($('#item-floor').val()=="-1") ? "반지하" : ($('#item-floor').val()+"층") );
	
})
</script>


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
          <li class="#"><a href="./searchmain.do?est_addr=서울+강남구">매물 검색</a></li>
          <li><a href="./searchmain.do?est_addr=서울+강남구">추천매물</a></li>
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

<br><br><br><br><br>
<!-- 헤더관련 -->




	<main>
        <div class="container container-fluid px-4">
            <span>
            	<div class="btn-section">
                    <button class="btn btn-primary" onclick="history.back()" >이전으로</button>
                </div>
                <br>
            </span>
            <div class="card mb-4">
                <div class="card-body">
                
                <!-- 버튼 섹션 -->
                    <div class="btn-section">
                    	<form action='searchCheckList.do' method='post'>
	                    	<input name='agent_num' type="hidden" value='${item.agent_num }'>
	                        <button id="btn_contact" class="btn btn-primary" style='width:100%;' >판매자연결</button>
                        </form>
                    </div>
                
                    <div class="row">
                        <!-- 왼쪽: 상품 정보 -->
                        <div class="col-md-6">
                        	<br><br>
                        	<div>
	                            <!-- <label for="file" class="form-label">외부사진 / 내부사진</label> -->
	                            
	                            <div id='image-container' class="product-main-image mb-3" style="border: solid lightgray 1px; border-radius: 0.375rem; padding: 2%;">
	                            	
	                                <input type="hidden" name='file1' value='${item.realfname1 }'/>
	                                <input type="hidden" name='file2' value='${item.realfname2 }'/>
	                                <input type="hidden" name='file3' value='${item.realfname3 }'/>
	                                <input type="hidden" name='file4' value='${item.realfname4 }'/>
	                                <input type="hidden" name='file5' value='${item.realfname5 }'/>
	                                <input type="hidden" name='file6' value='${item.realfname6 }'/>
	                                
	                                <div class="bxslider" id="image-window" style="width:100%; text-align:center">
	                                
	                                	<!-- 이미지가 저장되는 공간 -->
	                                
	                                </div>
	                        	</div>
	                        	<label for="btn-tag" class="form-label item-option">방 옵션</label><br>
	                            <div class="product-main-image mb-3" style="border: solid lightgray 1px; border-radius: 0.375rem; padding: 2%;">
				                    <span id='tagListTable'>
										<button class='btn btn-primary btn-tag' onoff='false' value='보안'		>보안		</button>
										<button class='btn btn-primary btn-tag' onoff='false' value='세탁기'		>세탁기	</button>
										<button class='btn btn-primary btn-tag' onoff='false' value='침대'		>침대		</button>
										<button class='btn btn-primary btn-tag' onoff='false' value='제습기'		>제습기	</button>
										<button class='btn btn-primary btn-tag' onoff='false' value='전자레인지'	>전자레인지</button>
										<button class='btn btn-primary btn-tag' onoff='false' value='가스레인지'	>가스레인지</button>
										<button class='btn btn-primary btn-tag' onoff='false' value='인덕션'		>인덕션	</button>
										<button class='btn btn-primary btn-tag' onoff='false' value='건조기'		>건조기	</button>
										<button class='btn btn-primary btn-tag' onoff='false' value='난방종류'		>난방종류	</button>
										<button class='btn btn-primary btn-tag' onoff='false' value='책상'		>책상		</button>
										<button class='btn btn-primary btn-tag' onoff='false' value='냉장고'		>냉장고	</button>
										<button class='btn btn-primary btn-tag' onoff='false' value='신발장'		>신발장	</button>
										<button class='btn btn-primary btn-tag' onoff='false' value='싱크대'		>싱크대	</button>
										<button class='btn btn-primary btn-tag' onoff='false' value='옷장'		>옷장		</button>
									</span>
			                    </div>
                            </div>
							
                        </div>
                        <!-- 오른쪽: 이미지 및 추가 필드 -->
                        <div class="col-md-6">
                            <h1 class="mt-4">상세 설명</h1>
                            
	                        <div class="mb-3">
	                            	<table>
		                            	<tr>
		                            		<td><label for="productName" class="form-label">상품번호</label></td>
		                            		<td><label for="category" class="form-label">중개인번호</label></td>
		                            	</tr>
		                            	<tr>
		                            		<td><input name='est_id' type="text" class="form-control" id="productName" placeholder="자동배정" value='${item.est_id }' readonly></td>
		                            		<td><input name='agent_num' type="text" class="form-control" id="category" value='${item.agent_num }' readonly></td>
		                            	</tr>
		                            	<tr>
		                            		<td><label for="dealType" class="form-label">가격(또는 보증금)</label></td>
		                            	</tr>
		                            	<tr>
		                            		<td colspan=2><input name='est_tra_cond' type="text" class="form-control" id="item-price" value='${item.est_tra_cond }' readonly></td>
		                            	</tr>
		                            	<tr>
		                            		<td><label for="type" class="form-label">부동산 유형</label></td>
		                            		<td><label for="dealType" class="form-label">거래 유형</label></td>
		                            	</tr>
		                            	<tr>
		                            		<td><input type='text' id='est_type' class="form-control" value='${item.est_type }' readonly></td>
		                            		<td><input type='text' id='est_tra_type' class="form-control" value='${item.est_tra_type }' readonly></td>
		                            	</tr>
		                            	
		                            	<tr>
		                            		<td><label for="realEstateInfo" class="form-label">주소 </label></td>
		                            	</tr>
		                            	<tr>
		                            		<td colspan=2><input 	name='est_addr' type="text" class="form-control" value='${item.est_addr }' readonly></td>
		                            	</tr>
		                            	<tr>
		                            		<td><label for="option" class="form-label">면적(㎡)</label></td>
		                            		<td><label for="discountPrice" class="form-label">층 수</label></td>
		                            	</tr>
		                            	<tr>
		                            		<td><input name='est_m_area' type="text" class="form-control" id="item-size" value='${item.est_m_area }㎡' readonly></td>
		                            		<td><input name='est_m_floor' type="text" class="form-control" id="item-floor" value='${item.est_m_floor}' readonly></td>
		                            	</tr>
		                            	<tr>
		                            		<td><label for="realPrice" class="form-label">건축연도</label></td>
		                            	</tr>
		                            	<tr>
		                            		<td colspan=2><input name='est_jungong' type="text" class="form-control" id="item-year" value='${item.est_jungong }년' readonly></td>
		                            	</tr>
	                            	</table>
	                        </div>
                            
                        </div>
                        
                    </div>
                    
                    <input id='tagArray' name='tagArray' type='hidden' value='${item.tagArray}'>
                    
                    
                </div>
            </div>
        </div>
    </main>
	
	
	
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
	
	
	
	<!-- bxslider -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.js"></script>
	
	
	
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
<!-- 헤더관련 -->
	
	
	
</body>
</html>