<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %> <!-- head 포함 -->
<body class="sb-nav-fixed">

<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

<!-- 보이기/감추기 패스워드 토글 -->
<script type="text/javascript" src="resources/adm/js/phverifyAuthCode.js"></script>

<!-- 필수입력사항 유효성검사  -->
<script type="text/javascript" src="resources/adm/js/address.js"></script>

<!-- Bootstrap Icons (아이콘 사용) -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
	

        <%@ include file="../include/sider.jsp" %> <!-- 사이드바 포함 -->
        <div id="layoutSidenav_content">
            <main>
                <!-- 여기에 본문 내용 삽입 -->
                
                
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">비밀번호 변경</h1>
                        <ol class="breadcrumb mb-4">
                            현재위치 :&nbsp; <a href="adm_main.do"><li class="breadcrumb-item">관리자</li></a> >&nbsp;관리 >&nbsp;<a href="adm_pw_change.do"><li class="breadcrumb-item active">비밀번호 변경</li></a>
                        </ol>              
               
               
						<!-- 비밀번호 변경 -->
         				<%@ include file="../include/manage/adm_pw_change_main.jsp" %> <!-- 메인 -->
         				
                    </div>             




					<script>
						/* 비번 일치여부 스크립트  */
						function handleBlur() {
							const password = document
									.getElementById('confirm-password').value;
							const confirmPassword = document
									.getElementById('password').value;
							const feedback = document
									.querySelector('.invalid-feedback');

							// 비밀번호와 비밀번호 확인이 일치하지 않으면 경고 메시지 표시
							if (password !== confirmPassword){
								feedback.textContent = "비밀번호가 일치하지 않습니다."; // 메시지 설정
								feedback.style.display = "block"; // 경고 메시지를 보이게 설정
							} else {
								feedback.textContent = ""; // 메시지 제거
								feedback.style.display = "none"; // 경고 메시지 숨기기
							}
						}
						/*-------------------------------------------------------  */
					</script>



	<script type="text/javascript">

		//비번 눈보이기랑 감추기 
		document.addEventListener('DOMContentLoaded', function() {
			// 비밀번호 보이기/숨기기
			document.getElementById('toggle-password')
					.addEventListener(
							'click',
							function() {
								var passwordField = document
										.getElementById('password');
								var icon = this.querySelector('i');
								if (passwordField.type === 'password') {
									passwordField.type = 'text';
									icon.classList.replace('bi-eye',
											'bi-eye-slash');
								} else {
									passwordField.type = 'password';
									icon.classList.replace('bi-eye-slash',
											'bi-eye');
								}
							});

			
						// 비밀번호확인 보이기 감추기 기능
						document.getElementById('toggle-confirm-password').addEventListener('click',
							function() {
								var confirmPasswordField = document.getElementById('confirm-password');
								var icon = this.querySelector('i');
								if (confirmPasswordField.type === 'password') {
									confirmPasswordField.type = 'text';
									icon.classList.replace('bi-eye','bi-eye-slash');
									} else {
									confirmPasswordField.type = 'password';
									icon.classList.replace('bi-eye-slash','bi-eye');
									}
								});
							});
	</script>                
                
                
                <!-- 여기까지 본문 내용 삽입 -->
            </main>
        </div>
    </div>
    <%@ include file="../include/footer.jsp" %> <!-- 푸터 포함 -->
</body>
</html>
