<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                경매설정
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>상품등록번호</th>
                                            <th>판매자명</th>
                                            <th>보증금</th>
                                            <th>월세</th>
                                            <th>관리비</th>
                                            <th>등록일</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>상품등록번호</th>
                                            <th>판매자명</th>
                                            <th>보증금</th>
                                            <th>월세</th>
                                            <th>관리비</th>
                                            <th>등록일</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
										<c:forEach var='list' items='${listallItems }'>
										    <tr>
										        <td>${list.est_id}</td>
										        <td>${list.agent_name}</td>
										        <td>${list.est_tra_cond}</td>
										        <td>${list.est_monthpay}</td>
										        <td>${list.est_manage}</td>
										        <td>${list.est_reg_date}</td>
										    </tr>
										</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>