<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                판매자 신청
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>관리번호</th>
                                            <th>중개사무소명</th>
                                            <th>대표명</th>
                                            <th>중개등록번호</th>
                                            <th>대표번호</th>
                                            <th>등록상태</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>관리번호</th>
                                            <th>중개사무소명</th>
                                            <th>대표명</th>
                                            <th>중개등록번호</th>
                                            <th>대표번호</th>
                                            <th>등록상태</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
										<c:forEach var='list' items='${listsalesapply }'>
										    <tr>
										        <td>${list.agent_num}</td>
										        <td>${list.agent_office}</td>
										        <td>${list.agent_name}</td>
										        <td>${list.agent_reg_num}</td>
										        <td>
										            ${list.agent_tel}
										        </td>
										        <td>
											        ${list.agent_reg_state == 1 ? "정상" : 
												      list.agent_reg_state == 2 ? "승인 대기" : 
												      list.agent_reg_state == 3 ? "해촉" : list.agent_state}
										      	</td>
										    </tr>
										</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>