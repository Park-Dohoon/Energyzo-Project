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
											<i class="fas fa-chart-area me-1"></i> 미회수 총액 :&nbsp;<i>12,568</i>&nbsp;P
										</div>
									</div>
								</div>

								<div class="card-body">
										<div class="row-container">
											<div class="gauge-name">출석체크</div>
											<div class="gauge-proper">12,568</div>
											<div class="gauge-unit">P</div>
											
											<div class="gauge-container" id='gauge1'>
												<div class="gauge-fill" style="width: 70%;">
													<span class="gauge-text">30%</span>
												</div>
											</div>
										</div>
										<hr />
										<div class="row-container">
											<div class="gauge-name">판매</div>
											<div class="gauge-proper">12,568</div>
											<div class="gauge-unit">P</div>
											
											<div class="gauge-container" id='gauge2'>
												<div class="gauge-fill" style="width: 70%;">
													<span class="gauge-text">90%</span>
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
                                        총 지급액 :&nbsp;<i>12,568</i>&nbsp;P
                                    </div>
                                    <div class="card-body">
                                    
		                                    <div class="row-container">                                
		                                    <div class="gauge-name">출석이벤트
		                                    </div>	                                    
		                                    <div class="gauge-proper">&nbsp;1
		                                    </div>	                                    
		                                    <div class="gauge-unit">P
		                                    </div>
		                                    </div> 
                                    
											<hr />
										
		                                    <div class="row-container">                                
		                                    <div class="gauge-name">판매
		                                    </div>	                                    
		                                    <div class="gauge-proper">&nbsp;1
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
                                        총 회수액 :&nbsp;<i>12,568</i>&nbsp;P
                                    </div>
                                    <div class="card-body">
	                                    
		                                    <div class="row-container">                                
		                                    <div class="gauge-name">경매 이벤트
		                                    </div>	                                    
		                                    <div class="gauge-proper">&nbsp;1
		                                    </div>	                                    
		                                    <div class="gauge-unit">P
		                                    </div>
		                                    </div>
                                    
											<hr />
		                                    
		                                    <div class="row-container">                                
		                                    <div class="gauge-name">파워링크 구매
		                                    </div>	                                    
		                                    <div class="gauge-proper">&nbsp;1
		                                    </div>	                                    
		                                    <div class="gauge-unit">P
		                                    </div>
		                                    </div>
                                    
											<hr />
		                                    
		                                    <div class="row-container">                                
		                                    <div class="gauge-name">소멸
		                                    </div>	                                    
		                                    <div class="gauge-proper">&nbsp;1
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
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>포인트관리번호</th>
                                            <th>아이디</th>
                                            <th>포인트수량</th>
                                            <th>출처(내역)</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td>Tiger Nixon</td>
                                            <td>System Architect</td>
                                            <td>Edinburgh</td>
                                            <td>61</td>
                                        </tr>
                                        <c:forEach var='pointlist' items='${listallPoint }'>
										    <tr>
										        <td>${pointlist.user_id}</td>
										        <td>${pointlist.name}</td>
										        <td>${pointlist.nick_name}</td>
										        <td>
										            ${pointlist.birth != null ? userlist.birth : '1900-01-01'}
										        </td>
										        <td>${pointlist.mobile}</td>
										    </tr>
										</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>