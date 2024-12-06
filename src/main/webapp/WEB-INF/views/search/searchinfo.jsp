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

	<main>
        <div class="container container-fluid px-4">
            <span>
            	<div class="btn-section">
                    <button id="btn_contact" class="btn btn-primary" onclick="history.back()" >이전으로</button>
                </div>
                <br>
            </span>
            <div class="card mb-4">
                <div class="card-body">
                
                <!-- 버튼 섹션 -->
                    <div class="btn-section">
                        <button id="btn_contact" class="btn btn-primary" style='width:100%;' >판매자연결</button>
                        
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
	
	<!-- bxslider -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.js"></script>
	
</body>
</html>