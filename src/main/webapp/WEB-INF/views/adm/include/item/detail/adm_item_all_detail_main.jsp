<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

            
            <div class="card mb-4">
                <div class="card-body">
                <form action="regist_item.do">
                    <div class="row">
                        <!-- 왼쪽: 상품 정보 -->
                        <div class="col-md-6">
                              <div class="mb-3">
								    <label for="productName" class="form-label">상품번호</label>
								    <input name='est_id' type="text" class="form-control" id="productName" placeholder="자동배정" value='${item.est_id }' readonly>
								</div>
                                <div class="mb-3">
                                    <label for="category" class="form-label">중개인번호</label>
                                    <input name='agent_num' type="text" class="form-control" id="category" value='${item.agent_num }'>
                                </div>
                                <div class="mb-3">
                                    <label for="type" class="form-label">부동산 유형</label>
                                    <br>
                                    <input type='hidden' id='est_type' value='${item.est_type }'>
                                    <select name='est_type' class="form-select">
                                    	<option value="아파트">아파트</option>
                                    	<option value="단독다가구">단독다가구</option>
                                    	<option value="연립다세대">연립다세대</option>
                                    	<option value="오피스텔">오피스텔</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="dealType" class="form-label">거래 유형</label>
                                    <input type='hidden' id='est_tra_type' value='${item.est_tra_type }'>
                                    <select name='est_tra_type' class="form-select">
                                    	<option value="매매">매매</option>
                                    	<option value="전세">전세</option>
                                    	<option value="월세">월세</option>
                                    </select>
                                </div>
          						 <div class="mb-3">
                                    <label for="dealType" class="form-label">가격(또는 보증금, 단위: 만원)</label>
                                    <input name='est_tra_cond' type="number" class="form-control" id="dealType" value='${item.est_tra_cond }' >
                                </div>
                                <div class="mb-3">
                                    <label for="realEstateInfo" class="form-label">주소 </label>
                                    
                                    <table style='width:100%'>
	                                    <tr>
	                                    	<td style='width:100%'><input name='est_addr' type="text" 
	                                    		id="sample4_jibunAddress" class="form-control" 
	                                    		value='${item.est_addr }'
	                                    		placeholder="지번주소(주소찾기로 입력)" readonly></td>
											<td><input type="button" class="btn btn-primary" onclick="sample4_execDaumPostcode()" value="주소찾기" readonly></td>
										</tr>
										
										<tr>
											<td colspan="2"><span id="guide" class="form-control" style="color:#999;display:none"></span></td>
										</tr>
										
									</table>
                                </div>
                            
                        </div>
                        <!-- 오른쪽: 이미지 및 추가 필드 -->
                        <div class="col-md-6">
                            
			                    <div class="mb-3">
								    <label for="option" class="form-label">면적(㎡)</label>
								    <input name='est_m_area' type="number" class="form-control" id="item-size" value='${item.est_m_area }'>
								</div>

                                <div class="mb-3">
                                    <label for="discountPrice" class="form-label">해당 층수(반지하는 -1로 입력)</label>
                                    <input name='est_m_floor' type="number" class="form-control" id="discountPrice" value='${item.est_m_floor}'>
                                </div>
                                <div class="mb-3">
                                    <label for="realPrice" class="form-label">건축연도</label>
                                    <input name='est_jungong' type="number" class="form-control" id="realPrice" value='${item.est_jungong }'>
                                </div>
                            
                            
                            <div>
	                            <label for="file" class="form-label">외부사진 / 내부사진 (최대 6개)</label>
	                            <!-- <img src='http://localhost:8080/javaproject/resources/static/upload/128e1517-dced-414a-8764-d9d0cf5694de.png'/>
	                            <img src='./resources/static/upload/128e1517-dced-414a-8764-d9d0cf5694de.png'/> -->
	                            <%-- [ ${item.realfname1} ] <br/> [ './resources/static/upload/${item.realfname1}' ]<br/>
	                            <img src='./resources/static/upload/${item.realfname1}'/>
	                            
	                            <hr/><hr/>
	                             --%>
	                            <div id='image-container' class="product-main-image mb-3" style="border: solid lightgray 1px; border-radius: 0.375rem; padding: 2%;">
	                            	
	                                <input type="hidden" name='file1' value='${item.realfname1 }'/>
	                                <input type="hidden" name='file2' value='${item.realfname2 }'/>
	                                <input type="hidden" name='file3' value='${item.realfname3 }'/>
	                                <input type="hidden" name='file4' value='${item.realfname4 }'/>
	                                <input type="hidden" name='file5' value='${item.realfname5 }'/>
	                                <input type="hidden" name='file6' value='${item.realfname6 }'/>
	                                
	                                <div class="bxslider" id="image-window" style="width:100%; text-align:center">
	                                
	                                	<label class="form-label">이미지 로딩중</label>
	                                
	                                </div>
	                            </div>
	                            <div class="product-images d-flex flex-row gap-3">
	                           		
	                            </div>
                            </div>
                        </div>
                    </div>
                    
                    <input id='tagArray' name='tagArray' type='hidden' value='${item.tagArray}'>
                    
                    </form>
                    <label for="btn-tag" class="form-label">태그선택</label><br>
                    <div style="border: solid lightgray 1px; border-radius: 0.375rem; padding: 2%;">
                    <span id='tagListTable'>
						<button class='btn btn-primary btn-tag' onoff='false' value='보안'		>보안		</button>
						<button class='btn btn-primary btn-tag' onoff='false' value='세탁기'		>세탁기	</button>
						<button class='btn btn-primary btn-tag' onoff='false' value='침대'		>침대		</button>
						<button class='btn btn-primary btn-tag' onoff='false' value='제습기'		>제습기	</button>
						<button class='btn btn-primary btn-tag' onoff='false' value='전자레인지'	>전자레인지</button>
						<button class='btn btn-primary btn-tag' onoff='false' value='가스레인지'	>가스레인지</button>
						<button class='btn btn-primary btn-tag' onoff='false' value='인덕션'		>인덕션	</button>
						<button class='btn btn-primary btn-tag' onoff='false' value='건조기'		>건조기	</button>
						<button class='btn btn-primary btn-tag' onoff='false' value='난방종류'		>난방종류	</button>
						<button class='btn btn-primary btn-tag' onoff='false' value='책상'		>책상		</button>
						<button class='btn btn-primary btn-tag' onoff='false' value='냉장고'		>냉장고	</button>
						<button class='btn btn-primary btn-tag' onoff='false' value='신발장'		>신발장	</button>
						<button class='btn btn-primary btn-tag' onoff='false' value='싱크대'		>싱크대	</button>
						<button class='btn btn-primary btn-tag' onoff='false' value='옷장'		>옷장		</button>
					</span>
                    </div>
                    
                    <!-- 버튼 섹션 -->
                    <div class="btn-section">
                        <button id="btn_regist" class="btn btn-primary">수정</button>
                        <button id="btn_cancel" class="btn btn-primary">등록취소</button>
                    </div>
                    
                </div>
            </div>