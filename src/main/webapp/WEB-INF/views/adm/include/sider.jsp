<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- resources/adm/include/sidebar.jsp -->
<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div class="sb-sidenav-menu-heading"></div>
                <a class="nav-link" href="adm_main.do">
                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                    사업현황
                </a>
                <div class="sb-sidenav-menu-heading"></div>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                    관리
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="adm_user_alluser.do">회원</a>
                        <a class="nav-link" href="adm_item_all.do">상품</a>
                        <a class="nav-link" href="adm_event_attend_set.do">이벤트</a>
                        <a class="nav-link" href="adm_popup.do">팝업</a>
                        <a class="nav-link" href="adm_option.do">옵션</a>
                        <a class="nav-link" href="adm_pw_change.do">비밀번호 변경</a>
                    </nav>
                </div>
                <a class="nav-link collapsed" href="adm_pw_change.do">
                    <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                    로그아웃
                </a>
            </div>
        </div>
        <div class="sb-sidenav-footer">
            <div class="small">Logged in as:</div>
            관리자모드
        </div>
    </nav>
</div>
