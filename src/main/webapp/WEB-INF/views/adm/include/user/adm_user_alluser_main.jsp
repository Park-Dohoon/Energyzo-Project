<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                전체회원
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>별명</th>
                                            <th>생일</th>
                                            <th>연락처</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>별명</th>
                                            <th>생일</th>
                                            <th>연락처</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
										<c:forEach var='userlist' items='${listallUser }'>
										    <tr>
										        <td>${userlist.user_id}</td>
										        <td>${userlist.name}</td>
										        <td>${userlist.nick_name}</td>
										        <td>
										            ${userlist.birth != null ? userlist.birth : '1900-01-01'}
										        </td>
										        <td>${userlist.mobile}</td>
										    </tr>
										</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>