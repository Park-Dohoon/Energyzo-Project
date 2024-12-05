package com.energyzo.javaproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.energyzo.javaproject.model.vo.EstOptionVO;
import com.energyzo.javaproject.model.vo.EstPicVO;
import com.energyzo.javaproject.model.vo.EstateVO;
import com.energyzo.javaproject.model.vo.PointVO;
import com.energyzo.javaproject.model.vo.UserVO;
import com.energyzo.javaproject.model.vo.WishlistVO;
import com.energyzo.javaproject.service.MypageService;

@Controller
public class MyPageController {
	@Autowired
	private MypageService mypageService;

	@GetMapping("review.do")
	public String getUsers(Model model) {

		List<UserVO> users = mypageService.getUserList();
		model.addAttribute("users", users);

		// 시작페이지에서 컨트롤러의 리뷰.do를 호출했으니까 사용자 정보를 호출하는 것까지가 역할
		// mypages를 return해서 보여주고
		return "mypage/mypages";
	}

	//내정보로 이동하기 mypages.do
	@RequestMapping("mypages.do")
	public String mypages(Model model) {

		List<UserVO> users = mypageService.getUserList();
		model.addAttribute("users", users);
		
		return "mypage/mypages";
	}
	
	@RequestMapping("updateProfile.do")
	public String updateProfile(@ModelAttribute UserVO userVO) {
		System.out.println("UserVO: " + userVO);
		boolean isUpdated = mypageService.updateUserProfile(userVO);

		// 수정된 값으로 DB 업데이트 처리
		return "redirect:/review.do"; // 마이페이지로 리다이렉트
	}

	// 찜목록으로 이동, 이동 후 찜목록의 데이터 가지고 오기
	@RequestMapping("wishlist.do")
	public String wishlist(Model model) {

		List<WishlistVO> wishlist = mypageService.getWishlist();
		model.addAttribute("wishlist", wishlist);

		return "mypage/wishlist";
	}

	// 상품 상세페이지로 이동
	@RequestMapping("productdetail.do")
	public String produectdetail(@RequestParam("est_id") int est_id, Model model) {

		EstateVO estate = mypageService.getEstatelist(est_id); 
		model.addAttribute("estate", estate);


		EstPicVO estpic = mypageService.getEstpic(est_id); 
		model.addAttribute("estpic", estpic);

		// 서브 사진 리스트 가져오기
		List<EstPicVO> subpiclist = mypageService.getSubPicsByEstId(est_id);
		model.addAttribute("subpiclist", subpiclist);

		//옵션 가지고 오기 
		List<EstOptionVO> estOptionlist = mypageService.getEstOptionsByEstId(est_id);
		model.addAttribute("estOptionlist", estOptionlist);


		return "mypage/productdetail";
	}

	// 포인트 화면으로 이동 및 데이터 가지고 오기
	@RequestMapping("point.do")
	public String point(Model model) {

		List<PointVO> pointlist = mypageService.getPointlist();
		model.addAttribute("pointlist", pointlist);

		return "mypage/point";
	}

	// 포인트 화면으로 이동
	@RequestMapping("pointrecharge.do")
	public String pointrecharge() {
		return "mypage/pointrecharge";
	}

	//판매자 신청 화면으로 이동 1,2 
	@RequestMapping("sellerapplication.do")
	public String sellerapplication() {
		return "mypage/sellerapplication";
	}

	//비밀번호 변경 화면으로 이동 
	@RequestMapping("changepassword.do")
	public String changepassword() {
		return "mypage/changepassword";
	}

	//회원 탈퇴 화면으로 이동 
	@RequestMapping("secession.do")
	public String secession() {
		return "mypage/secession";
	}

	//회원 탈퇴 화면으로 이동 
	@RequestMapping("emailsecession.do")
	public String emailsecession() {
		return "mypage/emailsecession";
	}

	//파워링크 등급으로 이동 
	@RequestMapping("powerrating.do")
	public String powerrating() {
		return "mypage/powerrating";
	}
	
	//등록상품목록으로 이동 productmanagement
	@RequestMapping("productmanagement.do")
	public String productmanagement() {
		return "mypage/productmanagement";
	}
	
	//신규등록으로 이동 newregistration
	@RequestMapping("newregistration.do")
	public String newregistration() {
		return "mypage/newregistration";
	}

	//결제내역으로 이동paymenthistory
	@RequestMapping("paymenthistory.do")
	public String paymenthistory() {
		return "mypage/paymenthistory";
	}
	
	//두번째 포인트 결제로 이동하기 
	@RequestMapping("pointrecharge2.do")
	public String pointrecharge2() {
		return "mypage/pointrecharge2";
	}
	
	//아임포트 화면으로 이동
    @GetMapping("/pointrecharge")
    public String showPaymentPage(Model model) {
        // 아임포트의 고객사 식별 코드 추가
        model.addAttribute("impUid", "imp83235240");
        return "mypage/pointrecharge";
    }
}
