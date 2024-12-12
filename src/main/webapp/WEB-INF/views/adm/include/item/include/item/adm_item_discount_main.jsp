<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                할인가 신청
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>요청번호</th>
                                            <th>상품번호</th>
                                            <th>할인항목</th>
                                            <th>할인 후 금액</th>
                                            <th>요청일시</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>요청번호</th>
                                            <th>상품번호</th>
                                            <th>할인항목</th>
                                            <th>할인 후 금액</th>
                                            <th>요청일시</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
										<c:forEach var='list' items='${listdiscountItems }'>
										    <tr>
										        <td>${list.dis_num}</td>
										        <td>${list.est_id}</td>
										        <td>${list.rapid_item}</td>
										        <td>${list.dis_price}</td>
										        <td>${list.dis_date}</td>
										    </tr>
										</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>