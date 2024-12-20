<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %> <!-- head 포함 -->
        <%@ include file="../include/sider.jsp" %> <!-- 사이드바 포함 -->
        <div id="layoutSidenav_content">
            <main>
                <!-- 여기에 본문 내용 삽입 -->
                
                
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">사업현황</h1>
                        <ol class="breadcrumb mb-4">
                            현재위치 :&nbsp; <a href="adm_main.do"><li class="breadcrumb-item">관리자</li></a> >&nbsp;사업현황 >&nbsp;<a href="adm_main_attend.do"><li class="breadcrumb-item active">출석체크</li></a>
                        </ol>     
                                 
						

						<div class="container-head">

						<%@ include file="../include/main_sub_menu.jsp" %> <!-- 서브 메뉴 -->

						<!-- 기간조회 -->
						<%@ include file="../include/status/adm_main_searchperiod.jsp" %> <!-- 메인 -->


						</div>
               
               						
						<!-- 경매 조회 테이블 -->
         				<%@ include file="../include/status/adm_main_attend_main.jsp" %> <!-- 메인 -->
         		</div>
                
                
                
                <!-- 여기까지 본문 내용 삽입 -->
            </main>
        </div>
    </div>
    <%@ include file="../include/footer.jsp" %> <!-- 푸터 포함 -->
</body>
</html>
