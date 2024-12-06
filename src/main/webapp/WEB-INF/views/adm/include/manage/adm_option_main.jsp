<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                옵션목록
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>옵션번호</th>
                                            <th>옵션명</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>옵션번호</th>
                                            <th>옵션명</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
										<c:forEach var='list' items='${listalloption }'>
										    <tr>
										        <td>${list.est_opt_num}</td>
										        <td>${list.est_opt_name}</td>
										    </tr>
										</c:forEach>
                                    </tbody>
                                </table>
                                
                            </div>
                        </div>
                        <button class="btn btn-primary">옵션 추가</button>