<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

			    <div class="container-fluid px-4" style="max-width:450px;">
			
			        <div style="border: 1px solid #ddd; border-radius: 5px; padding: 20px; background-color: #f8f9fa; line-height: 1.6; color: #6c757d;">
			            <p style="margin-bottom: 20px; text-align: left;">
			                안전한 비밀번호로 내 정보를 보호하세요.<br>
			                이전에 사용한 적 없는 비밀번호가 안전합니다.<br>
			                영문/숫자 조합 8자 이상으로 지정하세요.
			            </p>
			            <p>
							<form action="adm_pw_change_confirm.do" method="post">
							    <div class="mb-3">
							        <label for="currentPassword" class="form-label">현재 비밀번호</label>
							        <input type="text" class="form-control" id="currentPassword" name="currentPassword" 
							               placeholder="현재 비밀번호를 입력해주세요."
							               value="${currentPassword}"> <!-- 입력한 값을 그대로 표시 -->
							        <c:if test="${not empty message}">
							            <div class="alert alert-danger">${message}</div>
							        </c:if>
							    </div>
							    
							    
							    
					<!-- 비밀번호 -->
					<div class="mb-3">
						<label for="password">새 비밀번호 <small><영문 /숫자 10자리 이내></small></label>
						<div class="input-group">
							<input type="password" class="form-control" id="password"
								name="password" placeholder="비밀번호를 입력하세요" required
								maxlength="10" pattern="^[a-zA-Z0-9]{1,10}$"
								onblur="handleBlur()"></input>
							<div class="input-group-append">
								<span class="input-group-text" id="toggle-password"> <i
									class="bi bi-eye"></i>
								</span>
							</div>
						</div>
						<div class="invalid-feedback" style="display: none;">영문/숫자
							10자리 이내 확인해주세요</div>
					</div>

					<!-- 비밀번호 확인 -->
					<div class="mb-3">
						<label for="confirm-password">새 비밀번호 확인</label>
						<div class="input-group">
							<input type="password" class="form-control" id="confirm-password"
								name="confirm-password" placeholder="비밀번호를 확인하세요" required
								maxlength="10" pattern="^[a-zA-Z0-9]{1,10}$"
								onblur="handleBlur()"></input>
							<div class="input-group-append">
								<span class="input-group-text" id="toggle-confirm-password">
									<i class="bi bi-eye"></i>
								</span>
							</div>
						</div>
						<div class="invalid-feedback" style="display: none;"></div>
					</div>
							    
							    
							    
							
							    <div>
							        <button type="submit" class="btn btn-primary w-100 mb-2">비밀번호 변경</button>
							    </div>
							          <c:if test="${not empty successMessage}">
							            <div class="alert alert-success">${successMessage}</div>
							        </c:if>
							</form>

			        </div>
			    </div>