<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../include/header.jsp" %> <!-- head 포함 -->
        <%@ include file="../../include/sider.jsp" %> <!-- 사이드바 포함 -->
        <div id="layoutSidenav_content">
            <main>
                <!-- 여기에 본문 내용 삽입 -->
                
                
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">상품 상세 정보</h1>
                        <div></div>
                						
						<!-- 상품 상세 조회 -->
         				<%@ include file="../../include/item/detail/adm_item_all_detail_main.jsp" %> <!-- 메인 -->

                  </div>   
                
                <!-- 여기까지 본문 내용 삽입 -->
            </main>
        </div>
    </div>
    <%@ include file="../../include/footer.jsp" %> <!-- 푸터 포함 -->
</body>
</html>
