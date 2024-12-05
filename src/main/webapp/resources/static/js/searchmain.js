
// jquery
$(function(){
	
	// 조건1 만들기
	let area = {
	        "수도권" :{
	            "서울특별시" : [ 	["강남구", 11680], ["강동구", 11740], ["강북구", 11305], ["강서구", 11500], ["관악구", 11620], ["광진구", 11215], ["구로구", 11530], ["금천구", 11545], ["노원구", 11350], ["도봉구", 11320], ["동대문구", 11230], ["동작구", 11590], ["마포구", 11440], ["서대문구", 11410], ["서초구", 11650], ["성동구", 11200], ["성북구", 11290], ["송파구", 11710], ["양천구", 11470], ["영등포구", 11560], ["용산구", 11170], ["은평구", 11380], ["종로구", 11110], ["중구", 11140], ["중랑구", 11260] ],
	            
	            "경기도" : 	[ 	["수원시 장안구",0], ["수원시 권선구",0], ["수원시 팔달구",0], ["수원시 영통구",0], ["성남시 수정구",0], ["성남시 중원구",0], ["성남시 분당구",0], ["의정부시",0], ["안양시 만안구",0], ["안양시 동안구",0], ["부천시",0], ["광명시",0], ["평택시",0], ["동두천시",0], ["안산시 상록구",0], ["안산시 단원구",0], ["고양시 덕양구",0], ["고양시 일산동구",0],
	                			["고양시 일산서구",0], ["과천시",0], ["구리시",0], ["남양주시",0], ["오산시",0], ["시흥시",0], ["군포시",0], ["의왕시",0], ["하남시",0], ["용인시 처인구",0], ["용인시 기흥구",0], ["용인시 수지구",0], ["파주시",0], ["이천시",0], ["안성시",0], ["김포시",0], ["화성시",0], ["광주시",0], ["양주시",0], ["포천시",0], ["여주시",0], ["연천군",0], ["가평군",0],
	                			["양평군",0] ],
	            "인천광역시" : [ 	["계양구",0], ["미추홀구",0], ["남동구",0], ["동구",0], ["부평구",0], ["서구",0], ["연수구",0], ["중구",0], ["강화군",0], ["옹진군",0] ]			
	        },
	        "강원권" :{
	            "강원도" : 	[ 	["춘천시",0], ["원주시",0], ["강릉시",0], ["동해시",0], ["태백시",0], ["속초시",0], ["삼척시",0], ["홍천군",0], ["횡성군",0], ["영월군",0], ["평창군",0], ["정선군",0], ["철원군",0], ["화천군",0], ["양구군",0], ["인제군",0], ["고성군",0], ["양양군",0] ]			
	        },
	        "충청권" :{
	            "충청북도" : 	[ 	["청주시 상당구",0], ["청주시 서원구",0], ["청주시 흥덕구",0], ["청주시 청원구",0], ["충주시",0], ["제천시",0], ["보은군",0], ["옥천군",0], ["영동군",0], ["증평군",0], ["진천군",0], ["괴산군",0], ["음성군",0], ["단양군",0] ],
	            "충청남도" : 	[ 	["천안시 동남구",0], ["천안시 서북구",0], ["공주시",0], ["보령시",0], ["아산시",0], ["서산시",0], ["논산시",0], ["계룡시",0], ["당진시",0], ["금산군",0], ["부여군",0], ["서천군",0], ["청양군",0], ["홍성군",0], ["예산군",0], ["태안군",0] ],
	            "대전광역시" : [ 	["대덕구",0], ["동구",0], ["서구",0], ["유성구",0], ["중구",0] ],
	            "세종특별자치시" : [ ["세종특별자치시",0] ]			
	        },
	        "전라권" :{
	            "전라북도" : [ 	["전주시 완산구",0], ["전주시 덕진구",0], ["군산시",0], ["익산시",0], ["정읍시",0], ["남원시",0], ["김제시",0], ["완주군",0], ["진안군",0], ["무주군",0], ["장수군",0], ["임실군",0], ["순창군",0], ["고창군",0], ["부안군",0] ],
	            "전라남도" : [ 	["목포시",0], ["여수시",0], ["순천시",0], ["나주시",0], ["광양시",0], ["담양군",0], ["곡성군",0], ["구례군",0], ["고흥군",0], ["보성군",0], ["화순군",0], ["장흥군",0], ["강진군",0], ["해남군",0], ["영암군",0], ["무안군",0], ["함평군",0], ["영광군",0], ["장성군",0], ["완도군",0], ["진도군",0], ["신안군",0] ],
	            "광주광역시" : [ 	["광산구",0], ["남구",0], ["동구",0], ["북구",0], ["서구",0] ]			
	        },
	        "경상권" : {
	            "경상북도" : [ 	["포항시 남구",0], ["포항시 북구",0], ["경주시",0], ["김천시",0], ["안동시",0], ["구미시",0], ["영주시",0], ["영천시",0], ["상주시",0], ["문경시",0], ["경산시",0], ["군위군",0], ["의성군",0], ["청송군",0], ["영양군",0], ["영덕군",0], ["청도군",0], ["고령군",0], ["성주군",0], ["칠곡군",0], ["예천군",0], ["봉화군",0], ["울진군",0], ["울릉군",0] ],
	            "경상남도" : [ 	["창원시 의창구",0], ["창원시 성산구",0], ["창원시 마산합포구",0], ["창원시 마산회원구",0], ["창원시 진해구",0], ["진주시",0], ["통영시",0], ["사천시",0], ["김해시",0], ["밀양시",0], ["거제시",0], ["양산시",0], ["의령군",0], ["함안군",0], ["창녕군",0], ["고성군",0], ["남해군",0], ["하동군",0], ["산청군",0], ["함양군",0], ["거창군",0], ["합천군",0] ],
	            "부산광역시" : [ 	["강서구",0], ["금정구",0], ["남구",0], ["동구",0], ["동래구",0], ["부산진구",0], ["북구",0], ["사상구",0], ["사하구",0], ["서구",0], ["수영구",0], ["연제구",0], ["영도구",0], ["중구",0], ["해운대구",0], ["기장군",0] ],
	            "대구광역시" : [ 	["남구",0], ["달서구",0], ["동구",0], ["북구",0], ["서구",0], ["수성구",0], ["중구",0], ["달성군",0] ],
	            "울산광역시" : [ 	["남구",0], ["동구",0], ["북구",0], ["중구",0], ["울주군",0] ]			
	        },
	        "제주권" : {
	            "제주특별자치도" : [ ["서귀포시",0], ["제주시",0] ]			
	        }
	    };
	
	
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
			$('#area3').append($('<option areacode="'+area3[i][1]+'">>').text(area3[i][0]));
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
	let addrList = ['서울 서대문구 연세로 13'
		, '서울 서대문구 연세로5다길 22-8'
		, '서울 서대문구 명물길 16'
		, '서울 마포구 신촌로 134'
		, '서울 서대문구 신촌로 83'];
	
	// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 8 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 마커와 인포윈도우를 저장할 객체를 지정합니다
	let markers = [];
	let infowindows = [];
	
	// 지도에 마커 표시
	for (let i= 0; i < addrList.length; i++) {
		
		let innerTag_head 	= '<div style="width:150px;height:100%;text-align:center;padding:6px 0;" align="center">'
		let innerTag_rear 	= '</div>'
		
		let aTag			= '<a href="/javaproject/search/searchinfo.do" style="color:black">상세정보'+(i+1)+'</a>'
		let imgTag 			= '<div style="padding:2%"><img src="../resources/static/base_template/logo/방잇다로고_최종_누끼.png" style="width:100%"></div>' 
		
		let innerTag 		= innerTag_head + aTag + imgTag + innerTag_rear;
		
		
		// 지도 작성
		geocoder.addressSearch(addrList[i], function(result, status) {

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
		        
		        markers.push(marker);
		        infowindows.push(infowindow);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});
		
	}
	
	
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
				 
				 $('.btn-type[value="전세"]').attr("onoff", "true");
				 $('.btn-type[value="전세"]').css({"background-color" : "#055"});
				 $('.btn-type[value="전세"]').css({"color" : "white"});
				 
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
			
			if(cnt < 3){
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
			if( $(this).val() >= rangeInput[1].value-rangeGap){
				$(this).val(parseInt(rangeInput[1].value) - rangeGap);
			}
			// 변경한 값 입력
			priceField[0].value 
				= $(this).val() + (( $(this).val()==$(this).attr("min") )? "평 이하": "평"); 
			
		} else if (typeOfRange == "max") {
			// min 슬라이더보다 값이 작아지지 않도록 유지
			if( $(this).val() <= rangeInput[0].value+rangeGap){
				$(this).val(parseInt(rangeInput[0].value) + rangeGap);
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
		
		let area1 = Object.entries(area);
		let area2 = Object.entries(area1[0][1]);
		let area3 = area2[0][1];
		
		for(let i=0; i<area1.length; i++){
			$('#area1').append($('<option>').text(area1[i][0]));
		}
		
		for(let i=0; i<area2.length; i++){
			$('#area2').append($('<option>').text(area2[i][0]));
		}
		
		for(let i=0; i<area3.length; i++){
			$('#area3').append($('<option areacode="'+area3[i][1]+'">').text(area3[i][0]));
		}
		$('#area3').attr("areacode", $('#area3 option:selected').attr("areacode") );
		
		// 조건2 초기화
		// 버튼 초기화
		$('.btn-type').attr("onoff", "true");
		$('.btn-type').css({"background-color":"#055"
							, "color":"white"})
		// 슬라이더 초기화
		$('.min-range-price').val("100000000");
		$('.max-range-price').val("1000000000");
		$('.price-slider-price').css({"left":"3%", "right":"79%"});
		$('.min-input-price').val("1억원")
		$('.max-input-price').val("10억원")
		
		
		// 조건3 초기화
		// 방수 버튼 초기화
		$('.btn-config-room').attr("onoff", "false")
		$('.btn-config-room').css({"background-color":"white", "color":"black"});
		$('#config-container-room button:nth-of-type(1)').attr("onoff","true")
		$('#config-container-room button:nth-of-type(1)').css({"background-color":"#055", "color":"white"});
		// 슬라이더 초기화
		$('.min-range-size').val("20");
		$('.max-range-size').val("40");
		$('.price-slider-size').css({"left":"20%", "right":"40%"});
		$('.min-input-size').val("20평")
		$('.max-input-size').val("40평")
		// 사용 승인일 버튼 초기화
		$('.btn-config-date').attr("onoff","false");
		$('.btn-config-date').css({"background-color":"white", "color":"black"})
		$('.btn-config-date[value="전체"]').attr("onoff","false");
		$('.btn-config-date[value="전체"]').css({"background-color":"#055", "color":"white"})
		// 층수 버튼 초기화
		$('.btn-config-floor').attr("onoff","true");
		$('.btn-config-floor').css({"background-color":"#055", "color":"white"})
		
		
		// 조건4 초기화
		$('.btn-tag').attr('onoff', 'false');
		$('.btn-tag').css({"background-color":"white", "color": "black"});
		
		
		// 지도 세팅
		$.ajax({
			type : "GET"
			,url : "seoulProperty"
			,data: {cgg_cd : $('#area3').attr('areacode').toString()}
			,dataType : "json"
			,success : searchProperty
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
		
		//console.log($('#area3').attr("areacode"));
		
		$.ajax({
			type : "GET"
			,url : "seoulProperty"
			,data: {cgg_cd : $('#area3').attr('areacode').toString()}
			,dataType : "json"
			,async: false
			,success : searchProperty
			,error : function(e){
				console.log(e);
			}
		})
		
	})
	
	// 검색 클릭 시 실행되는 함수
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
						
			let aTag			= '<a href="/javaproject/search/searchinfo.do" style="color:black">'+addrList[i].BLDG_NM+'</a>'
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
		
	}
	
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