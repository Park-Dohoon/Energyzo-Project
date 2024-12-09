<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!-- 옵션 목록 제목 및 추가 버튼 -->
<h2>옵션 목록</h2>
<a href="/adm/include/manage/adm_option_addOption.jsp" class="btn btn-success">옵션 추가</a>

<!-- 옵션 항목 테이블 -->
<table class="table table-striped">
    <thead>
        <tr>
            <th>옵션 번호</th>
            <th>옵션 이름</th>
            <th>삭제</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="option" items="${options}">
            <tr>
                <td>${option.est_opt_num}</td>
                <td>${option.est_opt_name}</td>
                <td>
                    <!-- 삭제 버튼 -->
                    <a href="javascript:void(0);" onclick="confirmDelete(${option.est_opt_num}, ${option.est_opt_name})" class="btn btn-danger">삭제</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<!-- 페이징 -->
<div class="pagination">
    <c:if test="${not empty prevPage}">
        <a href="options?page=${prevPage}">&laquo; 이전</a>
    </c:if>
    <span>현재 페이지: ${currentPage}</span>
    <c:if test="${not empty nextPage}">
        <a href="options?page=${nextPage}">다음 &raquo;</a>
    </c:if>
</div>
