package com.project.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.time.LocalDate;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.MultipartBodyBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

import com.project.entity.DealEntity;
import com.project.entity.FlaskEntity;
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

	// 파일이름 중복방지(..)
//	@RequestMapping("/fileName")
//	public String fileName(@RequestParam("fileName") String fileName, HttpSession session) {
//		// 파일저장시 겹치는 이름을 방지하기 위하여 랜덤으로 이름값을 부여하고 문자로 변환!
// 		// ??_img,  !!!_img
// 		String uuid = UUID.randomUUID().toString();
// 		System.out.println("uuid 확인용 : " +uuid);
// 		
// 		// 사용자가 선택한 파일의 이름 가져오기!
// 		fileName = uuid +"_"+ fileName;
// 		session.setAttribute("fileName", fileName);
// 		System.out.println("파일이름 : "+ fileName);
// 		
//		return fileName;
//	}

	// Flask 데이터 가져오기
//	@RequestMapping("/dataRequest") // POST로 변경
//	@ResponseBody // AJAX 요청에 대한 응답을 직접 반환
//	public String flask(@RequestParam("file") MultipartFile file, HttpSession session) {
//
//		try {
//			// Flask 서버 URL
//			String url = "http://127.0.0.1:5000/upload";
//
//			// RestTemplate 사용하여 Flask 서버에서 데이터 가져오기
//			RestTemplate restTemplate = new RestTemplate();
//
//			HttpHeaders headers = new HttpHeaders();
//			headers.set("Content-Type", "multipart/form-data");
//
//			// MultipartBodyBuilder를 사용하여 파일을 Multipart 요청으로 변환
//			MultipartBodyBuilder builder = new MultipartBodyBuilder();
//			builder.part("file", new ByteArrayResource(file.getBytes()) {
//				public String getFilename(MultipartFile file) {
//					return file.getName();
//				}
//			});
//
//			HttpEntity<MultiValueMap<String, HttpEntity<?>>> requestEntity = new HttpEntity<>(builder.build(), headers);
//
//			// Flask 서버로 POST 요청 보내기
//			ResponseEntity<String> response = restTemplate.postForEntity(url, requestEntity, String.class);
//
//			if (response.getStatusCode().is2xxSuccessful()) {
//				// Flask 서버에서 반환된 텍스트를 세션에 저장
//				String extractedText = response.getBody();
//				session.setAttribute("info", extractedText);
//				System.out.println(extractedText);
//				return "데이터 가져오기 성공: " + extractedText;
//			} else {
//				return "Flask 서버로부터 데이터를 가져오는 데 실패했습니다.";
//			}
//		} catch (Exception e) {
//			return "오류 발생 : " + e.getMessage();
//		}
//	}

	// 업로드한 파일 python으로 보내기
	@PostMapping("/uploadFile")
	@ResponseBody
	public String uploadFile(@RequestParam("file") MultipartFile file) {
		try {
			// 파일을 임시 디렉토리에 저장
//            File uploadDir = new File(UPLOAD_DIR);
//            if (!uploadDir.exists()) {
//                uploadDir.mkdirs();
//            }
//            Path filePath = Paths.get(UPLOAD_DIR, file.getOriginalFilename());
//            Files.write(filePath, file.getBytes());

			// 저장된 파일을 Python 서버로 전송
			String pythonServerUrl = "http://127.0.0.1:5000/upload";
			RestTemplate restTemplate = new RestTemplate();

			// 헤더 설정
			HttpHeaders headers = new HttpHeaders();
			headers.set("Content-Type", "multipart/form-data");

			// 파일을 멀티파트로 구성하여 전송
			MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();
			body.add("file", file.getResource());

			// HTTP 엔티티 생성
			HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(body, headers);

			// Flask 서버로 POST 전송 요청
			ResponseEntity<String> response = restTemplate.exchange(pythonServerUrl, HttpMethod.POST, requestEntity,
					String.class);

			// 결과 반환
			if (response.getStatusCode().is2xxSuccessful()) {
				return response.getBody();
			} else {
				return "파일 전송 실패: " + response.getStatusCode().toString();
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "파일 전송 실패: " + e.getMessage();
		}
	}

	// 회원가입
	@RequestMapping("/join")
	public String join(UserEntity user_info, HttpSession session,
			@RequestParam("confirmPassword") String confirmPassword,
			@RequestParam("extractedText") String extractedText) {

		// 비밀번호와 비밀번호 확인이 일치하는지 확인
		if (!user_info.getPw().equals(confirmPassword)) {
			System.out.println("비밀번호 불일치");
			return "join"; // 비밀번호가 일치하지 않으면 다시 회원가입 페이지로 이동
		}

		// 받은 extractedText를 디코딩
		String decodedText = URLDecoder.decode(extractedText, StandardCharsets.UTF_8);
		
		// 기타 정보 설정
		user_info.setPrinfo(decodedText);
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
	
	   // /goLogin 요청을 받았을 때, 로그인 여부에 따라 다른 페이지로 리다이렉트
    @RequestMapping("/goMyPage")
    public String goLogin(HttpSession session) {
        UserEntity loginInfo = (UserEntity) session.getAttribute("LoginInfo");
        if (loginInfo != null) {
            return "MyPageDetail"; // 로그인된 상태라면 myPageDetail 리턴
        } else {
            return "login"; // 로그인되지 않은 상태라면 login 리턴
        }
    }



    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 무효화 (로그아웃)
        return "redirect:/"; // 로그아웃 후 메인 페이지로 리다이렉트
    }

	

//	@RequestMapping("/goLogin")
//	public String goLogin() {
//
//		return "login";
//	}

	@RequestMapping("/login")
	public String login(UserEntity user_info, HttpSession session, Model model) {

		// JPA(Java Persistence API)
		// : Java DB를 위한 API
		// : 구현된 클래스와 매핑을 할 때 사용되는 프레임워크
		// : Sql 사용 지양(Sql 구문 작성 필요 없음)

		user_info = repo.findByIdAndPw(user_info.getId(), user_info.getPw());

		if (user_info != null) {
			System.out.println("로그인 성공!");
			session.setAttribute("LoginInfo", user_info);
			return "index";
		} else {
			System.out.println("로그인 실패!");
			model.addAttribute("loginError", "아이디 또는 비밀번호가 일치하지 않습니다.");
			return "login";
		}

	}
	
	
	
	
	
	/////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////
	
	@PostMapping("/updateProfile")
	public String updateProfile(
	        @RequestParam("profilePicture") MultipartFile profilePicture,
	        @RequestParam("password") String password,
	        @RequestParam("confirmPassword") String confirmPassword,
	        @RequestParam("email") String email,
	        @RequestParam("nickname") String nickname,
	        HttpSession session,
	        Model model) {

	    UserEntity loginInfo = (UserEntity) session.getAttribute("LoginInfo");

	    if (loginInfo == null) {
	        return "redirect:/goLogin"; // 로그인되어 있지 않으면 로그인 페이지로 리다이렉트
	    }

	    if (!password.equals(confirmPassword)) {
	        model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
	        return "myPageDetail"; // 비밀번호가 일치하지 않으면 다시 수정 페이지로
	    }

	    // 사용자 정보 업데이트
	    loginInfo.setPw(password);
//	    loginInfo.setEmail(email);
	    loginInfo.setName(nickname);

	    // 프로필 사진 저장
	    if (!profilePicture.isEmpty()) {
	        try {
	            String fileName = UUID.randomUUID().toString() + "_" + profilePicture.getOriginalFilename();
	            Path filePath = Paths.get("path/to/save", fileName); // 파일 저장 경로 설정
	            Files.write(filePath, profilePicture.getBytes());
	            loginInfo.setPrinfo(fileName); // DB에 프로필 사진 경로 저장
	        } catch (IOException e) {
	            model.addAttribute("error", "프로필 사진 저장 중 오류가 발생했습니다.");
	            return "myPageDetail";
	        }
	    }

	    // DB에 저장
	    repo.save(loginInfo);

	    session.setAttribute("LoginInfo", loginInfo); // 세션 업데이트
	    model.addAttribute("success", "회원 정보가 성공적으로 업데이트되었습니다.");

	    return "myPageDetail"; // 수정 후 다시 마이페이지로 리다이렉트
	}

	

}
