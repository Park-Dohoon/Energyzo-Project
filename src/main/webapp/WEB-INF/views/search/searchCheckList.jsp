<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체크리스트</title>

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

<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- custom css -->
<link href="../resources/static/css/styles.css" rel="stylesheet" />
<style>
button.btn-primary {
	font-size: 20px;
}
label.final-check{
	font-size: 20px;
	/* padding-left: 5%; */
	font-weight: bold;
}
.btn-section, #checkListImg, #btn_submit {
	width: 100%;
}
</style>

<!-- custom js -->
<script type="text/javascript">
$(function(){
	$('#btn_submit').click(function(){
		
		if( $('#checkList-checkbox').is(":checked") ){
			
			$('form').submit();
		} else{
			
			alert("체크리스트 확인 후 체크해주세요");
			
			$('html, body').animate({
				scrollTop:0
			},200);
		}
	})
})
</script>

</head>
<body>
<div class='container'>
	<br>
	<div>
		<button class='btn btn-primary' onclick="history.back()">뒤로가기</button>
	</div>
	
	<br>
	<form action="searchSellerInfo.do" method='post'>
		<input name='agent_num' type="hidden" value='${agent.agent_num }'>
	</form>
	
	<img id='checkListImg' alt="체크리스트" src="../resources/static/images/checkList.png">
	
	<div>
		<br>
		<div class="checkbox" align='center'>
			<label class='form-label final-check'>
				<input type="checkbox" id="checkList-checkbox">
				상기 내용을 모두 확인했습니다
			</label>
		</div>
		<br>
		<button type='submit' id="btn_submit" class="btn btn-primary">제출하기</button>
	</div>
	<br>
	<br>
</div>
</body>
</html>