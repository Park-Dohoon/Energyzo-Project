package com.energyzo.javaproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.energyzo.javaproject.model.*;
import com.energyzo.javaproject.model.vo.*;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardRepository repo;
	
	// 게시글 등록
	@Override
	public void insertBoard(BoardVO bvo) {
		repo.insertBoard(bvo);
	}

	// 게시글 수정
	@Override
	public void updateBoard(BoardVO bvo) {
		repo.updateBoard(bvo);
		
	}
	
	// 게시글 삭제
	@Override
	public void deleteBoard(BoardVO bvo) {
		repo.deleteBoard(bvo);
	}

	// 조회수 증가
	public void CountBoard(BoardVO bvo) {
        repo.countBoard(bvo); // 조회수 증가
    }
	
	// 게시글 상세보기
	@Override
	public BoardVO getBoard(BoardVO bvo) {
		return repo.getBoard(bvo);
	}

	// 게시글 목록
	@Override
	public List<BoardVO> getBoardList() {
		return repo.getBoardList();
	}
	
	// 로그인
	@Override
	public UserVO login(UserVO uvo) {
		
		return repo.login(uvo);
	}

	// 게시글 신고
	@Override
	public void reportBoard(ComBullVO cbvo) {
		
	 repo.reportBoard(cbvo);
	}
}