package com.project.controller;


import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.ui.Model;

import com.project.entity.UserEntity;
import com.project.repository.UserRepository;

// 이 클래스는 Controller임을 알리는 Annotation
@Controller
public class UserController {
	
	@Autowired
	private UserRepository repo;
	
	// 직접적인 경로를 감추기 위한 value
	@Value("${save.path}")
	private String savePath;
	
	@RequestMapping("/")
	public String main() {
		return "index";
	}
	
	@RequestMapping("/goJoin")
	public String goJoin() {

		return "join";
	}
	
	// 아이디 중복 확인
	@RequestMapping("/checkId")
	@ResponseBody
	public String checkId(@RequestParam("id") String id) {
		UserEntity user = repo.findById(id).orElse(null);
		if (user != null) {
			return "duplicate"; // 이미 존재하는 아이디
		} else {
			return "available"; // 사용 가능한 아이디
		}
	}

	@RequestMapping("/fileName")
	public String fileName(@RequestParam("fileName") String fileName, HttpSession session) {
		// 파일저장시 겹치는 이름을 방지하기 위하여 랜덤으로 이름값을 부여하고 문자로 변환!
 		// ??_img,  !!!_img
 		String uuid = UUID.randomUUID().toString();
 		System.out.println("uuid 확인용 : " +uuid);
 		
 		// 사용자가 선택한 파일의 이름 가져오기!
 		fileName = uuid +"_"+ fileName;
 		session.setAttribute("fileName", fileName);
 		System.out.println("파일이름 : "+ fileName);
 		
		return fileName;
	}
	
	// 회원가입
	@RequestMapping("/join")
	public String join(UserEntity user_info, HttpSession session, 
					@RequestParam("confirmPassword") String confirmPassword) {

		
	    // 비밀번호와 비밀번호 확인이 일치하는지 확인
	    if (!user_info.getPw().equals(confirmPassword)) {
	        System.out.println("비밀번호 불일치");
	        return "join"; // 비밀번호가 일치하지 않으면 다시 회원가입 페이지로 이동
	    }
	    String fileName = (String)session.getAttribute("fileName");
	    // 기타 정보 설정
	    user_info.setPrinfo(fileName);
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
	public String login(UserEntity user_info, HttpSession session, Model model) {
		
		// JPA(Java Persistence API)
		// : Java DB를 위한 API
		// : 구현된 클래스와 매핑을 할 때 사용되는 프레임워크
		// : Sql 사용 지양(Sql 구문 작성 필요 없음)
		
		user_info = repo.findByIdAndPw(user_info.getId(), user_info.getPw());
		
		if(user_info != null) {
			System.out.println("로그인 성공!");
			session.setAttribute("LoginInfo", user_info);
			return "index";
		}else {
			System.out.println("로그인 실패!");
			model.addAttribute("loginError", "아이디 또는 비밀번호가 일치하지 않습니다.");
			return "login";
		}
		
		
	}
	
	
	@RequestMapping("/goB_board")
	public String goB_board() {
		return "B_board";
		
	}
	
}
