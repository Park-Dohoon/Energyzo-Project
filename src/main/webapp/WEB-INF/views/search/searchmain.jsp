<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- fonts api -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap"rel="stylesheet"/>

<!-- favicon -->
<link rel="shortcut icon" href="../resources/static/base_template/favicon.png" type="image/x-icon" />

<!-- bootstrap -->
<link rel="stylesheet" href="../resources/static/bootstrap/css/bootstrap.min.css"/>

<!-- original template -->
<!-- font -->
<link rel="stylesheet" href="../resources/static/base_template/fonts/icomoon/style.css" />
<link rel="stylesheet" href="../resources/static/base_template/fonts/flaticon/font/flaticon.css" />
<!-- css -->
<link rel="stylesheet" href="../resources/static/base_template/css/tiny-slider.css" />
<link rel="stylesheet" href="../resources/static/base_template/css/aos.css" />
<link rel="stylesheet" href="../resources/static/base_template/css/style.css" />



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



<!-- script -->
<!-- kakao api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=17e6075354a9e2f987a2e2a9b2b30e22&libraries=services"></script>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- custom css -->
<link rel="stylesheet" href="../resources/static/css/searchmain.css" />
<!-- custom js -->
<!-- <script type="text/javascript" src='../resources/static/js/searchmain.js'></script>
 -->
<script type="text/javascript">


//jquery
$(function(){
	
	// 조건1 만들기
	let area = {
	        "수도권" :{
	            "서울" : [ 	["강남구", 11680], ["강동구", 11740], ["강북구", 11305], ["강서구", 11500], ["관악구", 11620], ["광진구", 11215], ["구로구", 11530], ["금천구", 11545], ["노원구", 11350], ["도봉구", 11320], ["동대문구", 11230], ["동작구", 11590], ["마포구", 11440], ["서대문구", 11410], ["서초구", 11650], ["성동구", 11200], ["성북구", 11290], ["송파구", 11710], ["양천구", 11470], ["영등포구", 11560], ["용산구", 11170], ["은평구", 11380], ["종로구", 11110], ["중구", 11140], ["중랑구", 11260] ],
	            
	            "경기" : 	[ 	["수원시 장안구",0], ["수원시 권선구",0], ["수원시 팔달구",0], ["수원시 영통구",0], ["성남시 수정구",0], ["성남시 중원구",0], ["성남시 분당구",0], ["의정부시",0], ["안양시 만안구",0], ["안양시 동안구",0], ["부천시",0], ["광명시",0], ["평택시",0], ["동두천시",0], ["안산시 상록구",0], ["안산시 단원구",0], ["고양시 덕양구",0], ["고양시 일산동구",0],
	                			["고양시 일산서구",0], ["과천시",0], ["구리시",0], ["남양주시",0], ["오산시",0], ["시흥시",0], ["군포시",0], ["의왕시",0], ["하남시",0], ["용인시 처인구",0], ["용인시 기흥구",0], ["용인시 수지구",0], ["파주시",0], ["이천시",0], ["안성시",0], ["김포시",0], ["화성시",0], ["광주시",0], ["양주시",0], ["포천시",0], ["여주시",0], ["연천군",0], ["가평군",0],
	                			["양평군",0] ],
	            "인천" : [ 	["계양구",0], ["미추홀구",0], ["남동구",0], ["동구",0], ["부평구",0], ["서구",0], ["연수구",0], ["중구",0], ["강화군",0], ["옹진군",0] ]			
	        },
	        "강원권" :{
	            "강원특별자치도" : 	[ 	["춘천시",0], ["원주시",0], ["강릉시",0], ["동해시",0], ["태백시",0], ["속초시",0], ["삼척시",0], ["홍천군",0], ["횡성군",0], ["영월군",0], ["평창군",0], ["정선군",0], ["철원군",0], ["화천군",0], ["양구군",0], ["인제군",0], ["고성군",0], ["양양군",0] ]			
	        },
	        "충청권" :{
	            "충북" : 	[ 	["청주시 상당구",0], ["청주시 서원구",0], ["청주시 흥덕구",0], ["청주시 청원구",0], ["충주시",0], ["제천시",0], ["보은군",0], ["옥천군",0], ["영동군",0], ["증평군",0], ["진천군",0], ["괴산군",0], ["음성군",0], ["단양군",0] ],
	            "충남" : 	[ 	["천안시 동남구",0], ["천안시 서북구",0], ["공주시",0], ["보령시",0], ["아산시",0], ["서산시",0], ["논산시",0], ["계룡시",0], ["당진시",0], ["금산군",0], ["부여군",0], ["서천군",0], ["청양군",0], ["홍성군",0], ["예산군",0], ["태안군",0] ],
	            "대전" : [ 	["대덕구",0], ["동구",0], ["서구",0], ["유성구",0], ["중구",0] ],
	            "세종특별자치시" : [ ["세종특별자치시",0] ]			
	        },
	        "전라권" :{
	            "전북" : [ 	["전주시 완산구",0], ["전주시 덕진구",0], ["군산시",0], ["익산시",0], ["정읍시",0], ["남원시",0], ["김제시",0], ["완주군",0], ["진안군",0], ["무주군",0], ["장수군",0], ["임실군",0], ["순창군",0], ["고창군",0], ["부안군",0] ],
	            "전남" : [ 	["목포시",0], ["여수시",0], ["순천시",0], ["나주시",0], ["광양시",0], ["담양군",0], ["곡성군",0], ["구례군",0], ["고흥군",0], ["보성군",0], ["화순군",0], ["장흥군",0], ["강진군",0], ["해남군",0], ["영암군",0], ["무안군",0], ["함평군",0], ["영광군",0], ["장성군",0], ["완도군",0], ["진도군",0], ["신안군",0] ],
	            "광주" : [ 	["광산구",0], ["남구",0], ["동구",0], ["북구",0], ["서구",0] ]			
	        },
	        "경상권" : {
	            "경북" : [ 	["포항시 남구",0], ["포항시 북구",0], ["경주시",0], ["김천시",0], ["안동시",0], ["구미시",0], ["영주시",0], ["영천시",0], ["상주시",0], ["문경시",0], ["경산시",0], ["군위군",0], ["의성군",0], ["청송군",0], ["영양군",0], ["영덕군",0], ["청도군",0], ["고령군",0], ["성주군",0], ["칠곡군",0], ["예천군",0], ["봉화군",0], ["울진군",0], ["울릉군",0] ],
	            "경남" : [ 	["창원시 의창구",0], ["창원시 성산구",0], ["창원시 마산합포구",0], ["창원시 마산회원구",0], ["창원시 진해구",0], ["진주시",0], ["통영시",0], ["사천시",0], ["김해시",0], ["밀양시",0], ["거제시",0], ["양산시",0], ["의령군",0], ["함안군",0], ["창녕군",0], ["고성군",0], ["남해군",0], ["하동군",0], ["산청군",0], ["함양군",0], ["거창군",0], ["합천군",0] ],
	            "부산" : [ 	["강서구",0], ["금정구",0], ["남구",0], ["동구",0], ["동래구",0], ["부산진구",0], ["북구",0], ["사상구",0], ["사하구",0], ["서구",0], ["수영구",0], ["연제구",0], ["영도구",0], ["중구",0], ["해운대구",0], ["기장군",0] ],
	            "대구" : [ 	["남구",0], ["달서구",0], ["동구",0], ["북구",0], ["서구",0], ["수성구",0], ["중구",0], ["달성군",0] ],
	            "울산" : [ 	["남구",0], ["동구",0], ["북구",0], ["중구",0], ["울주군",0] ]			
	        },
	        "제주권" : {
	            "제주특별자치도" : [ ["서귀포시",0], ["제주시",0] ]			
	        }
	    };
	// 지역조건별 객체 생성
	let area1 = Object.entries(area);
	let area2 = Object.entries(area1[0][1]);
	let area3 = area2[0][1];
	
	// 지역 세팅 함수
	// 지역조건2 세팅
	function setAreas2(idx){
		
		$('#area2').empty();
		area2 = Object.entries(area1[idx][1]);
		
		for(let i=0; i<area2.length; i++){
			$('#area2').append($('<option>').text(area2[i][0]));
		}
		
		setAreas3(0);
	}
	// 지역조건3 세팅
	function setAreas3(idx){
		
		$('#area3').empty();
		area3 = area2[idx][1];
		
		for(let i=0; i<area3.length; i++){
			$('#area3').append($('<option areacode="'+area3[i][0]+'">>').text(area3[i][0]));
		}
		$('#area3').attr("areacode", $('#area3 option:selected').attr("areacode") );
		
	}
	
	// 선택이벤트
	$('#area1').change(function(){
		
		let idx = $('#area1 option').index($('#area1 option:selected'));
		setAreas2(idx);
	})
	$('#area2').change(function(){
		let idx = $('#area2 option').index($('#area2 option:selected'));
		setAreas3(idx);
	})
	$('#area3').change(function(){
		$('#area3').attr("areacode", $('#area3 option:selected').attr("areacode") );
	})
	
	
	// 검색 목록 보기 탭(지도+목록보기)
	$('#tab2').hide();
	
	$('a[href="#tab1"]').click(function(){
		$('#tab2').hide();
		$('#tab1').show();
	})
		
	$('a[href="#tab2"]').click(function(){
		$('#tab1').hide();
		$('#tab2').show();
	})
	
	// 주소 리스트
	let addrList = ['서울 마포구 백범로 23'];
	
	// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 9 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 마커와 인포윈도우를 저장할 객체를 지정합니다
	let markers = [];
	let infowindows = [];
	
	
	//command-tab setting
	$('.command-type-item').hover(
			function(){
				if( $($(this).attr("href")).attr("onoff") == "false" ){
					$(this).css({"background-color":"#ddd"})
				}
			}
			, function(){
				if( $($(this).attr("href")).attr("onoff") == "false" ){
					$(this).css({"background-color":"white"})
				}
			}
		)
	
	$(".command-type-info").hide();
	$('.command-type-item').click(function(){
		
		$('.command-type-item').css({"background-color":"white"});
		
		let temp = $(this).attr("href");
		$(".command-type-info").hide();
		
		if($(temp).attr("onoff") == "false"){
			$(this).css({"background-color":"#eee"});
			$(".command-type-info").attr("onoff", "false");
			$(temp).attr("onoff", "true");
			$(temp).show();
			
		} else {
			$(temp).attr("onoff", "false");
		}
		
	})
	
	
	// 검색조건 탭
	// 거래유형
	$('.btn-type').click(function(){
		
		 let onoff = $(this).attr("onoff");
		 
		 if ( onoff == "true" ) {
			 
			 if($(this).val() == "모두"){
				 $('.btn-type').attr("onoff", "false");
				 $('.btn-type').css({"background-color" : "white"});
				 $('.btn-type').css({"color" : "black"});
				 
				 $('#btn-type-1').attr("onoff", "true");
				 $('#btn-type-1').css({"background-color" : "#055"});
				 $('#btn-type-1').css({"color" : "white"});
				 
			 } else {
				 
				 if($('.btn-type[onoff="true"]').length > 1) {
					$(this).attr("onoff", "false");
					$(this).css({"background-color" : "white"});
					$(this).css({"color" : "black"});
					
					$('#btn-type-all').attr("onoff", "false");
					$('#btn-type-all').css({"background-color" : "white"});
					$('#btn-type-all').css({"color" : "black"});
				 }
			 }
		 } else if ( onoff == "false" ) {
			 
			 if($(this).val() == "모두"){
				 $('.btn-type').attr("onoff", "true");
				 $('.btn-type').css({"background-color" : "#055"});
				 $('.btn-type').css({"color" : "white"}); 
			 }
			 else {
				 $(this).attr("onoff", "true");
				 $(this).css({"background-color" : "#055"});
				 $(this).css({"color" : "white"});
				 
				 if($('#btn-type-1').attr("onoff")=="true" && $('#btn-type-2').attr("onoff")=="true" && $('#btn-type-3').attr("onoff")=="true"){
					 $('#btn-type-all').attr("onoff", "true");
					 $('#btn-type-all').css({"background-color" : "#055"});
					 $('#btn-type-all').css({"color" : "white"});
				 }
			 }
			 
		 }
	})
	
	
	// 방 상세설정
	// 조건버튼 관련
	// 조건버튼 초기 세팅
	$('.btn-config-room').css({"background-color":"white", "color":"black"})
	$('.btn-config-room[onoff="true"]').css({"background-color":"#055", "color":"white"})
	
	$('.btn-config-date').css({"background-color":"white", "color":"black"})
	$('.btn-config-date[onoff="true"]').css({"background-color":"#055", "color":"white"})
	
	$('.btn-config-floor').css({"background-color":"white", "color":"black"})
	$('.btn-config-floor[onoff="true"]').css({"background-color":"#055", "color":"white"})
	
	// 방 수
	$('.btn-config-room').click(function(){
		
		$('.btn-config-room[onoff="true"]').css({"background-color":"white", "color":"black"});
		$('.btn-config-room[onoff="true"]').attr("onoff", "false");
		
		$(this).css({"background-color":"#055", "color":"white"})
		$(this).attr("onoff", "true")
	})
	
	// 사용 승인일
	$('.btn-config-date').click(function(){
		
		$('.btn-config-date').css({"background-color":"white", "color":"black"});
		$('.btn-config-date').attr("onoff", "false");
		
		$(this).css({"background-color":"#055", "color":"white"})
		$(this).attr("onoff", "true")
	})
	
	// 층수
	$('.btn-config-floor').click(function(){
		
		if($(this).attr("onoff") == "false"){
			$(this).css({"background-color":"#055", "color":"white"})
			$(this).attr("onoff", "true")
		} else {
			
			let cnt = 0;
			for(let i=1; i<=4; i++){
				if ($('#config-container-floor > button:nth-of-type('+i+')').attr("onoff")=="false"){
					cnt++;
				}
			}
			
			if(cnt < 2){
				$(this).css({"background-color":"white", "color":"black"})
				$(this).attr("onoff", "false")
			}
			
		}
		
	})
	
	// 방크기 지정 슬라이더 관련
	let priceField 	= $('.price-input-size .price-field input');
	let rangeInput	= $('.range-input .input-size');
	let sliderBG	= $('.price-slider-size');
	
	let rangeGap	= 10;
	
	// 값이 바뀐 것을 감지하자마자 적용 (change이벤트의 경우 값이 바뀐 후 적용됨)
	rangeInput.on("input", function(){
		// 선택된 슬라이더가 min/max 인지 판단
		let typeOfRange = $(this).attr("class")[0]+$(this).attr("class")[1]+$(this).attr("class")[2];
		
		if(typeOfRange == "min") {
			// max 슬라이더보다 값이 커지지 않도록 유지
			if( $(this).val() > rangeInput[1].value){
				$(this).val(parseInt(rangeInput[1].value));
			}
			// 변경한 값 입력
			priceField[0].value 
				= $(this).val() + (( $(this).val()==$(this).attr("min") )? "평 이하": "평"); 
			
		} else if (typeOfRange == "max") {
			// min 슬라이더보다 값이 작아지지 않도록 유지
			if( $(this).val() < rangeInput[0].value){
				$(this).val(parseInt(rangeInput[0].value));
			}
			// 변경한 값 입력
			priceField[1].value 
				= $(this).val() + (( $(this).val()==$(this).attr("max") )? "평 이상": "평");
		}
		
		// 슬라이더 사이 게이지 변경
		sliderBG.css({	"left" 	: ((rangeInput[0].value - rangeInput[0].min)*100 / (rangeInput[0].max-rangeInput[0].min))+"%" 
						,"right": ((rangeInput[1].max-rangeInput[1].value)*100 /(rangeInput[1].max - rangeInput[1].min))+"%"})
	})
	
	
	// 태그 설정
	$('.btn-tag').click(function(){
		
		 let onoff = $(this).attr("onoff");
		 
		 if ( onoff == "true" ) {
			 
			 $(this).attr("onoff", "false");
			 $(this).css({"background-color" : "white"});
			 $(this).css({"color" : "black"});
			 
		 } else if ( onoff == "false" ) {
			 
			 $(this).attr("onoff", "true");
			 $(this).css({"background-color" : "#055"});
			 $(this).css({"color" : "white"});
			 
		 }
	})
	
	
	// 초기화
	initAll();
	
	// 초기화 함수
	function initAll(){
		
		// 조건1 초기화
		$('#area1').empty();
		$('#area2').empty();
		$('#area3').empty();
		
		for(let i=0; i<area1.length; i++){
			$('#area1').append($('<option>').text(area1[i][0]));
		}
		setAreas2(0);
		
		
		// 조건2 초기화
		// 버튼 초기화
		$('.btn-type').attr("onoff", "true");
		$('.btn-type').css({"background-color":"#055"
							, "color":"white"})
		// 슬라이더 초기화
		$('.min-range-price').val("0");
		$('.max-range-price').val("5000000000");
		$('.price-slider-price').css({"left":"0%", "right":"0%"});
		$('.min-input-price').val("0원")
		$('.max-input-price').val("무제한")
		
		
		// 조건3 초기화
		// 슬라이더 초기화
		$('.min-range-size').val("10");
		$('.max-range-size').val("60");
		$('.price-slider-size').css({"left":"0%", "right":"0%"});
		$('.min-input-size').val("10평 이하")
		$('.max-input-size').val("60평 이상")
		// 사용 승인일 버튼 초기화
		$('.btn-config-date').attr("onoff","false");
		$('.btn-config-date').css({"background-color":"white", "color":"black"})
		$('.btn-config-date[value="0"]').attr("onoff","true");
		$('.btn-config-date[value="0"]').css({"background-color":"#055", "color":"white"})
		// 층수 버튼 초기화
		$('.btn-config-floor').attr("onoff","true");
		$('.btn-config-floor').css({"background-color":"#055", "color":"white"})
		
		
		// 조건4 초기화
		$('.btn-tag').attr('onoff', 'false');
		$('.btn-tag').css({"background-color":"white", "color": "black"});
		
		
		// 지도 세팅
		// api 검색
		/*$.ajax({
			type : "GET"
			,url : "seoulProperty"
			,data: {cgg_cd : $('#area3').attr('areacode')}
			,dataType : "json"
			,success : searchProperty
			,error : function(e){
				console.log(e);
			}
		})*/
		// DB검색
		$.ajax({
			type : "GET"
			,url : "searchPropertyByAddr.do"
			,data: {est_addr : $('#area2').val() + ' ' + $('#area3').val()}
			,dataType : "json"
			,success : searchPropertyByAddr
			,error : function(e){
				console.log(e);
			}
		})
	}
	
	// 초기화 버튼
	$('button[name="searchInit"]').click(function(){
		initAll();
	})
	
	
	// 검색버튼
	// ajax
	$('button[name="getSearchInfo"]').click(function(){
		
		// 검색조건 세팅
		// 주소 값 가져오기
		let addr 	= $('#area2').val() + ' ' + $('#area3').attr('areacode');
		// 건물종류 값 가져오기
		let btnType= $('.btn-type[onoff="true"]')
		let type	= "" 
		for(let i=0; i<btnType.length; i++){
			if(btnType[i].value == "모두"){
				continue;
			} else if(type == ""){
				type = btnType[i].value;
			} else {
				type += "," + btnType[i].value;
			}
		}
		// 최대금액, 최소금액 값 가져오기
		let priceMax= parseInt($('.max-range-price').val())/10000;
		let priceMin= parseInt($('.min-range-price').val())/10000;
		// 방 최대크기, 최소크기 값 가져오기
		let areaMax	= parseInt($('.max-range-size').val())*3.3;
		let areaMin	= parseInt($('.min-range-size').val())*3.3;
		// 사용승인일 값 가져오기
		let sungin	= $('.btn-config-date[onoff="true"]').val();
		// 층 수 가져오기
		let floor = 0;
		let btnFloor = $('.btn-config-floor[onoff="true"]');
		for(let i=0; i<btnFloor.length; i++){
			floor += parseInt( $('.btn-config-floor[onoff="true"]')[i].value );
		}
		// 입력한 태그 값 가져오기
		let tagArray= "";
		let tag		= $('#tagListTable .btn-tag[onoff="true"]');
		for(let i=0; i < tag.length; i++){
			
			if(i == 0){
				tagArray = tag[i].value;
			} else {
				tagArray += ","+tag[i].value;
			}
		}
		
		
		// 보낼 데이터 세팅
		searchData = {	est_addr 			: addr
						,est_type			: type
						,est_tra_cond_max 	: priceMax
						,est_tra_cond_min	: priceMin
						,est_m_area_max		: areaMax
						,est_m_area_min		: areaMin
						,est_sungin			: sungin
						,est_m_floor		: floor
						,tagArray			: tagArray
						}; 
		
		// DB검색
		$.ajax({
			type : "GET"
			,url : "searchPropertyByAddr.do"
			,data: searchData
			,dataType : "json"
			,success : searchPropertyByAddr
			,error : function(e){
				console.log(e);
			}
		})
		
	})
	
	// 검색 클릭 시 실행되는 함수
	// api
	function searchProperty(result2){
			
			// 표시할 매물 리스트 객체
			addrList = result2["tbLnOpendataRtmsV"]["row"];
			addrList_actual = [];
			console.log(result2);
			
			
			// 지도탭 업데이트
			// 마커와 인포윈도우 초기화
			for(let i=0; i<markers.length; i++){
				markers[i].setMap(null);
				infowindows[i].setMap(null);
			}
			
			markers = [];
			infowindows = [];
			
			
			// 지도에 새 마커 표시
			for (let i= 0; i < addrList.length; i++) {
				
				//console.log(addrList[i].CGG_NM + " " + addrList[i].STDG_NM + " " + addrList[i].BLDG_NM);
				let searchKeyword = addrList[i].CGG_NM + "+" + addrList[i].STDG_NM + "+" + addrList[i].BLDG_NM;
				
				
				// 지도에 태그 표시
				
				// 지도의 정확한 주소 가져오기
				searchKeyAddr 	= $('#area2').val()+" "
								+ addrList[i]["CGG_NM"]+" "
								+ addrList[i]["STDG_NM"]+" "
								+ parseInt(addrList[i]["MNO"])
								+ ( (parseInt(addrList[i]["SNO"])==0) ? "" : ("-"+parseInt(addrList[i]["SNO"])) );
							
				// 정확한 주소로 태그를 만들어 맵에 붙이기
				let innerTag_head 	= '<div style="width:150px;height:100%;text-align:center;padding:6px 0;" align="center">'
				let innerTag_rear 	= '</div>'
							
				let aTag			= '<a href="/javaproject2/search/searchinfo.do" style="color:black">'+addrList[i].BLDG_NM+'</a>'
				let imgTag 			= '<div style="padding:2%"><img src="../resources/static/base_template/logo/방잇다로고_최종_누끼.png" style="width:100%"></div>' 
							
				let innerTag 		= innerTag_head + aTag + imgTag + innerTag_rear;
							
				// 지도 작성 : 주소를 넣으면 검색 후 좌표로 자동 변환하여 맵에 마커와 인포윈도우 표시
				geocoder.addressSearch(searchKeyAddr, function(result, status) {
	
					// 정상적으로 검색이 완료됐으면 
					if (status === kakao.maps.services.Status.OK) {
	
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });
		
				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new kakao.maps.InfoWindow({
				            content: innerTag
				        });
				        infowindow.open(map, marker);
								        
				        // 마커와 인포윈도우 객체 저장
				        markers.push(marker);
				        infowindows.push(infowindow);
		
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});
				
			}
			
			
			// 목록탭 업데이트
			// 목록탭 초기화
			$('.section-properties .container .row').empty();
			console.log("출력 : " + addrList.length)
			// 목록탭 표시
			for (let i= 0; i < addrList.length; i++) {
				
				let itemPrice 	= addrList[i]["THING_AMT"];
				let itemAddr	= $('#area2').val()+" "
								+ addrList[i]["CGG_NM"]+" "
								+ addrList[i]["STDG_NM"]+" "
								+ parseInt(addrList[i]["MNO"])
								+ ( (parseInt(addrList[i]["SNO"])==0) ? "" : ("-"+parseInt(addrList[i]["SNO"])) );
				let itemName	= addrList[i]["BLDG_NM"];
				let itemType	= addrList[i]["BLDG_USG"];
				let itemFloor	= addrList[i]["FLR"]+"층";
				let itemSize	= addrList[i]["ARCH_AREA"]+"㎡";
				
				itemPrice 	= ( (Math.floor( parseInt(itemPrice) / 10000 ) == 0) ? "" : (Math.floor(parseInt(itemPrice)/10000))+"억" )
							+ ( ((parseInt(itemPrice)%10000)==0) ? "" : ((parseInt(itemPrice)%10000))+"만" );
				
				/* 
				console.log(itemPrice);
				console.log(itemAddr);
				console.log(itemName);
				console.log(itemType);
				console.log(itemFloor);
				console.log(itemSize);
				 */
				// outer container
				let itemContainer1 	= $('<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4"/>');
				let itemContainer2 	= $('<div class="property-item mb-30"/>');
				
				// image container
				let itemImg = $('<a href="searchinfo" class="img"/>')
							.append( $('<img src="../resources/static/base_template/images/img_1.jpg" alt="Image" class="img-fluid" />') );
				
				// content container
				let itemContentContainer	= $('<div class="property-content">');
				// price
				let itemPriceContainer		= $('<div class="price mb-2"/>')
											.append( $('<span/>').text(itemPrice) );
				// inner container
				let itemInnerContainer		= $('<div/>')
											.append($('<span class="d-block mb-2 text-black-50"/>')
													.text(itemAddr)
													)
											.append($('<span class="city d-block mb-3"/>')
													.text(itemName)
													);
				// type, floor, size Row
				let itemInfoRow				= $('<div class="specs d-flex mb-4">')
											.append($('<span class="d-block d-flex align-items-center">')
													.append($('<span class="caption">')
															.text(itemType+"ㆍ")
															)
													)
											.append($('<span class="d-block d-flex align-items-center">')
													.append($('<span class="caption">')
															.text(itemFloor+"ㆍ")
															)
													)
											.append($('<span class="d-block d-flex align-items-center">')
													.append($('<span class="caption">')
															.text(itemSize)
															)
													);
				
				
				// attatch
				itemInnerContainer.append(itemInfoRow);
				itemInnerContainer.append($('<a href="searchinfo" class="btn btn-primary py-2 px-3">자세히 보기</a>'));
				
				itemContentContainer.append(itemPriceContainer);
				itemContentContainer.append(itemInnerContainer);
				
				itemContainer2.append(itemImg);
				itemContainer2.append(itemContentContainer);
				
				itemContainer1.append(itemContainer2);
				
				$('.section-properties .container .row').append(itemContainer1);
			}
			
		} // end of function
		
		
		
		// DB 검색
		function searchPropertyByAddr(result2){
			
			// 지도탭 업데이트
			// 마커와 인포윈도우 초기화
			for(let i=0; i<markers.length; i++){
				markers[i].setMap(null);
				infowindows[i].setMap(null);
			}
			
			markers = [];
			infowindows = [];
			
			
			// 지도에 새 마커 표시
			for (let i= 0; i < result2.length; i++) {
				
				// 선택한 주소정보 얻어오기
				let searchKeyword = result2[i].est_addr;
				
				// 맵에 붙일 태그 만들기(infowindow)
				let innerTag_head 	= '<div style="width:150px;height:100%;text-align:center;padding:6px 0;" align="center">'
				let innerTag_rear 	= '</div>'
							
				let aTag			= '<a href="searchinfo.do?est_id='+result2[i].est_id+'" style="color:black">'+result2[i].est_type+'</a>'
				let imgTag 			= ((result2[i].realfname1 == undefined)	? '<div style="padding:2%"><img src="../resources/static/base_template/logo/방잇다로고_최종_누끼.png" style="width:100%"></div>'
																			: '<div style="padding:2%"><img src="../resources/static/upload/'+result2[i].realfname1+'" style="width:100%"></div>');
							
				let innerTag 		= innerTag_head + aTag + imgTag + innerTag_rear;
							
				// 지도 작성 : 주소를 넣으면 검색 후 좌표로 자동 변환하여 맵에 마커와 인포윈도우 표시
				geocoder.addressSearch(searchKeyword, function(result, status) {
	
					// 정상적으로 검색이 완료됐으면 
					if (status === kakao.maps.services.Status.OK) {
	
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });
		
				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new kakao.maps.InfoWindow({
				            content: innerTag
				        });
				        infowindow.open(map, marker);
								        
				        // 마커와 인포윈도우 객체 저장
				        markers.push(marker);
				        infowindows.push(infowindow);
		
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});
				
			}
			
			
			// 목록탭 업데이트
			// 목록탭 초기화
			$('.section-properties .container .row').empty();
			console.log("출력 : " + result2.length)
			// 목록탭 표시
			for (let i= 0; i < result2.length; i++) {
				
				let itemPrice 	= result2[i]["est_tra_cond"];
				let itemAddr	= result2[i]["est_addr"];
				let itemName	= result2[i]["est_type"];
				let itemType	= result2[i]["est_type"];
				let itemFloor	= result2[i]["est_m_floor"]+"층";
				let itemSize	= result2[i]["est_m_area"]+"㎡";
				
				itemPrice 	= ( (Math.floor( parseInt(itemPrice) / 10000 ) == 0) ? "" : (Math.floor(parseInt(itemPrice)/10000))+"억" )
							+ ( ((parseInt(itemPrice)%10000)==0) ? "" : ((parseInt(itemPrice)%10000))+"만" );
				
				/* 
				console.log(itemPrice);
				console.log(itemAddr);
				console.log(itemName);
				console.log(itemType);
				console.log(itemFloor);
				console.log(itemSize);
				 */
				// outer container
				let itemContainer1 	= $('<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4"/>');
				let itemContainer2 	= $('<div class="property-item mb-30"/>');
				
				// image container
				itemImgRealPath = ((result2[i].realfname1 == undefined)	? '../resources/static/base_template/logo/Re_방잇다로고_최종_누끼.png'
																		: '../resources/static/upload/'+result2[i].realfname1) 
				let itemImg = $('<div  style="height:300px;">').append($('<a href="searchinfo.do?est_id='+result2[i].est_id+'" class="img" style="width:100%" />')
							.append( $('<img src="'+itemImgRealPath+'" alt="property image" class="img-fluid" />') ));
				
				// content container
				let itemContentContainer	= $('<div class="property-content">');
				// price
				let itemPriceContainer		= $('<div class="price mb-2"/>')
											.append( $('<span/>').text(itemPrice) );
				// inner container
				let itemInnerContainer		= $('<div/>')
											.append($('<span class="d-block mb-2 text-black-50"/>')
													.text(itemAddr)
													)
											.append($('<span class="city d-block mb-3"/>')
													.text(itemName)
													);
				// type, floor, size Row
				let itemInfoRow				= $('<div class="specs d-flex mb-4">')
											.append($('<span class="d-block d-flex align-items-center">')
													.append($('<span class="caption">')
															.text(itemType+"ㆍ")
															)
													)
											.append($('<span class="d-block d-flex align-items-center">')
													.append($('<span class="caption">')
															.text(itemFloor+"ㆍ")
															)
													)
											.append($('<span class="d-block d-flex align-items-center">')
													.append($('<span class="caption">')
															.text(itemSize)
															)
													);
				
				
				// attatch
				itemInnerContainer.append(itemInfoRow);
				itemInnerContainer.append($('<a href="searchinfo.do?est_id='+result2[i].est_id+'" class="btn btn-primary py-2 px-3">자세히 보기</a>'));
				
				itemContentContainer.append(itemPriceContainer);
				itemContentContainer.append(itemInnerContainer);
				
				itemContainer2.append(itemImg);
				itemContainer2.append(itemContentContainer);
				
				itemContainer1.append(itemContainer2);
				
				$('.section-properties .container .row').append(itemContainer1);
			}
			
			
		} // end of function
})

window.onload = function(){
	//  Script.js
	const rangevalue = 
	    document.querySelector(".slider-container .price-slider");
	const rangeInputvalue = 
	    document.querySelectorAll(".range-input input");

	// Set the price gap
	let priceGap = 50000000;

	// Adding event listners to price input elements
	const priceInputvalue = 
	    document.querySelectorAll(".price-input input");
	for (let i = 0; i < priceInputvalue.length; i++) {
	    priceInputvalue[i].addEventListener("input", e => {

	        // Parse min and max values of the range input
	        let minp = parseInt(priceInputvalue[0].value);
	        let maxp = parseInt(priceInputvalue[1].value);
	        let diff = maxp - minp
			
	        if (minp < 0) {
	            
	            priceInputvalue[0].value = 0;
	            minp = 0;
	        }
			
	        // Validate the input values
	        if (maxp > 5000000000) {
	            
	            priceInputvalue[1].value = 5000000000;
	            maxp = 5000000000;
	        }

	        if (minp > maxp - priceGap) {
	            priceInputvalue[0].value = maxp - priceGap;
	            minp = maxp - priceGap;

	            if (minp < 0) {
	                priceInputvalue[0].value = 0;
	                minp = 0;
	            }
	        }
			
	        // Check if the price gap is met 
	        // and max price is within the range
	        if (diff >= priceGap && maxp <= rangeInputvalue[1].max) {
	            if (e.target.className === "min-input") {
	                rangeInputvalue[0].value = minp;
	                let value1 = rangeInputvalue[0].max;
	                
	                let percentageMin = `${(minp / value1) * 100}%`;
	                $('.slider-container .price-slider').css({"left":percentageMin});
	            }
	            else {
	                rangeInputvalue[1].value = maxp;
	                let value2 = rangeInputvalue[1].max;

	                let percentageMax = `${100 - (maxp / value2) * 100}%`;
	                $('.slider-container .price-slider').css({"left":percentageMax});
	            }
	        }
	    });

	    // Add event listeners to range input elements
	    for (let i = 0; i < rangeInputvalue.length; i++) {
	        rangeInputvalue[i].addEventListener("input", e => {
	            let minVal = 
	                parseInt(rangeInputvalue[0].value);
	            let maxVal = 
	                parseInt(rangeInputvalue[1].value);

	            let diff = maxVal - minVal
	            
	            // Check if the price gap is exceeded
	            if (diff < priceGap) {
	            
	                // Check if the input is the min range input
	                if (e.target.className === "min-range") {
	                    rangeInputvalue[0].value = maxVal - priceGap;
	                }
	                else {
	                    rangeInputvalue[1].value = minVal + priceGap;
	                }
	            }
	            else {
	            
	                // Update price inputs and range progress
	                priceInputvalue[0].value = (minVal == 0) ? "0원":(minVal/100000000)+"억원";
	                priceInputvalue[1].value = (maxVal == 5000000000) ? "무제한":(maxVal/100000000)+"억원";
	                
	                
	                $('.slider-container .price-slider').css({"left"	: (Math.floor((minVal / rangeInputvalue[0].max) * 100))+"%"});
	                
	                $('.slider-container .price-slider').css({"right"	: (Math.floor(100 - (maxVal / rangeInputvalue[1].max) * 100))+"%"});
	            }
	        });
	    }
	}
}

</script>

<title>검색 메인</title>
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

<br><br><br><br><br>
<!-- 헤더관련 -->


<div class="container">
	
	<!-- 검색창 -->
	<div class='command-type'>
		<table class='command-type-header'>
			<tr>
			  	<td>
			  		<table>	
			  			<tr>
			  				<td><button name=searchInit>초기화</button></td>
			  				<td><button name=getSearchInfo>검색</button></td>
			  			</tr>
			  		</table>
			  	</td>
			  	<td colspan=3><input readonly name='searchKeyword' type='text' placeholder=""></td>
		  	</tr>
		  	<tr>
			  	<td><button class='command-type-item' href='#command-type1'>지역설정</button></td>
			  	<td><button class='command-type-item' href='#command-type2'>종류&가격</button></td>
			  	<td><button class='command-type-item' href='#command-type3'>방 상세설정</button></td>
			  	<td><button class='command-type-item' href='#command-type4'>태그</button></td>
		  	</tr>
		</table>
		
		<!-- 조건1 -->
		<div id='command-type1' class='command-type-info' onoff='false'>
			<p>지역조건설정</p>
			<table id='addrSet' align='center'>
				
				<tr>
					<td align='center'>
						<select id="area1">
							
						</select>
					</td>
					<td align='center'>
						<select id="area2">
							
						</select>
					</td>
					<td align='center'>
						<select id="area3">
							
						</select>
					</td>
				</tr>
			</table>
		</div>
		
		<!-- 조건2 -->
		<div id='command-type2' class='command-type-info' onoff='false'>
			<table>
				<tr>
					<td>
						건물종류
					</td>
					<td>
						가격
					</td>
				</tr>
				<tr>
					<td>
						<button id='btn-type-all' 	class='btn btn-primary btn-type btn-type-all' onoff='true' value='모두'>모두</button>
						<button id='btn-type-1' 	class='btn btn-primary btn-type' onoff='true' value="'아파트'"	>아파트</button>
						<button id='btn-type-2' 	class='btn btn-primary btn-type' onoff='true' value="'단독다가구'"	>단독다가구</button>
						<button id='btn-type-3' 	class='btn btn-primary btn-type' onoff='true' value="'연립다세대'"	>연립다세대</button>
						<button id='btn-type-4' 	class='btn btn-primary btn-type' onoff='true' value="'오피스텔'"	>오피스텔</button>
					</td>
					<td style="width:50%">
						
            <div class="price-input-container">
                <div class="price-input">
                    <div class="price-field">
                        <span>최소금액</span>
                        <input type="text" 
                               class="min-input min-input-price" 
                               value="1억원" readonly>
                    </div>
                    <div class="price-field">
                        <span>최대금액</span>
                        <input type="text" 
                               class="max-input max-input-price" 
                               value="10억원" readonly>
                    </div>
                </div>
                <div class="slider-container">
                    <div class="price-slider price-slider-price">
                    </div>
                </div>
            </div>

            <!-- Slider -->
            <div class="range-input">
                <input type="range" 
                       class="min-range min-range-price" 
                       min="0" 
                       max="5000000000" 
                       value="100000000" 
                       step="50000000">
                <input type="range" 
                       class="max-range max-range-price" 
                       min="0" 
                       max="5000000000" 
                       value="1000000000" 
                       step="50000000">
            </div>
					</td>
				</tr>
			</table>
		</div>
		
		<!-- 조건3 -->
		<div id='command-type3' class='command-type-info' onoff='false'>
			<table>
				<tr>
					<td>
						<div class="custom-wrapper">
							<p>방 크기 설정</p>
				            <div class="price-input-container">
				                <div class="price-input price-input-size">
				                    <div class="price-field">
				                        <span>최소크기</span>
				                        <input type="text" 
				                               class="min-input min-input-size" 
				                               value="20평">
				                    </div>
				                    <div class="price-field">
				                        <span>최대크기</span>
				                        <input type="text" 
				                               class="max-input max-input-size" 
				                               value="40평">
				                    </div>
				                </div>
				                <div class="slider-container">
				                    <div class="price-slider-size">
				                    </div>
				                </div>
				            </div>
				            
				            <!-- Slider -->
				            <div class="range-input">
				                <input type="range" 
				                       class="min-range input-size min-range-size" 
				                       min="10" 
				                       max="60" 
				                       value="20" 
				                       step="10">
				                <input type="range" 
				                       class="max-range input-size max-range-size" 
				                       min="10" 
				                       max="60" 
				                       value="40" 
				                       step="10">
				            </div>
				        </div>
				        
			        </td>
					<td style="width:50%; padding-left:5%">
						<div>
							<p>사용승인일</p>
							<div id='config-container-date'>
								<button class='btn btn-primary btn-config-date' onoff='true' value='0'>전체</button>
								<button class='btn btn-primary btn-config-date' onoff='false' value='5'>5년이내</button>
								<button class='btn btn-primary btn-config-date' onoff='false' value='10'>10년이내</button>
								<button class='btn btn-primary btn-config-date' onoff='false' value='15'>15년이내</button>
								<button class='btn btn-primary btn-config-date' onoff='false' value='150'>15년이상</button>
							</div>
							<br>
							<div id='config-container-floor'>
								<p>층 수</p>
								<button class='btn btn-primary btn-config-floor' onoff='true' value='1'>1층</button>
								<button class='btn btn-primary btn-config-floor' onoff='true' value='4'>2층이상</button>
								<button class='btn btn-primary btn-config-floor' onoff='true' value='2'>반지하</button>
								
							</div>
							
						</div>
					</td>
				</tr>
			</table>
		</div>
		
		<!-- 조건4 -->
		<div id='command-type4' class='command-type-info' onoff='false'>
			<p>태그선택</p>
			<span id='tagListTable'>
				
						<button class='btn btn-primary btn-tag' onoff='false' value="'보안'"		>보안		</button>
						<button class='btn btn-primary btn-tag' onoff='false' value="'세탁기'"		>세탁기	</button>
						<button class='btn btn-primary btn-tag' onoff='false' value="'침대'"		>침대		</button>
						<button class='btn btn-primary btn-tag' onoff='false' value="'제습기'"		>제습기	</button>
						<button class='btn btn-primary btn-tag' onoff='false' value="'전자레인지'"	>전자레인지</button>
						<button class='btn btn-primary btn-tag' onoff='false' value="'가스레인지'"	>가스레인지</button>
						<button class='btn btn-primary btn-tag' onoff='false' value="'인덕션'"		>인덕션	</button>
						<button class='btn btn-primary btn-tag' onoff='false' value="'건조기'"		>건조기	</button>
						<button class='btn btn-primary btn-tag' onoff='false' value="'난방종류'"		>난방종류	</button>
						<button class='btn btn-primary btn-tag' onoff='false' value="'책상'"		>책상		</button>
						<button class='btn btn-primary btn-tag' onoff='false' value="'냉장고'"		>냉장고	</button>
						<button class='btn btn-primary btn-tag' onoff='false' value="'신발장'"		>신발장	</button>
						<button class='btn btn-primary btn-tag' onoff='false' value="'싱크대'"		>싱크대	</button>
						<button class='btn btn-primary btn-tag' onoff='false' value="'옷장'"		>옷장		</button>
					
			</span>
		</div>
	</div>

	<!-- 지도,목록 탭 -->
	<ul class='nav nav-tabs tab-head'>
      <li class='active'><a href="#tab1" data-toggle="tab">지도보기</a></li>
      <li ><a href="#tab2" data-toggle="tab">목록보기</a></li>
    </ul>
	
	<div class='tab-body'>
		<!-- vo로 받아온 값 hidden으로 저장 -->
		<div id='itemInfoList'>
			<c:forEach items="${itemList }" var="item">
				<input type	='hidden' 
				est_id='${item.est_id}' 
				est_tra_cond='${item.est_tra_cond }' 
				est_addr='${item.est_addr }' 
				est_type='${item.est_type }' 
				est_m_floor='${item.est_m_floor }' 
				est_m_area='${item.est_m_area }' 
				fname='${item.fname1 }' 
				realfname='${item.realfname1 }'
				>
			</c:forEach>
		</div>
		
	    <div id="tab1" class='tab-pane'>
			<span><div id="map" style="width:100%;height:350px;"></div></span>
	  	</div>
		 
	    <div id="tab2" class='tab-pane'>
	      	
	      	
	      	
    <div class="section section-properties" style="background-color:white">
      <div class="container">
        <div class="row">
        
          <!-- 매물 목록 -->
          
        </div>
      </div>
    </div>
	      	
		</div>
	</div>
	
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

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../resources/static/bootstrap/js/bootstrap.min.js"></script>


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