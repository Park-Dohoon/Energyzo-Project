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
											<i class="fas fa-chart-area me-1"></i> 미회수 총액 :&nbsp;<i>${pointslist[0].remain_point}</i>&nbsp;P
										</div>
									</div>
								</div>

								<div class="card-body">
										<div class="row-container">
											<div class="gauge-name">출석체크</div>
											<div class="gauge-proper">${pointslist[0].attend_point}</div>
											<div class="gauge-unit">P</div>
											
											<div class="gauge-container" id='gauge1'>
												<div class="gauge-fill" style="width: 60%;">
													<span class="gauge-text">30%</span>
												</div>
											</div>
										</div>
										<hr />
										<div class="row-container">
											<div class="gauge-name">판매율(충전×100/(출석+충전))</div>
											<div class="gauge-proper">${pointslist[0].recharge_point !=null? pointslist[0].recharge_point:0}</div>
											<div class="gauge-unit">P</div>
											
											<div class="gauge-container" id='gauge2'>
												<div class="gauge-fill" style="width: 70%;">
													<span class="gauge-text">${pointslist[0].sales_rate !=null? pointslist[0].sales_rate:0}%</span>
												</div>
											</div>
										</div>
									</div>
									
								</div>
							</div>
						</div>

						<div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        총 지급액 :&nbsp;<i>${pointslist[0].point_deposit}</i>&nbsp;P
                                    </div>
                                    <div class="card-body">
                                    
		                                    <div class="row-container">                                
		                                    <div class="gauge-name">출석이벤트
		                                    </div>	                                    
		                                    <div class="gauge-proper">&nbsp;${pointslist[0].attend_point}
		                                    </div>	                                    
		                                    <div class="gauge-unit">P
		                                    </div>
		                                    </div> 
                                    
											<hr />
										
		                                    <div class="row-container">                                
		                                    <div class="gauge-name">판매
		                                    </div>	                                    
		                                    <div class="gauge-proper">&nbsp;${pointslist[0].recharge_point}
		                                    </div>	                                    
		                                    <div class="gauge-unit">P
		                                    </div>
		                                    </div> 
		                                    	                                    
		                                    <hr />
										
		                                    <div class="row-container">                                
		                                    <div class="gauge-proper">&nbsp;
		                                    </div>	                                    
		                                    <div class="gauge-proper">&nbsp;
		                                    </div>	                                    
		                                    <div class="gauge-unit">&nbsp;
		                                    </div>
		                                    </div>             
                                    
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        총 회수액 :&nbsp;<i>${pointslist[0].point_withdraw}</i>&nbsp;P
                                    </div>
                                    <div class="card-body">
	                                    
		                                    <div class="row-container">                                
		                                    <div class="gauge-name">경매 이벤트
		                                    </div>	                                    
		                                    <div class="gauge-proper">&nbsp;${pointslist[0].auct_point}
		                                    </div>	                                    
		                                    <div class="gauge-unit">P
		                                    </div>
		                                    </div>
                                    
											<hr />
		                                    
		                                    <div class="row-container">                                
		                                    <div class="gauge-name">파워링크 구매
		                                    </div>	                                    
		                                    <div class="gauge-proper">&nbsp;${pointslist[0].pay_point}
		                                    </div>	                                    
		                                    <div class="gauge-unit">P
		                                    </div>
		                                    </div>
                                    
											<hr />
		                                    
		                                    <div class="row-container">                                
		                                    <div class="gauge-name">소멸
		                                    </div>	                                    
		                                    <div class="gauge-proper">&nbsp;${pointslist[0].expired_point}
		                                    </div>	                                    
		                                    <div class="gauge-unit">P
		                                    </div>
		                                    </div>
	                                    
	                                </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                포인트 거래 내역
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>포인트관리번호</th>
                                            <th>아이디</th>
                                            <th>포인트수량</th>
                                            <th>출처(내역)</th>
                                            <th>발생일자</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>포인트관리번호</th>
                                            <th>아이디</th>
                                            <th>포인트수량</th>
                                            <th>출처(내역)</th>
                                            <th>발생일자</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach var='list' items='${pointlistall }'>
										    <tr>
										        <td>${list.point_num}</td>
										        <td>${list.user_id}</td>
										        <td>${list.point_pt}</td>
										        <td>
										            ${list.point_source}
										        </td>
										        <td>${list.point_date}</td>
										    </tr>
										</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>