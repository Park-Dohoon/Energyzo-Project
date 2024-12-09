<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %> <!-- head 포함 -->
<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="adm_main.do">
            <img src="resources/adm/assets/img/favicon.jpg" alt="company-logo" class="company-logo">
            <span class="company-name">방잇다</span>
        </a>
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
        <!-- Navbar Search-->
        <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            <div class="input-group">
                <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
            </div>
        </form>
    </nav>
    <div id="layoutSidenav">
        <%@ include file="../include/sider.jsp" %> <!-- 사이드바 포함 -->
        <div id="layoutSidenav_content">
            <main>
                <!-- 여기에 본문 내용 삽입 -->
                
                
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">상품관리</h1>
                        <ol class="breadcrumb mb-4">
                            현재위치 :&nbsp; <a href="adm_main.do"><li class="breadcrumb-item">관리자</li></a> >&nbsp;관리 >&nbsp;<a href="adm_item_all.do"><li class="breadcrumb-item active">상품</li></a> >&nbsp;<a href="adm_item_all.do"><li class="breadcrumb-item active">전체상품</li></a>
                        </ol>              
               
                		<%@ include file="../include/item_sub_menu.jsp" %> <!-- 서브 메뉴 -->
                
                 						
						<!-- 상품 조회 테이블 -->
         				<%@ include file="../include/item/adm_item_all_main.jsp" %> <!-- 메인 -->

                  </div>   
                
                <!-- 여기까지 본문 내용 삽입 -->
            </main>
        </div>
    </div>
    <%@ include file="../include/footer.jsp" %> <!-- 푸터 포함 -->
</body>
</html>
