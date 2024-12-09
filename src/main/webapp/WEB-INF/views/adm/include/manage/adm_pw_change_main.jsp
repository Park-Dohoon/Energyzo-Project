<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 				<div class="container-fluid px-4 main">

			        <div style="border: 1px solid #ddd; border-radius: 5px; padding: 20px; background-color: #f8f9fa; line-height: 1.6; color: #6c757d;">
			            <p style="margin-bottom: 20px; text-align: left;">
			                안전한 비밀번호로 내 정보를 보호하세요.<br>
			                이전에 사용한 적 없는 비밀번호가 안전합니다.<br>
			                영문/숫자 조합 8자 이상으로 지정하세요.
			            </p>
			            <p>
			            <form action="submitSeller.jsp" method="post" enctype="multipart/form-data">
			                <div class="mb-3">
			                    <label for="officeName" class="form-label">현재 비밀번호</label>
			                    <input type="text" class="form-control" id="officeName" name="officeName" placeholder="현재 비밀번호를 입력해주세요.">
			                </div>
			                <div class="mb-3">
			                    <label for="ceoName" class="form-label">새 비밀번호</label>
			                    <input type="text" class="form-control" id="ceoName" name="ceoName" placeholder="새 비밀번호를 입력해주세요.">
			                </div>
			                <div class="mb-3">
			                    <label for="registrationNumber" class="form-label">새 비밀번호 확인</label>
			                    <input type="text" class="form-control" id="registrationNumber" name="registrationNumber" placeholder="새 비밀번호를 확인해주세요.">
			                </div>
			                <p>
			                <p>
			                <div>
			                    <button type="submit" class="btn btn-primary w-100 mb-2">비밀번호 변경</button>
			                </div>
			            </form>
			        </div>
			    </div>