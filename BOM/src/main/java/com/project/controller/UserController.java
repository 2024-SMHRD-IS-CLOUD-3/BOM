package com.project.controller;


import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.entity.UserEntity;
import com.project.repository.UserRepository;

// 이 클래스는 Controller임을 알리는 Annotation
@Controller
public class UserController {
	
	@Autowired
	private UserRepository repo;
	
	@RequestMapping("/")
	public String main() {
		return "index";
	}
	
	@RequestMapping("/goJoin")
	public String goJoin() {

		return "join";
	}
	
	// 회원가입
	@RequestMapping("/join")
	public String join(UserEntity user_info, HttpSession session, @RequestParam("confirmPassword") String confirmPassword) {

	    // 비밀번호와 비밀번호 확인이 일치하는지 확인
	    if (!user_info.getPw().equals(confirmPassword)) {
	        System.out.println("비밀번호 불일치");
	        return "join"; // 비밀번호가 일치하지 않으면 다시 회원가입 페이지로 이동
	    }

	    // 기타 정보 설정
	    user_info.setPrinfo("OCR적용 후 해당 정보로 변경 예정!");
	    user_info.setScore(0);
	    user_info.setJoined_at(Date.valueOf(LocalDate.now()));

	    // 데이터베이스에 저장
	    user_info = repo.save(user_info);

	    if (user_info != null) {
	        session.setAttribute("JoinInfo", user_info);
	        return "index";
	    } else {
	        return "join"; // 실패 시 다시 회원가입 페이지로 이동
	    }
	}
	
	@RequestMapping("/goLogin")
	public String goLogin() {
		
		return "login";
	}
	
	
	@RequestMapping("/login")
	public String login(UserEntity user_info, HttpSession session) {
		
		// JPA(Java Persistence API)
		// : Java DB를 위한 API
		// : 구현된 클래스와 매핑을 할 때 사용되는 프레임워크
		// : Sql 사용 지양(Sql 구문 작성 필요 없음)
		
		user_info = repo.findByIdAndPw(user_info.getId(), user_info.getPw());
		
		if(user_info != null) {
			System.out.println("로그인 성공!");
			session.setAttribute("LoginInfo", user_info);
			System.out.println(session.getAttribute("LoginInfo"));
			return "index";
		}else {
			System.out.println("로그인 실패!");
			return "login";
		}
		
		
	}
	
	
	@RequestMapping("/goB_board")
	public String goB_board() {
		return "B_board";
		
	}
	
}
