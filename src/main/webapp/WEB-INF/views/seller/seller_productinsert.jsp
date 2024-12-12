<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<% String rootPath = request.getSession().getServletContext().getRealPath("/") ; %>

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
	$('#btn_regist').click(function(){
		
		// 등록 버튼이 눌렸을 때
		// 입력 유효성 검사(입력값이 null인 경우)
		if ( $('input[name="agent_num"]').val() == "" ){
			
			$('input[name="agent_num"]').focus();
		
		} else if ($('input[name="est_tra_cond"]').val() == ""){
			
			$('input[name="est_tra_cond"]').focus();
			
		} else if ($('input[name="est_addr"]').val() == ""){
		
			$('#sample4_jibunAddress').focus();
			
		} else if ($('input[name="est_m_area"]').val() == 0){
		
			$('input[name="est_m_area"]').focus();
			
		} else if ($('input[name="est_m_floor"]').val() == 0){
		
			$('input[name="est_m_floor"]').focus();
			
		} else if ($('input[name="est_jungong"]').val() == 0){
		
			$('input[name="est_jungong"]').focus();
			
		} else {
			// 무결성 검사 후 다음 페이지에 데이터 넘기기
			let selectedTag = "";
			
			for(let i=0; i < $('.btn-tag').length; i++){
				if($('#tagListTable button:nth-of-type('+i+')').attr("onoff") == "true"){
					selectedTag += $('#tagListTable button:nth-of-type('+i+')').val()+" ";
				}
			}
			$('#tagArray').val($.trim(selectedTag));
			
			$('form[action="regist_item.do"]').submit();
		}
		
		
		
		
	})
	
	// 파일 입력 처리(파일 입력 시 다른 파일도 입력할 수 있게 보여주기)
	// 전체 숨김 처리 후 첫번째 파일 입력만 가능하게 보여줌 
	$('input[type="file"]').hide();
	$('input[idx="1"]').show();
	// 파일 입력 시 다음 입력칸 보여주기
	$('input[type="file"]').change(function(){
		
		$('input[idx="'+(parseInt($(this).attr("idx"))+1)+'"]').show();
		
	})
	
	// 태그 버튼 성정
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

					<li><a class="dropdown-item" href="logout.do">Logout</a></li>
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
            
            <!-- *********************************************** -->
               <main>
        <div class="container container-fluid px-4">
            <h1 class="mt-4">상품등록</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="index.html">상품관리</a></li>
                <li class="breadcrumb-item active">상품등록</li>
            </ol>
            <div class="card mb-4">
                <div class="card-body">
                <form action="regist_item.do" method='post' enctype="multipart/form-data"> <!-- method='post' enctype="multipart/form-data" -->
                    <div class="row">
                        <!-- 왼쪽: 상품 정보 -->
                        <div class="col-md-6">
                              	<div class="mb-3">
								    <label for="productId" class="form-label">상품번호</label>
								    <input name='est_id' type="text" class="form-control" id="productName" placeholder="자동배정" readonly>
								</div>
                                <div class="mb-3">
                                    <label for="category" class="form-label">중개인번호</label>
                                    <input name='agent_num' type="text" class="form-control" id="category">
                                </div>
                                <div class="mb-3">
                                    <label for="type" class="form-label">부동산 유형</label>
                                    <br>
                                    <select name='est_type' class="form-select">
                                    	<option value="아파트">아파트</option>
                                    	<option value="단독다가구">단독다가구</option>
                                    	<option value="연립다세대">연립다세대</option>
                                    	<option value="오피스텔">오피스텔</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="dealType" class="form-label">거래 유형</label>
                                    <select name='est_tra_type' class="form-select">
                                    	<option value="매매">매매</option>
                                    	<option value="전세">전세</option>
                                    	<option value="월세">월세</option>
                                    </select>
                                </div>
          						 <div class="mb-3">
                                    <label for="dealType" class="form-label">가격(또는 보증금, 단위: 만원)</label>
                                    <input name='est_tra_cond' type="number" class="form-control" id="dealType">
                                </div>
                                <div class="mb-3">
                                    <label for="realEstateInfo" class="form-label">주소 </label>
                                    
                                    <table style='width:100%'>
	                                    <tr>
	                                    	<td style='width:100%'><input name='est_addr' type="text" id="sample4_jibunAddress" class="form-control" placeholder="지번주소(주소찾기로 입력)" readonly></td>
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
								    <input name='est_m_area' type="number" class="form-control" id="item-size">
								</div>

                                <div class="mb-3">
                                    <label for="discountPrice" class="form-label">해당 층수(반지하는 -1)</label>
                                    <input name='est_m_floor' type="number" class="form-control" id="discountPrice">
                                </div>
                                <div class="mb-3">
                                    <label for="realPrice" class="form-label">건축연도</label>
                                    <input name='est_jungong' type="number" class="form-control" id="realPrice" >
                                </div>
                                                        
                            <div>
	                            <label for="file" class="form-label">외부사진 / 내부사진 (최대 6개)</label>
	                             
	                            <div class="product-main-image mb-3" style="border: solid lightgray 1px; border-radius: 0.375rem; padding: 2%;">
	                            	
	                            	<input type='hidden' name='rootPath' value='<%=rootPath%>'>
	                            	
	                                <input type="file" name='file1' idx='1' accept='image/*' style='cursor: pointer'/>
	                                <input type="file" name='file2' idx='2' accept='image/*' style='cursor: pointer'/>
	                                <input type="file" name='file3' idx='3' accept='image/*' style='cursor: pointer'/>
	                                <input type="file" name='file4' idx='4' accept='image/*' style='cursor: pointer'/>
	                                <input type="file" name='file5' idx='5' accept='image/*' style='cursor: pointer'/>
	                                <input type="file" name='file6' idx='6' accept='image/*' style='cursor: pointer'/>
	                                
	                            </div>
	                            
                            </div>
                        </div>
                    </div>
                    <input id='tagArray' name='tagArray' type='hidden'>
                    </form>
                    <label for="btn-tag" class="form-label">태그선택</label><br>
                    <div style="border: solid lightgray 1px; border-radius: 0.375rem; padding: 2%;">
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
                    <!-- 버튼 섹션 -->
                    <div class="btn-section">
                        <button id="btn_regist" class="btn btn-primary">상품등록</button>
                        <button id="btn_cancel" class="btn btn-primary">취소</button>
                    </div>
                    
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
                //document.getElementById('sample4_postcode').value = data.zonecode;
                //document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                /* if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                } */

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
                }
            }
        }).open();
    }

</script>
        
    </body>
</html>