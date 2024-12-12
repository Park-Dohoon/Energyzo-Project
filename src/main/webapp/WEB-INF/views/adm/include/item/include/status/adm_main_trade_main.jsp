<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
						<div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        
                        <div class="row">
							<div class="col-xl-12">
								<div class="card mb-4">
								<div class="card-header">
									<div class="row-left-container">
										<div>
											<i class="fas fa-chart-area me-1"></i> 월별 현황
										</div>
									</div>
								</div>

								<div class="card-body">
								
										<c:forEach var="list" items="${itemtotal}">
											<div class="row-container">
												<div class="gauge-name2">${list.month}</div>
													<div class="card-body">
														<div class="row-container">
															<div class="gauge-proper">평균 거래가</div>
															<div class="gauge-unit"></div>
							
															<div class="gauge-container">
																<div class="gauge-fill gauge-fill3" style="width: 70%;">
																	<span class="gauge-text">${list.sale_price !=null? list.sale_price:0}</span>
																</div>
							
																<div>&nbsp;</div>
															</div>
														</div>
														<div class="row-container">
															<div class="gauge-proper">거래 건 수</div>
															<div class="gauge-unit"></div>
															<div class="gauge-container">
																<div class="gauge-fill gauge-fill4" style="width: 70%;">
																	<span class="gauge-text">${list.sale_count !=null? list.sale_count:0}</span>
																</div>
															</div>
														</div>
													</div>

											</div>
											<hr />
										</c:forEach>
										
									</div>
									
								</div>
							</div>
						</div>
						
						
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                부동산 거래 내역
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>상품번호</th>
                                            <th>거래일</th>
                                            <th>거래유형</th>
                                            <th>판매자명</th>
                                            <th>거래금액</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>상품번호</th>
                                            <th>거래일</th>
                                            <th>거래유형</th>
                                            <th>판매자명</th>
                                            <th>거래금액</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach var='list' items='${itemlist }'>
										    <tr>
										        <td>${list.est_id}</td>
										        <td>${list.est_tra_com_date}</td>
										        <td>${list.est_type}</td>
										        <td>
										            ${list.agent_name}
										        </td>
										        <td>${list.est_tra_cond}</td>
										    </tr>
										</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>