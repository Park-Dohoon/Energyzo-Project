package com.energyzo.javaproject.dao;

import java.util.List;

import com.energyzo.javaproject.model.vo.Adm_ManageVO;

public interface Adm_ManageDao {

	public List<Adm_ManageVO> listPopupAll(Adm_ManageVO vo);
	
    // 페이징 처리된 옵션 목록 조회
    List<Adm_ManageVO> paging(int startRow, int pageSize);

    // 전체 옵션 개수 조회
    int countOptions();

    // 옵션 추가
    void insertOption(String estOptName);

    // 옵션 삭제
    void deleteOption(int estOptNum);


	
}
