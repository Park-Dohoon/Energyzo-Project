package com.energyzo.javaproject.controller;

import java.util.List;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.energyzo.javaproject.model.vo.*;
import com.energyzo.javaproject.service.*;

@Controller
//@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService service;

	// 로그인 페이지 이동
	@RequestMapping("login.do")
	public String login() {
		return "board/login";
	}

	// 로그인 폼 제출 후 처리하는 메서드
	@PostMapping("loginPage.do")
	public String login(@ModelAttribute UserVO uvo, HttpServletRequest request, 
									@RequestParam(required = false) String redirectUrl) {
		UserVO user = service.login(uvo);
		if(user != null) {
			// 로그인 성공 시, 세션에 사용자 정보를 저장
			HttpSession session = request.getSession();
			session.setAttribute("loggedInUser", uvo.getUser_id());  // 세션에 사용자 정보 저장

			// redirectUrl 세션에서 가져오기
			String storedRedirectUrl = (String) session.getAttribute("redirectUrl");

			if (storedRedirectUrl != null) {
				// 저장된 URL로 리다이렉트
				session.removeAttribute("redirectUrl");  // 리다이렉트 후 세션에서 redirectUrl 제거
				return "redirect:" + storedRedirectUrl;
			} else {
				// 로그인 후 게시판 목록 페이지로 이동
				return "redirect:/tabletest.do";
			}
		}
		// 로그인 실패 시 다시 로그인 페이지로 이동
		return "redirect:/login.do";  
	}

	// 게시글 목록보기
	@RequestMapping("tabletest.do")
	public String tableTest(HttpServletRequest request, Model m) {
		HttpSession session = request.getSession(false);
		String loggedInUser = (session != null) ? (String) session.getAttribute("loggedInUser") : null;

		// 로그인 상태를 model에 전달
		m.addAttribute("loggedInUser", loggedInUser);

		List<BoardVO> list = service.getBoardList();
		m.addAttribute("boardList", list);

		return "board/boardviewtest";
	}

	// 게시글 상세보기
	@RequestMapping("getBoard.do")
	public String getBoardView(BoardVO bvo, Model m, HttpSession session, HttpServletRequest request) {
		String viewedKey = "viewedPost_" + bvo.getFree_num(); 

		// 로그인 상태 확인
		String loggedInUser = (String) session.getAttribute("loggedInUser");

		if (loggedInUser == null) {
			// 로그인되지 않은 상태라면 현재 페이지 URL을 세션에 저장
			String contextPath = request.getContextPath();  // 프로젝트명
			String requestURI = request.getRequestURI();    // 전체 URL 경로
			String currentPageUrl = requestURI.replaceFirst(contextPath, "");  // 프로젝트명 제외한 경로

			if (request.getQueryString() != null) {
				currentPageUrl += "?" + request.getQueryString();  // 쿼리 파라미터 추가
			}

			// 세션에 URL 저장
			session.setAttribute("redirectUrl", currentPageUrl);
		}

		// 세션에서 해당 게시글을 본 기록이 없으면 조회수를 증가
		if (session.getAttribute(viewedKey) == null) {
			bvo.setFree_num(bvo.getFree_num());
			service.CountBoard(bvo); // 조회수 증가 메서드 호출
			session.setAttribute(viewedKey, true);  // 세션에 해당 게시글을 본 기록을 저장
			session.setAttribute("FreeNum", bvo.getFree_num());
		}

		BoardVO testbvo = service.getBoard(bvo);
		m.addAttribute("board", testbvo);

		return "board/getBoardView";
	}

	// 게시글 입력창
	@RequestMapping("insertBoard.do")
	public String insertBoard() {

		return "board/insertBoard";
	}

	// 게시글 입력
	@RequestMapping("insertBoardSave.do")
	public String insertBoardSave(@ModelAttribute BoardVO bvo, HttpSession session) {
		// 세션에 저장된 유저id가져오기
		String userId = (String)session.getAttribute("loggedInUser");

		// 게시글 작성자 처리
		if (userId != null) {
			bvo.setUser_id(userId);
		}
		service.insertBoard(bvo);

		return "redirect:/tabletest.do";
	}

	// 게시글 수정 페이지로 이동
	@RequestMapping("modifytable.do")
	public String updateBoard(BoardVO bvo, Model m) {
		BoardVO bvo2 = service.getBoard(bvo);
		m.addAttribute("board", bvo2);

		return "board/updateBoard";
	}

	// 게시글 수정
	@RequestMapping("BoardUpdate.do")
	public String updateBoard(BoardVO bvo) {
		service.updateBoard(bvo);

		return "redirect:/tabletest.do";
	}

	// 게시글 삭제
	@RequestMapping("deleteBoard.do")
	public String deleteBoard(BoardVO bvo) {
		service.deleteBoard(bvo);

		return "redirect:/tabletest.do";
	}

	// 게시글 신고
	@RequestMapping("reportBoard.do")
	public String reportBoard(@ModelAttribute ComBullVO cbvo, HttpSession session) {
		try {
			// 세션에서 유저 ID를 가져옴
			String id =  (String) session.getAttribute("loggedInUser"); 
			// UserVO에서 글번호 가져오기
			Integer fnum = (Integer)session.getAttribute("FreeNum"); 
			// 유저 ID가 세션에 있는지 확인 (추가 검증)
			if (id == null || id.isEmpty()) {
				return "redirect:/login.do";
			}

			// UserVO에 세션값 설정
			cbvo.setUser_id(id);
			cbvo.setFree_num(fnum);

			// 세션에 저장된값 확인
			System.out.println("세션에 저장된 id:" + id);
			System.out.println("세션에 저장된 게시글 번호:" + fnum);

			// 신고 처리
			service.reportBoard(cbvo);	

			// 신고된 게시글 ID를 세션에 저장
			session.setAttribute("reportedBoardId", fnum);

		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/tabletest.do";
		}
		return "redirect:/tabletest.do";
	}
}
