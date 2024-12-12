<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

						<div class="container-head">
							<div class="headmenu">
								<ul class="nav nav-tabs">
									<li class="nav-item">
										<a class="nav-link hover-box" aria-current="adm_main.do" href="adm_main_point.do?sdate=' + sdate + '&fdate=' + fdate">포인트</a>
									</li>
									<li class="nav-item">
										<a class="nav-link hover-box" href="adm_main_attend.do?sdate=' + sdate + '&fdate=' + fdate">출석체크</a>
									</li>
									<li class="nav-item">
										<a class="nav-link hover-box" href="adm_main_auct.do?sdate=' + sdate + '&fdate=' + fdate">경매</a>
									</li>
									
									<li class="nav-item">
										<a class="nav-link hover-box" href="adm_main_trade.do?sdate=' + sdate + '&fdate=' + fdate">거래</a>
									</li>
								</ul>
								
								
							</div>


							<div class="headsearch">
	
								<form
									class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
									<div class="input-group">조회 기간 :  &nbsp;
									<label for='preday'></label>
									<input class="form-control" type="date" id="preday" name="sdate" placeholder="시작일..."/> 
									<label for='today'></label>
									<input class="form-control" type="date" id="today" name="fdate" 
										aria-label="Search for end..." aria-describedby="btnNavbarSearch" />
									<button class="btn btn-primary" id="btnNavbarSearch"
											type="button">
											<i class="fas fa-search"></i>
										</button>
									</div>
								</form>
	
							</div>
						</div>