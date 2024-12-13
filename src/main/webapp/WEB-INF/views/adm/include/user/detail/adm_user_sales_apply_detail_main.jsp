<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
              <div class="container mt-4">
    <h1>판매자 신청</h1>
    <hr>
    
      <div style="border: 1px solid #ddd; border-radius: 5px; padding: 20px; background-color: #f8f9fa; line-height: 1.6;">
    
    <form id="sellerForm" action="adm_user_sales_apply_approve" method="post">
        <div class="mb-3">
            <label for="officeName" class="form-label">관리번호</label>
            <input type="text" class="form-control" id="agent_num" name="agent_num" value="${agent.agent_num}" placeholder="중개사무소명을 입력해 주세요.">
        </div>
        <div class="mb-3">
            <label for="officeName" class="form-label">중개사무소명</label>
            <input type="text" class="form-control" id="officeName" name="agent_office" value="${agent.agent_office}" placeholder="중개사무소명을 입력해 주세요.">
        </div>
        <div class="mb-3">
            <label for="ceoName" class="form-label">대표명</label>
            <input type="text" class="form-control" id="ceoName" name="agent_name" value="${agent.agent_name}" placeholder="대표명을 입력해 주세요.">
        </div>
        <div class="mb-3">
            <label for="registrationNumber" class="form-label">중개등록번호</label>
            <input type="text" class="form-control" id="registrationNumber" name="agent_reg_num" value="${agent.agent_reg_num}" placeholder="중개등록번호를 입력해 주세요.">
        </div>
        <div class="mb-3">
            <label for="phoneNumber" class="form-label">대표 번호</label>
            <input type="tel" class="form-control" id="phoneNumber" name="agent_tel" value="${agent.agent_tel}" placeholder="대표번호를 입력해 주세요.">
        </div>
        <div class="mb-3">
            <label for="address" class="form-label">소재지</label>
            <input type="text" class="form-control" id="address" name="agent_addr" value="${agent.agent_addr}" placeholder="소재지를 입력해 주세요.">
        </div>
        <div class="mb-3">
            <label for="fileUpload" class="form-label">첨부 (사업자등록증)</label> 
            <a href="${agent.agent_fname}">${agent.agent_fname}</a>
        </div>
        <p class="mt-3 text-muted text-end">내용 확인 후 승인</p>
        
        <!-- 숨겨진 input 필드를 추가하여 approve 값을 전달 -->
        <input type="hidden" id="approve" name="approve" value="0">
        
                    <!-- 모달 바디 -->
            <div class="modal-body">
                승인 하시겠습니까?
            </div>
            <!-- 모달 푸터 -->
            <div class="modal-footer">
            <!-- 취소 버튼 -->

        
            </div>

    </form>
                <button type="button" class="btn btn-secondary" id="rejectButton">거절</button>
            <!-- 확인 버튼: 폼 제출 -->
            <button type="button" class="btn btn-primary" id="approveButton">승인</button>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="resources/adm/js/adm_user_sales_approve.js"></script>
                