<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                신고상품
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>상품번호</th>
                                            <th>판매자명</th>
                                            <th>신고횟수</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>상품번호</th>
                                            <th>판매자명</th>
                                            <th>신고횟수</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
										<c:forEach var='list' items='${listaccuseItem }'>
										    <tr>
										        <td>${list.est_id}</td>
										        <td>${list.agent_name}</td>
										        <td>${list.accuse_count}</td>
										    </tr>
										</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>