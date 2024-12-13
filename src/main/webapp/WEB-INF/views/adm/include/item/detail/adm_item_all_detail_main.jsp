<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

			<div class="row">
				<div class="col-xl-6">
					<div class="card mb-4">
					</div>
				</div>
			</div>

			
			
			
        <div class="container-fluid px-4">

            <div class="card md-4">
                <div class="card-body">
                    <div class="row">
                        <!-- 왼쪽: 상품 정보 -->
                        <div class="col-md-6">
                            <form>
                              <div >
								    <label for="productName" class="form-label">상품번호</label>
								    <input type="text" class="form-control" id="productName" value="${item.est_id}" readonly>
								</div>
                                <div class="md-3">
                                    <label for="category" class="form-label">중개인번호</label>
                                    <input type="text" class="form-control" id="category" value="${item.agent_num}" readonly>
                                </div>
                                <div class="md-3">
                                    <label for="registrationDate" class="form-label">등록일</label>
                                    <input type="text" class="form-control" id="registrationDate" value="${item.est_reg_date}" readonly>
                                </div>
                                 <div class="md-3">
                                    <label for="registrationDate" class="form-label">거래완료일</label>
                                    <input type="text" class="form-control" id="traDate" value="${item.est_tra_com_date}" readonly>
                                </div>
                                <div class="md-3">
                                    <label for="type" class="form-label">부동산 유형</label>
                                    <input type="text" class="form-control" id="type"  value="${item.est_type}" readonly>
                                </div>
                                <div class="md-3">
                                    <label for="dealType" class="form-label">거래 유형</label>
                                    <input type="text" class="form-control" id="dealType" value="${item.est_tra_type}" readonly>
                                </div>
          						 <div class="md-3">
                                    <label for="dealType" class="form-label">용도</label>
                                    <input type="text" class="form-control" id="dealType" value="${item.est_usage}" readonly>
                                </div>
      
                                <div class="md-3">
                                    <label for="office" class="form-label">관리비</label>
                                    <input type="text" class="form-control" id="office"  value="${item.est_manage}" readonly>
                                </div>
                                <div class="md-3">
                                    <label for="realEstateInfo" class="form-label">주소</label>
                                    <input type="text" class="form-control" id="office"  value="${item.est_addr}" readonly>
                                </div>
                            
                            </form>
                        </div>
                        <!-- 오른쪽: 이미지 및 추가 필드 -->
                        <div class="col-md-6">
                            <h5>외부사진 / 내부사진</h5>
                            <div class="product-main-image md-3">
                                 <img src="resources/static/upload/${itempic[0].realfname}" alt="상품 이미지">
                            </div>
                            <div class="product-images d-flex flex-row gap-3">
                           <c:forEach var="subPic" items="${subpiclist}">
						        <img src="${subPic.realfname}" alt="썸네일 이미지">
						    </c:forEach>
                            </div>
							<div class="d-flex justify-content-end">
							    <label for="declaration" class="form-label2">신고수 0회</label>
							</div>
                            
                            <p>
                            <form>
			                    <div class="md-3">
								    <label for="option" class="form-label">옵션</label>
								    <input type="text" class="form-control" id="option" 
								           value="<c:forEach var='option' items='${estOptionlist}'> ${option.est_opt_name} <c:if test='${!empty option.est_opt_name}'> </c:if> </c:forEach>" readonly>
								</div>

                                <div class="md-3">
                                    <label for="discountPrice" class="form-label">방수</label>
                                    <input type="text" class="form-control" id="discountPrice" value="${item.est_room_num}" readonly>
                                </div>
                                <div class="md-3">
                                    <label for="realPrice" class="form-label">욕실수</label>
                                    <input type="text" class="form-control" id="realPrice" value="${item.est_bath_num}" readonly>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- 버튼 섹션 -->
                    <div class="btn-section">
                   <!--      <button class="btn btn-danger">삭제</button> -->
                        <button class="btn btn-primary">저장</button>
                    </div>
                </div>
            </div>
        </div>