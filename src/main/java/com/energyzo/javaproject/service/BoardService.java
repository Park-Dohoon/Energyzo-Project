package com.energyzo.javaproject.service;

import java.util.List;

import com.energyzo.javaproject.model.vo.*;

public interface BoardService {

	// 게시글 입력
	public void insertBoard(BoardVO bvo);
	
	// 게시글 수정
	public void updateBoard(BoardVO bvo);
	
	// 게시글 삭제
	public void deleteBoard(BoardVO bvo);
	
	//게시글 상세보기
	public BoardVO getBoard(BoardVO bvo);
	
	// 게시글 조회수 증가
	public void CountBoard(BoardVO bvo);
	
	// 게시글 목록보기
	public List<BoardVO> getBoardList();
	
	// 로그인
	public UserVO login(UserVO uvo);

	// 게시글 신고
	public void reportBoard(ComBullVO cbvo);
}