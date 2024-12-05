<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<!-- script -->
<!-- kakao api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=17e6075354a9e2f987a2e2a9b2b30e22&libraries=services"></script>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>


<!-- custom css -->
<link rel="stylesheet" href="../resources/static/css/searchmain.css" />
<!-- custom js -->
<script type="text/javascript" src='../resources/static/js/searchmain.js'></script>


<title>검색 메인</title>
</head>
<body>

<br>

<!-- <div id="map" style="width:100%;height:350px;"></div> -->

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
						<button id='btn-type-1' 	class='btn btn-primary btn-type' onoff='true' value='아파트'>아파트</button>
						<button id='btn-type-2' 	class='btn btn-primary btn-type' onoff='true' value='단독다가구'>단독다가구</button>
						<button id='btn-type-3' 	class='btn btn-primary btn-type' onoff='true' value='연립대세대'>연립대세대</button>
						<button id='btn-type-4' 	class='btn btn-primary btn-type' onoff='true' value='오피스텔'	>오피스텔</button>
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
								<button class='btn btn-primary btn-config-date' onoff='true' value='전체'>전체</button>
								<button class='btn btn-primary btn-config-date' onoff='false' value='5년이내'>5년이내</button>
								<button class='btn btn-primary btn-config-date' onoff='false' value='10년이내'>10년이내</button>
								<button class='btn btn-primary btn-config-date' onoff='false' value='15년이내'>15년이내</button>
								<button class='btn btn-primary btn-config-date' onoff='false' value='15년이상'>15년이상</button>
							</div>
							<br>
							<div id='config-container-floor'>
								<p>층 수</p>
								<button class='btn btn-primary btn-config-floor' onoff='true' value='층'>1층</button>
								<button class='btn btn-primary btn-config-floor' onoff='true' value='2층이상'>2층이상</button>
								<button class='btn btn-primary btn-config-floor' onoff='true' value='반지하'>반지하</button>
								
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

	<!-- 지도,목록 탭 -->
	<ul class='nav nav-tabs tab-head'>
      <li class='active'><a href="#tab1" data-toggle="tab">지도보기</a></li>
      <li ><a href="#tab2" data-toggle="tab">목록보기</a></li>
    </ul>
	
	<div class='tab-body'>
	    <div id="tab1" class='tab-pane'>
			<span><div id="map" style="width:100%;height:350px;"></div></span>
	  	</div>
		 
	    <div id="tab2" class='tab-pane'>
	      	
	      	
	      	
    <div class="section section-properties">
      <div class="container">
        <div class="row">
        
          <!-- 매물 목록 -->
          
        </div>
      </div>
    </div>
	      	
		</div>
	</div>
	
</div>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../resources/static/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>