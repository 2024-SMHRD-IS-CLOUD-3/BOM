package com.project.controller;


import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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

		return "Join";
	}
	
	// 회원가입
	@RequestMapping("/join")
	public String join(UserEntity user_info, HttpSession session) {
		
		// insert 하기!
		user_info.setPrinfo("OCR적용 후 해당 정보로 변경 예정!");
		user_info.setScore(0);
		user_info.setJoined_at(Date.valueOf(LocalDate.now()));
		
		user_info = repo.save(user_info);
		
		if(user_info != null) {
			System.out.println("회원가입 성공!");
			session.setAttribute("JoinInfo", user_info);
			System.out.println(session.getAttribute("JoinInfo"));
		}
		
		return "Main";
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
		}else {
			System.out.println("로그인 실패!");
		}
		
		return "Main";
	}
	
}
