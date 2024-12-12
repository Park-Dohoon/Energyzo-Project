<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                팝업목록
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>관리번호</th>
                                            <th>제목</th>
                                            <th>파일명</th>
                                            <th>등록일자</th>
                                            <th>활성상태</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>관리번호</th>
                                            <th>제목</th>
                                            <th>파일명</th>
                                            <th>등록일자</th>
                                            <th>활성상태</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
										<c:forEach var='list' items='${listallPop }'>
										    <tr>
										        <td>${list.pop_num}</td>
										        <td>${list.pop_title}</td>
										        <td>${list.pop_fname}</td>
										        <td>${list.pop_start_date}</td>
										        <td>${list.pop_status}</td>
										    </tr>
										</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>