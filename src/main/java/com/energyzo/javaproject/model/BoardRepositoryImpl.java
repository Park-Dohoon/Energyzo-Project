package com.energyzo.javaproject.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Repository;

import com.energyzo.javaproject.model.vo.*;

@Repository
public class BoardRepositoryImpl implements BoardRepository{

	@Autowired
	private SqlSessionTemplate session;
	
	// 게시글 입력(등록)
	@Override
	public void insertBoard(BoardVO bvo) {
		session.insert("BoardMapper.insertBoard", bvo);
	}

	// 게시글 수정
	@Override
	public void updateBoard(BoardVO bvo) {
		session.update("BoardMapper.updateBoard", bvo);
	}

	// 게시글 삭제
	@Override
	public void deleteBoard(BoardVO bvo) {
		session.delete("BoardMapper.deleteBoard", bvo);
	}

	// 게시글 상세보기
	@Override
	public BoardVO getBoard(BoardVO bvo) {
		BoardVO testvo = session.selectOne("BoardMapper.getBoard", bvo);
		
		return testvo;
	}
	
	// 조회수 증가
	@Override
	public void CountBoard(BoardVO bvo) {
		session.update("BoardMapper.getBoardCount", bvo);
	}
	
	// 게시글 목록보기
	@Override
	public List<BoardVO> getBoardList() {
		List<BoardVO> list = session.selectList("BoardMapper.getBoardList");
		return list;
	}

	// 게시글 신고
	@Override
	public void reportBoard(ComBullVO cbvo) {
		session.insert("BoardMapper.reportBoard", cbvo);
	}	
}