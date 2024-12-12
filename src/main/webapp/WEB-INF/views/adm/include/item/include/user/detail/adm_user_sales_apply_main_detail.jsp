<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

              <div class="container mt-4">
    <h1>판매자 신청</h1>
    <hr>
    
      <div style="border: 1px solid #ddd; border-radius: 5px; padding: 20px; background-color: #f8f9fa; line-height: 1.6;">
    
    <form id="sellerForm" action="sellerapplication2.do" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="officeName" class="form-label">중개사무소명</label>
            <input type="text" class="form-control" id="officeName" name="agent_office" placeholder="중개사무소명을 입력해 주세요.">
        </div>
        <div class="mb-3">
            <label for="ceoName" class="form-label">대표명</label>
            <input type="text" class="form-control" id="ceoName" name="agent_name" placeholder="대표명을 입력해 주세요.">
        </div>
        <div class="mb-3">
            <label for="registrationNumber" class="form-label">중개등록번호</label>
            <input type="text" class="form-control" id="registrationNumber" name="agent_reg_num" placeholder="중개등록번호를 입력해 주세요.">
        </div>
        <div class="mb-3">
            <label for="phoneNumber" class="form-label">대표 번호</label>
            <input type="tel" class="form-control" id="phoneNumber" name="agent_tel" placeholder="대표번호를 입력해 주세요.">
        </div>
        <div class="mb-3">
            <label for="address" class="form-label">소재지</label>
            <input type="text" class="form-control" id="address" name="agent_addr" placeholder="소재지를 입력해 주세요.">
        </div>
        <div class="mb-3">
            <label for="fileUpload" class="form-label">첨부 (사업자등록증)</label> 
            <input type="file" class="form-control" id="fileUpload" name="file">
        </div>
        <p class="mt-3 text-muted text-end">자격심사 후 판매자를 선정해 드립니다. 승인까지 1~2주 소요될 수 있습니다.</p>

        <!-- 모달을 띄우는 버튼 -->
		<div class="d-flex justify-content-end">
		    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#unregisterModal">
		        판매자 신청
		    </button>
		</div>

    </form>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="unregisterModal" tabindex="-1" aria-labelledby="unregisterModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 모달 헤더 -->
            <div class="modal-header">
                <h5 class="modal-title" id="unregisterModalLabel">판매자 신청 확인</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <!-- 모달 바디 -->
            <div class="modal-body">
                신청을 완료하시겠습니까?
            </div>
            <!-- 모달 푸터 -->
            <div class="modal-footer">
                <!-- 취소 버튼 -->
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <!-- 확인 버튼: 폼 제출 -->
                <button type="submit" class="btn btn-primary" form="sellerForm">확인</button>
            </div>
        </div>
    </div>
</div>
                