<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
							<div class="headsearch">
	
								<form action="adm_main_point.do" method="GET" id="searchForm"
									class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
									<div class="input-group">조회 기간 :  &nbsp;
									<label for='preday'></label>
									<input class="form-control" type="date" id="preday" name="sdate"/> 
									<label for='today'></label>
									<input class="form-control" type="date" id="today" name="fdate"
										aria-label="Search for end..." aria-describedby="btnNavbarSearch" />
									<button class="btn btn-primary" id="btnNavbarSearch"
											type="submit">
											<i class="fas fa-search"></i>
										</button>
									</div>
								</form>
	
							</div>