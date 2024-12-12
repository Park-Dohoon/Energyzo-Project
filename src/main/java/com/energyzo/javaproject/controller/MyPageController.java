package com.energyzo.javaproject.controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;  // JSON 결과 처리
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.energyzo.javaproject.model.vo.AgentVO;
import com.energyzo.javaproject.model.vo.EstOptionVO;
import com.energyzo.javaproject.model.vo.EstPicVO;
import com.energyzo.javaproject.model.vo.EstateVO;
import com.energyzo.javaproject.model.vo.PointVO;
import com.energyzo.javaproject.model.vo.UserVO;
import com.energyzo.javaproject.model.vo.WishlistVO;
import com.energyzo.javaproject.service.MypageService;

import net.nurigo.java_sdk.api.Message;  // Message 클래스 사용
import net.nurigo.java_sdk.exceptions.CoolsmsException;  // Coolsms 예외 처리


@Controller
public class MyPageController {
	

	
	@Autowired
	private MypageService mypageService;

	//마이페이지 프로필 변경에 user 정보 가지고 오기 
	@GetMapping("review.do")
	public String getUsers(Model model, HttpSession session ) {

		//String user_id = "psbbsp303"; 
	    String user_id = (String) session.getAttribute("showNewLoginPage");
		System.out.println("확인!!!!!!!!!!!!!!!!!!!!"+ user_id);


		UserVO users = mypageService.getUser(user_id);
		model.addAttribute("users", users);
			

	/*	System.out.println("password" + users.getPassword());
		System.out.println("name" + users.getName());*/
		// 시작페이지에서 컨트롤러의 리뷰.do를 호출했으니까 사용자 정보를 호출하는 것까지가 역할
		// mypages를 return해서 보여주고
		return "mypage/mypages";
	}
	
	
	//다른 탭에서 내 정보로 이동
	@GetMapping("mypages.do")
	public String getUsers2(Model model, HttpSession session ) {
	    String user_id = (String) session.getAttribute("showNewLoginPage");
	    UserVO users = mypageService.getUser(user_id);
	    model.addAttribute("users", users);
	    return "mypage/mypages"; // mypages.jsp로 돌아가도록 설정
	}


	//다른 탭에서 판매자 정보 이동
	@GetMapping("seller.do")
	public String seller2(Model model, HttpSession session ) {

	    String user_id = (String) session.getAttribute("showNewLoginPage");

        AgentVO agent = mypageService.getAgent(user_id);
        model.addAttribute("agent", agent);

		
		return "mypage/seller";
	}
	
	
	//판매자 정보 가지고 오기 
	@GetMapping("review2.do")
	public String seller(Model model, HttpSession session ) {

	    String user_id = (String) session.getAttribute("showNewLoginPage");

        AgentVO agent = mypageService.getAgent(user_id);
        model.addAttribute("agent", agent);

		
		return "mypage/seller";
	}

	
	@Controller
	public class RefundMessageController {
	    @RequestMapping(value = "sendSms.do", method = RequestMethod.POST)
	    @ResponseBody  // AJAX 요청에 응답을 JSON 형식으로 반환
	    public String sendSms(HttpServletRequest request) throws Exception {

	        // 발급받은 API 키와 시크릿
	        String api_key = "NCSEVRFZLXOWHXTT";
	        String api_secret = "IEHDVCAFZ63VDCB1THY410CGNBWSTDIB";

	        // Message 객체 생성
	        Message coolsms = new Message(api_key, api_secret);

	        // 랜덤 인증코드 생성 (6자리 숫자)
	        int authCode = (int) (Math.random() * 1000000);
	        String formattedAuthCode = String.format("%06d", authCode);
	        
	        // 세션에 인증번호 저장
	        HttpSession session = request.getSession();
	        session.setAttribute("authCode", formattedAuthCode);
	        
	        // 문자 전송 데이터 설정
	        HashMap<String, String> set = new HashMap<String, String>();
	        set.put("to", request.getParameter("to"));  // 수신번호
	        set.put("from", "01065081115");  // 인증된 발신번호
	        set.put("text", "인증코드는 " + formattedAuthCode + " 입니다.");
	        set.put("type", "sms");  // 문자 타입

	        try {
	            // 문자 전송 및 결과 받기
	            JSONObject result = coolsms.send(set);
	            System.out.println("전송 결과: " + result.toString());
	            return "인증번호 전송 완료";  // 성공 메시지 반환
	        } catch (CoolsmsException e) {
	            System.out.println("에러 메시지: " + e.getMessage());
	            System.out.println("에러 코드: " + e.getCode());
	            return "인증번호 전송 실패";  // 실패 메시지 반환
	        }
	    }
	}


	
	@RequestMapping("verifyAuthCode.do")
	public String verifyAuthCode(HttpServletRequest request, @RequestParam("authCode") String userInputCode,  Model model) {
	    // 세션에서 저장된 인증코드를 가져옴
	    System.out.println("verifyAuthCode.do 요청 처리 중...");
	    System.out.println("입력된 인증 코드: " + userInputCode);
		
		HttpSession session = request.getSession();
	    String correctAuthCode = (String) session.getAttribute("authCode");
	    System.out.println("세션에 저장된 인증 코드: " + correctAuthCode);

	    // 인증 결과 메시지 설정
	    String resultMessage;
	    
	    // 사용자가 입력한 인증코드와 비교
	    if (correctAuthCode != null && correctAuthCode.equals(userInputCode)) {
	    	 resultMessage = "인증 성공";
	    	 model.addAttribute("resultMessage", resultMessage);

	    	 return "mypage/phonesecession";
	    } else {
	        // 인증 실패
	        return "인증 실패: 잘못된 인증코드";
	    }
	    
	    
	}

	
	//내정보로 이동하기 mypages.do
	@RequestMapping("mypages.do")
	public String mypages(Model model) {

		List<UserVO> users = mypageService.getUserList();
		model.addAttribute("users", users);
		
		return "mypage/mypages";
	}
	
	
	//마이페이지 업데이트
	@RequestMapping("updateProfile.do")
	public String updateProfile(@ModelAttribute UserVO userVO) {
		System.out.println("UserVO: " + userVO);
		boolean isUpdated = mypageService.updateUserProfile(userVO);

		// 수정된 값으로 DB 업데이트 처리
		return "redirect:/review.do"; // 마이페이지로 리다이렉트
	}

	// 찜목록으로 이동, 이동 후 찜목록의 데이터 가지고 오기
//	@RequestMapping("wishlist.do")
//	public String wishlist(Model model) {
//
//		List<WishlistVO> wishlist = mypageService.getWishlist();
//		model.addAttribute("wishlist", wishlist);
//
//		return "mypage/wishlist";
//	}

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
	public String point(Model model, HttpSession session) {
	    String user_id = (String) session.getAttribute("showNewLoginPage");
		System.out.println(user_id);

		
		List<PointVO> pointlist = mypageService.getPointlist(user_id);
		model.addAttribute("pointlist", pointlist);

		return "mypage/point";
	}

	// 포인트 화면으로 이동
	@RequestMapping("pointrecharge.do")
	public String pointrecharge() {
		return "mypage/pointrecharge";
	}

//	//판매자 신청 화면으로 이동 1,2 
//	@RequestMapping("sellerapplication.do")
//	public String sellerapplication(HttpSession session) {
//		
//	    String user_id = (String) session.getAttribute("showNewLoginPage");
//	    System.out.println("서연 2차 확인"+user_id);
//
//	 // DB에서 user_id로 판매자 신청 여부 확인
//        AgentVO agent = mypageService.getAgent(user_id);
//        System.out.println("agent가지고 온 값:" + agent.toString());
//        String dbUser_id = agent.getUser_id();
//        System.out.println("가지고온 아이값:!!!!!!" + dbUser_id);
//        
//	    if (user_id.equals(dbUser_id)) {
//	        
//	    	System.out.println("아이디가 같다!");
//	    	// 이미 판매자 신청을 했다면 sellerapplication2로 리다이렉트
//	        return "mypage/sellerapplication2";
//	    } else {
//	        // 판매자 신청 화면으로 이동
//	        return "mypage/sellerapplication";
//	    }
//	    
//		//return "mypage/sellerapplication";
//	}

//	
//	@RequestMapping("sellerapplication2.do")
//	public String sellerapplication2(@ModelAttribute AgentVO agentVO, HttpSession session) {
//	    // agentVO 객체에 값 설정
//	    String user_id = (String) session.getAttribute("showNewLoginPage");
//		
//	    agentVO.setUser_id(user_id); //나중에 로그인 세션에서 가지고 와서 넣어줘야 함. 
//	    agentVO.setAgent_reg_state(1); //고정으로 넣어줌 
//	    
//
//	    // mypageService에 저장
//	    mypageService.saveAgent(agentVO);
//	    
//	    return "mypage/sellerapplication2";
//	}

	@RequestMapping("sellerapplication.do")
	public String sellerapplication(HttpSession session) {
	    String user_id = (String) session.getAttribute("showNewLoginPage");
	    System.out.println("서연 2차 확인: " + user_id);

	    AgentVO agent = mypageService.getAgent(user_id);

	    if (agent == null) {
	        // user_id가 없으면 판매자 신청이 안 된 상태이므로, 판매자 신청 화면으로 이동
	        return "mypage/sellerapplication";
	    } else {
	        // 이미 user_id가 존재하면 판매자 신청을 이미 했다면 sellerapplication2로 리다이렉트
	        return "mypage/sellerapplication2";
	    }
	}

	@RequestMapping("sellerapplication2.do")
	public String sellerapplication2(@ModelAttribute AgentVO agentVO, HttpSession session) {
	    // agentVO 객체에 값 설정
	    String user_id = (String) session.getAttribute("showNewLoginPage");
	    
	    if (user_id == null) {
	        return "redirect:/loginPage"; 
	    }

	    agentVO.setUser_id(user_id); 
	    agentVO.setAgent_reg_state(1); 

	    mypageService.saveAgent(agentVO);

	    return "mypage/sellerapplication2";
	}

	
	

	//비밀번호 변경 화면으로 이동 (get), post get 같이 하려고 했으나 같은 화면이기 때문에 에러 발생
	@RequestMapping("changepassword.do")
	public String changepassword() {   
		return "mypage/changepassword";
	}

	
	@PostMapping("/changepassword.do")
	public String changePassword(
	    @RequestParam("currentPassword") String currentPassword,
	    @RequestParam("newPassword") String newPassword,
	    @RequestParam("registrationNumber") String registrationNumber,
	    HttpSession session,
	    Model model) {

	    String user_id = (String) session.getAttribute("showNewLoginPage");

		
		UserVO user = mypageService.getUser(user_id);
		System.out.println("User password: " + user.getPassword());
		System.out.println(currentPassword);
			
		  // 공백 체크 및 입력값 검증
	    if (currentPassword == null || currentPassword.trim().isEmpty() ) {
	        model.addAttribute("message", "현재 비밀번호가 공백입니다.");
	        return "mypage/changepassword"; // 에러 발생 시 다시 페이지를 반환
	    }else if(newPassword == null || newPassword.trim().isEmpty()) {
	    	 model.addAttribute("message1", "새 비밀번호가 공백입니다.");
		        return "mypage/changepassword";
	    
	    }else if (registrationNumber == null || registrationNumber.trim().isEmpty()) {
	    	
	   	 model.addAttribute("message1", "새 비밀번호 확인이 공백입니다.");
	        return "mypage/changepassword";
	    	
	    	
	    } else if (!currentPassword.equals(user.getPassword())) {
	        model.addAttribute("message", "현재 비밀번호가 올바르지 않습니다.");
	        return "mypage/changepassword"; // 에러 발생 시 다시 페이지를 반환
	    }else if (!newPassword.equals(registrationNumber)) {
	        model.addAttribute("message1", "새 비밀번호가 일치하지 않습니다.");
	        return "mypage/changepassword"; // 에러 발생 시 다시 페이지를 반환
	    }else {


		    // 비밀번호 변경
		    mypageService.updatePassword(user.getUser_id(), newPassword);
		    model.addAttribute("successMessage", "비밀번호가 성공적으로 변경되었습니다.");
		    
	    }

	    // 사용자가 입력한 값을 모델에 추가하여 JSP에서 유지하도록 함
	    model.addAttribute("currentPassword", currentPassword);
	    model.addAttribute("newPassword", newPassword);
	    model.addAttribute("registrationNumber", registrationNumber);

	    return "mypage/changepassword";
	}


	//회원 탈퇴 화면으로 이동 
	@RequestMapping("secession.do")
	public String secession() {
		return "mypage/secession";
	}

	//회원 탈퇴 화면으로 이동 - 이메일 
	@RequestMapping("emailsecession.do")
	public String emailsecession() {
		return "mypage/emailsecession";
	}
	
	//회원 탈퇴 화면으로 이동 - 휴대폰번호
	@RequestMapping("phonesecession.do")
	public String phonesecession() {
		return "mypage/phonesecession";
	}
	
	
	//등록상품목록으로 이동
	@RequestMapping("productmanagement.do")
	public String productmanagement(Model model, HttpSession session) {
				
		 String user_id = (String) session.getAttribute("showNewLoginPage");
		
		List<EstateVO> estate = mypageService.getEstate(user_id);
		model.addAttribute("estate", estate);
		
		return "mypage/productmanagement";
	}
	
	//신규등록으로 이동 seller_productinsert
//	@RequestMapping("seller_productinsert.do")
//	public String newregistration() {
//		return "mypage/seller_productinsert";
//	}

	//결제내역으로 이동paymenthistory!!!!!!!!!!!!!!!!!!!!!!!!!
	@RequestMapping("paymenthistory.do")
	public String paymenthistory(Model model, HttpSession session) {
		
		 String user_id = (String) session.getAttribute("showNewLoginPage");
		
		List<PointVO> paymentList = mypageService.getPaymentlist(user_id);
		model.addAttribute("paymentList", paymentList);
		
		return "mypage/paymenthistory";
	}
		

	// 두 번째 포인트 결제 페이지로 이동(GET)
	@GetMapping("pointrecharge2.do")
	public String pointRechargePage(Model model, HttpSession session) {
	    String user_id = (String) session.getAttribute("showNewLoginPage");
	    AgentVO agent = mypageService.getAgent(user_id);

	    // 현재 날짜 가져오기
	    LocalDate today = LocalDate.now();

	    // power_date가 null이거나 오늘 이전인지 확인
	    LocalDate powerDate = (agent.getPower_date() == null || 
	        LocalDate.parse(agent.getPower_date()).isBefore(today)) 
	        ? today 
	        : LocalDate.parse(agent.getPower_date());

	    // 설정된 power_date를 JSP로 전달
	    model.addAttribute("powerDate", powerDate); 
	    agent.setPower_date(powerDate.toString()); // 업데이트된 날짜 저장

	    // 기타 모델 설정
	    model.addAttribute("agent", agent);
	    PointVO pointVO = new PointVO();
	    pointVO.setPoint_pt(0); 
	    model.addAttribute("pointVO", pointVO);

	    PointVO payment = mypageService.getPayment(user_id);
	    model.addAttribute("payment", payment);

	    return "mypage/pointrecharge2";
	}



	
	// 포인트 충전 처리(POST)
	@PostMapping("pointrecharge2.do")
	public String processPointRecharge(
	        @RequestParam("power_date") String powerDateInput,
	        @ModelAttribute("pointVO") PointVO pointVO,
	        HttpSession session,
	        Model model) {

	    String user_id = (String) session.getAttribute("showNewLoginPage");
	    pointVO.setUser_id(user_id);  // 예시로 사용자 ID 설정
	    System.out.println("Received point_pt: " + pointVO.getPoint_pt());
	    System.out.println("Received power_date: " + powerDateInput);

	    int point = pointVO.getPoint_pt();
	    if (point > 0) {
	        mypageService.insertPayment(pointVO);  // 결제 처리
	    }

	    // 만료일자 업데이트
	    AgentVO agent = mypageService.getAgent(user_id);

	    LocalDate today = LocalDate.now();
	    LocalDate powerDate = (agent.getPower_date() == null) ? today : LocalDate.parse(agent.getPower_date());

	    // 만료일자가 오늘 이전이면 오늘로 갱신
	    if (powerDate.isBefore(today)) {
	        agent.setPower_date(today.toString());
	    }

	    // 클라이언트에서 받은 새로운 만료일자로 업데이트
	    agent.setPower_date(powerDateInput);
	    agent.setUser_id(user_id);  // user_id 값을 다시 설정하여 전송
	    mypageService.updateAgentPointDate(agent);

	    // 모델에 데이터 추가
	    model.addAttribute("agent", agent);
	    model.addAttribute("pointVO", pointVO);

	    return "mypage/pointrecharge2";  // 뷰 이름 반환
	}

	
	
	
	//아임포트 화면으로 이동
    @GetMapping("/pointrecharge")
    public String showPaymentPage(Model model) {
        // 아임포트의 고객사 식별 코드 추가
        model.addAttribute("impUid", "imp83235240");
        return "mypage/pointrecharge";
    }
    
    //판매자 정보로 이동하기 (DB에서 가지고 오는 작업X)
//	@RequestMapping("seller.do")
//	public String seller2() {
//		return "mypage/seller";
//	}
}
