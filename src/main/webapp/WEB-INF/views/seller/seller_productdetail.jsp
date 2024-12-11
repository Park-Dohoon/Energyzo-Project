<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Static Navigation - SB Admin</title>

<!-- favicon -->
<link rel="shortcut icon" href="../resources/static/base_template/favicon.png" type="image/x-icon" />
<link href="../resources/static/css/styles.css" rel="stylesheet" />

<!-- js -->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
$(function(){
	
	// 이미지 저장 시간 대기
	//sleep(5000);
	function sleep(ms) {
		  const start = Date.now();
		  while (Date.now() - start < ms) {}
	}
	
	
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
		$('#image-window').append($('<label class="form-label"/>').text("저장한 이미지가 없습니다"));
		
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
	$('.btn-tag').css({"background-color":"white", "color":"#055"});
	$('.btn-tag').click(function(){
		// 토글 설정
		if($(this).attr("onoff")=="false"){
			$(this).css({"background-color":"#055", "color":"white"});
			$(this).attr("onoff", "true");
		} else{
			$(this).css({"background-color":"white", "color":"#055"});
			$(this).attr("onoff", "false");
		}
		
	})
	// 태그 버튼 넘겨온 값으로 설정
	let tagArr = $('#tagArray').val().split(" ");
	for(let i=0; i<tagArr.length; i++){
		$('.btn-tag[value="'+tagArr[i]+'"]').attr("onoff", "true");
		$('.btn-tag[value="'+tagArr[i]+'"]').css({"background-color":"#055", "color":"white"});
	}
	
	//***********************************************
	//폼에 넘기기 전에 무조건 옵션 먼저 업데이트를 시켜줘야 함
	$('form').on('submit', function(e) {
	    let selectedTags = [];
	    $('.btn-tag[onoff="true"]').each(function() {
	        selectedTags.push($(this).val());
	    });
	    $('#tagArray').val(selectedTags.join(" "));  // 선택된 태그 값을 hidden input에 설정
	});

	
})

</script>


<title>Insert title here</title>
</head>
   <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="index.html">방 잇다</a>
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
						<div class="sb-sidenav-menu-heading">판매자 페이지</div>
						<a class="nav-link" href="../seller.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 판매자 정보
						</a>
			<!-- 			<a class="nav-link" href="powerrating.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 파워링크 등급
						</a> -->
						<a class="nav-link" href="../productmanagement.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 상품 관리
						</a> 
						<a class="nav-link" href="../paymenthistory.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 결제 내역
						</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					Start Bootstrap
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
               <main>
        <div class="container container-fluid px-4">
            <h1 class="mt-4">내상품보기</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="index.html">상품관리</a></li>
                <li class="breadcrumb-item active">내상품보기</li>
            </ol>
            <div class="card mb-4">
                <div class="card-body">
					
					
					<form action="updateItem.do" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <!-- 왼쪽: 상품 정보 -->
                        <div class="col-md-6">
                              <div class="mb-3">
								    <label for="productName" class="form-label">상품번호</label>
								    <input name='est_id' type="text" class="form-control" id="productName" placeholder="자동배정" value='${item.est_id }' readonly>
								</div>
                                <div class="mb-3">
                                    <label for="category" class="form-label">중개인번호</label>
                                    <input name='agent_num' type="text" class="form-control" id="category" value='${item.agent_num }'>
                                </div>
                                <div class="mb-3">
                                    <label for="type" class="form-label">부동산 유형</label>
                                    <br>
                                    <input type='hidden' id='est_type' value='${item.est_type }'>
                                    <select name='est_type' class="form-select">
                                    	<option value="아파트">아파트</option>
                                    	<option value="단독다가구">단독다가구</option>
                                    	<option value="연립다세대">연립다세대</option>
                                    	<option value="오피스텔">오피스텔</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="dealType" class="form-label">거래 유형</label>
                                    <input type='hidden' id='est_tra_type' value='${item.est_tra_type }'>
                                    <select name='est_tra_type' class="form-select">
                                    	<option value="매매">매매</option>
                                    	<option value="전세">전세</option>
                                    	<option value="월세">월세</option>
                                    </select>
                                </div>
          						 <div class="mb-3">
                                    <label for="dealType" class="form-label">가격(또는 보증금, 단위: 만원)</label>
                                    <input name='est_tra_cond' type="number" class="form-control" id="dealType" value='${item.est_tra_cond }' >
                                </div>
                                <div class="mb-3">
                                    <label for="realEstateInfo" class="form-label">주소 </label>
                                    
                                    <table style='width:100%'>
	                                    <tr>
	                                    	<td style='width:100%'><input name='est_addr' type="text" 
	                                    		id="sample4_jibunAddress" class="form-control" 
	                                    		value='${item.est_addr }'
	                                    		placeholder="지번주소(주소찾기로 입력)" readonly></td>
											<td><input type="button" class="btn btn-primary" onclick="sample4_execDaumPostcode()" value="주소찾기" readonly></td>
										</tr>
										
										<tr>
											<td colspan="2"><span id="guide" class="form-control" style="color:#999;display:none"></span></td>
										</tr>
										
									</table>
                                </div>
                            
                        </div>
                        <!-- 오른쪽: 이미지 및 추가 필드 -->
                        <div class="col-md-6">
                            
			                    <div class="mb-3">
								    <label for="option" class="form-label">면적(㎡)</label>
								    <input name='est_m_area' type="number" class="form-control" id="item-size" value='${item.est_m_area }'>
								</div>

                                <div class="mb-3">
                                    <label for="discountPrice" class="form-label">해당 층수(반지하는 -1로 입력)</label>
                                    <input name='est_m_floor' type="number" class="form-control" id="discountPrice" value='${item.est_m_floor}'>
                                </div>
                                <div class="mb-3">
                                    <label for="realPrice" class="form-label">건축연도</label>
                                    <input name='est_jungong' type="number" class="form-control" id="realPrice" value='${item.est_jungong }'>
                                </div>
                            
                            
                            <div>
	                            <label for="file" class="form-label">외부사진 / 내부사진 (최대 6개)</label>
	                            <div id='image-container' class="product-main-image mb-3" style="border: solid lightgray 1px; border-radius: 0.375rem; padding: 2%;">
	                            	
	                                <input type="hidden" name='file1' value='${item.realfname1 }'/>
	                                <input type="hidden" name='file2' value='${item.realfname2 }'/>
	                                <input type="hidden" name='file3' value='${item.realfname3 }'/>
	                                <input type="hidden" name='file4' value='${item.realfname4 }'/>
	                                <input type="hidden" name='file5' value='${item.realfname5 }'/>
	                                <input type="hidden" name='file6' value='${item.realfname6 }'/>
	                                
	                                <div class="bxslider" id="image-window" style="width:100%; text-align:center">
	                                
	                                	<label class="form-label">이미지 로딩중</label>
	                                
	                                </div>
	                            </div>
	                            <div class="product-images d-flex flex-row gap-3">
	                           		
	                            </div>
                            </div>
                        </div>
                    </div>
                    
                    <input id='tagArray' name='tagArray' type='hidden' value='${item.tagArray}'>
                   
                    <label for="btn-tag" class="form-label">태그선택</label><br>
                    <div style="border: solid lightgray 1px; border-radius: 0.375rem; padding: 2%;">
                    <span id='tagListTable'>
						<button  type="button"  class='btn btn-primary btn-tag' onoff='false' value='보안'		>보안		</button>
						<button  type="button" class='btn btn-primary btn-tag' onoff='false' value='세탁기'		>세탁기	</button>
						<button  type="button" class='btn btn-primary btn-tag' onoff='false' value='침대'		>침대		</button>
						<button type="button" class='btn btn-primary btn-tag' onoff='false' value='제습기'		>제습기	</button>
						<button type="button" class='btn btn-primary btn-tag' onoff='false' value='전자레인지'	>전자레인지</button>
						<button type="button" class='btn btn-primary btn-tag' onoff='false' value='가스레인지'	>가스레인지</button>
						<button type="button" class='btn btn-primary btn-tag' onoff='false' value='인덕션'		>인덕션	</button>
						<button type="button" class='btn btn-primary btn-tag' onoff='false' value='건조기'		>건조기	</button>
						<button type="button" class='btn btn-primary btn-tag' onoff='false' value='난방종류'		>난방종류	</button>
						<button type="button" class='btn btn-primary btn-tag' onoff='false' value='책상'		>책상		</button>
						<button type="button" class='btn btn-primary btn-tag' onoff='false' value='냉장고'		>냉장고	</button>
						<button type="button" class='btn btn-primary btn-tag' onoff='false' value='신발장'		>신발장	</button>
						<button type="button" class='btn btn-primary btn-tag' onoff='false' value='싱크대'		>싱크대	</button>
						<button type="button" class='btn btn-primary btn-tag' onoff='false' value='옷장'		>옷장		</button>
					</span>
                    </div>
                    
                    <!-- 버튼 섹션 -->
                    <div class="btn-section">
					    <button type="submit" class="btn btn-primary">수정</button>
						<button type="submit" class="btn btn-primary" name="isSold" value="true">판매완료</button>
                        <button id="btn_cancel" class="btn btn-primary">등록취소</button>
                    </div>
                    </form>
                  
                    
                </div>
            </div>
        </div>
    </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2025</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>


<!-- bxslider -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.css">
<script src="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.js"></script>
	
<!-- daum 주소찾기 api -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="../resources/static/js/datatables-simple-demo.js"></script>
<script>
	function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
               /*  document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                } */
                
                // 각 요소를 확인 후 값을 넣어준다.
                var postcodeElement = document.getElementById('sample4_postcode');
                if (postcodeElement) {
                    postcodeElement.value = data.zonecode;
                }

                var roadAddressElement = document.getElementById("sample4_roadAddress");
                if (roadAddressElement) {
                    roadAddressElement.value = roadAddr;
                }

                var jibunAddressElement = document.getElementById("sample4_jibunAddress");
                if (jibunAddressElement) {
                    jibunAddressElement.value = data.jibunAddress;
                }

                var extraAddressElement = document.getElementById("sample4_extraAddress");
                if (extraAddressElement) {
                    if (roadAddr !== '') {
                        extraAddressElement.value = extraRoadAddr;
                    } else {
                        extraAddressElement.value = '';
                    }
                }

                // guide 요소도 확인 후 값을 설정
                var guideTextBox = document.getElementById("guide");
                if (guideTextBox) {
                    if (data.autoRoadAddress) {
                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                        guideTextBox.style.display = 'block';
                    } else if (data.autoJibunAddress) {
                        var expJibunAddr = data.autoJibunAddress;
                        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                        guideTextBox.style.display = 'block';
                    } else {
                        guideTextBox.innerHTML = '';
                        guideTextBox.style.display = 'none';
                    }
                }

            }
        }).open();
    }
</script>

    </body>
</html>