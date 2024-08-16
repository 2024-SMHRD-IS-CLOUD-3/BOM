package com.project.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
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
import org.springframework.web.bind.annotation.RequestMethod;
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

	@Value("${file.upload-dir.board}")
	private String savePath;
	
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
//   @RequestMapping("/fileName")
//   public String fileName(@RequestParam("fileName") String fileName, HttpSession session) {
//      // 파일저장시 겹치는 이름을 방지하기 위하여 랜덤으로 이름값을 부여하고 문자로 변환!
//       // ??_img,  !!!_img
//       String uuid = UUID.randomUUID().toString();
//       System.out.println("uuid 확인용 : " +uuid);
//       
//       // 사용자가 선택한 파일의 이름 가져오기!
//       fileName = uuid +"_"+ fileName;
//       session.setAttribute("fileName", fileName);
//       System.out.println("파일이름 : "+ fileName);
//       
//      return fileName;
//   }

   // Flask 데이터 가져오기
//   @RequestMapping("/dataRequest") // POST로 변경
//   @ResponseBody // AJAX 요청에 대한 응답을 직접 반환
//   public String flask(@RequestParam("file") MultipartFile file, HttpSession session) {
//
//      try {
//         // Flask 서버 URL
//         String url = "http://127.0.0.1:5000/upload";
//
//         // RestTemplate 사용하여 Flask 서버에서 데이터 가져오기
//         RestTemplate restTemplate = new RestTemplate();
//
//         HttpHeaders headers = new HttpHeaders();
//         headers.set("Content-Type", "multipart/form-data");
//
//         // MultipartBodyBuilder를 사용하여 파일을 Multipart 요청으로 변환
//         MultipartBodyBuilder builder = new MultipartBodyBuilder();
//         builder.part("file", new ByteArrayResource(file.getBytes()) {
//            public String getFilename(MultipartFile file) {
//               return file.getName();
//            }
//         });
//
//         HttpEntity<MultiValueMap<String, HttpEntity<?>>> requestEntity = new HttpEntity<>(builder.build(), headers);
//
//         // Flask 서버로 POST 요청 보내기
//         ResponseEntity<String> response = restTemplate.postForEntity(url, requestEntity, String.class);
//
//         if (response.getStatusCode().is2xxSuccessful()) {
//            // Flask 서버에서 반환된 텍스트를 세션에 저장
//            String extractedText = response.getBody();
//            session.setAttribute("info", extractedText);
//            System.out.println(extractedText);
//            return "데이터 가져오기 성공: " + extractedText;
//         } else {
//            return "Flask 서버로부터 데이터를 가져오는 데 실패했습니다.";
//         }
//      } catch (Exception e) {
//         return "오류 발생 : " + e.getMessage();
//      }
//   }

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
      
      // 현재 날짜와 시간 설정
      LocalDateTime now = LocalDateTime.now();
      Timestamp timestamp = Timestamp.valueOf(now);
      user_info.setJoined_at(timestamp);

      // 데이터베이스에 저장
      user_info = repo.save(user_info);

      if (user_info != null) {
         session.setAttribute("JoinInfo", user_info);
         return "index";
      } else {
         return "join"; // 실패 시 다시 회원가입 페이지로 이동
      }
   }

   @RequestMapping("/logout")
   public String logout(HttpSession session) {
      session.invalidate(); // 세션 무효화 (로그아웃)
      return "redirect:/"; // 로그아웃 후 메인 페이지로 리다이렉트
   }

   @RequestMapping("/login")
   public String goLogin() {

      return "login";
   }

   @RequestMapping("/loginCh")
   public String login(@RequestParam("id") String id, @RequestParam("pw") String pw, HttpSession session,
         Model model) {

      // 사용자 정보 DB에서 조회
      UserEntity user_info = repo.findByIdAndPw(id, pw);

      if (user_info != null) { // 로그인 성공 시
         System.out.println("로그인 성공!");
         session.setAttribute("LoginInfo", user_info); // 세션에 사용자 정보 저장
         session.setAttribute("userId", user_info.getId());
         return "redirect:/"; // 로그인 성공 후 메인 페이지로 리다이렉트
      } 
       else  {
         System.out.println("로그인 실패!");
         model.addAttribute("loginError", "아이디 또는 비밀번호가 일치하지 않습니다.");
         return "login"; // 로그인 페이지로 다시 이동
      }
   }

   // 마이페이지로 이동하면서 사용자 정보를 모델에 추가
   @RequestMapping("/goMyPage")
   public String goMyPage(HttpSession session, Model model) {
      UserEntity loginInfo = (UserEntity) session.getAttribute("LoginInfo");

      if (loginInfo == null) {
         return "redirect:/login"; // 로그인되지 않은 경우 로그인 페이지로 리다이렉트
      }

      // 데이터베이스에서 사용자 정보 다시 조회
      UserEntity userInfo = repo.findById(loginInfo.getId()).orElse(null);

      if (userInfo != null) {
         model.addAttribute("user", userInfo); // 모델에 사용자 정보를 추가
         return "MyPageDetail"; // 사용자 정보를 가지고 마이페이지로 이동
      } else {
         return "redirect:/login"; // 사용자 정보를 찾을 수 없는 경우 로그인 페이지로 리다이렉트
      }
   }

   /////////////////////////////////////////////////////////////////////////////////
   /////////////////////////////////////////////////////////////////////////////////
   /////////////////////////////////////////////////////////////////////////////////

   // 프로필 수정 처리
   // 프로필 수정 처리
   @RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
   public String updateProfile(
           @RequestParam("profilePicture") MultipartFile profilePicture,  // 프로필 사진 파일 입력 (DB 컬럼: user_pp)
           @RequestParam("password") String password,  // 비밀번호 입력 (DB 컬럼: pw)
           @RequestParam("confirmPassword") String confirmPassword,  // 비밀번호 확인 입력 (비교용, DB 컬럼 아님)
           @RequestParam("nickname") String nickname,  // 닉네임 입력 (DB 컬럼: name)
           @RequestParam("phone") String phone,  // 전화번호 입력 (DB 컬럼: phone)
           @RequestParam("addr") String addr,  // 주소 입력 (DB 컬럼: addr)
           HttpSession session,  // 현재 세션을 통해 로그인된 사용자 정보 접근
           Model model) {  // 모델을 통해 뷰에 메시지 전달

       // 세션에서 현재 로그인된 사용자 정보 가져오기
       UserEntity loginInfo = (UserEntity) session.getAttribute("LoginInfo");

       if (loginInfo == null) {  // 로그인되지 않은 경우
           return "redirect:/login";  // 로그인 페이지로 리다이렉트
       }

       // 데이터베이스에서 현재 사용자 정보를 다시 조회하여 기존 데이터 유지
       UserEntity currentUser = repo.findById(loginInfo.getId()).orElse(null);
       if (currentUser == null) {
           return "redirect:/login";  // 사용자를 찾을 수 없는 경우 로그인 페이지로 리다이렉트
       }

       // 비밀번호 확인 후 업데이트
       if (!password.isEmpty() && password.equals(confirmPassword)) {
           currentUser.setPw(password);  // 비밀번호 업데이트 (DB 컬럼: pw)
       }

       // 닉네임 업데이트 (빈 값이 아닌 경우만)
       if (!nickname.isEmpty()) {
           currentUser.setName(nickname);  // 닉네임 업데이트 (DB 컬럼: name)
       }

       // 전화번호 업데이트 (빈 값이 아닌 경우만)
       if (!phone.isEmpty()) {
           currentUser.setPhone(phone);  // 전화번호 업데이트 (DB 컬럼: phone)
       }

       // 주소 업데이트 (빈 값이 아닌 경우만)
       if (!addr.isEmpty()) {
           currentUser.setAddr(addr);  // 주소 업데이트 (DB 컬럼: addr)
       }

       // 프로필 사진 업데이트
       if (!profilePicture.isEmpty()) {  // 프로필 사진이 업로드된 경우
           try {
               // 파일 이름 생성 (UUID를 사용하여 중복 방지)
               String fileName = UUID.randomUUID().toString() + "_" + profilePicture.getOriginalFilename();
               // 파일 저장 경로 설정 (실제 파일 저장 경로로 수정 필요)
               Path filePath = Paths.get(savePath + fileName);
               // 파일 저장
               Files.write(filePath, profilePicture.getBytes());
               // DB에 프로필 사진 경로 저장 (DB 컬럼: user_pp)
               currentUser.setUserFile(fileName);
           } catch (IOException e) {  // 파일 저장 중 오류가 발생한 경우
               model.addAttribute("error", "프로필 사진 저장 중 오류가 발생했습니다.");  // 에러 메시지를 모델에 추가
               return "MyPageDetail";  // 다시 마이페이지로 돌아감
           }
       }

       // 수정된 사용자 정보를 데이터베이스에 저장
       repo.save(currentUser);

       // 세션에 업데이트된 사용자 정보 반영
       session.setAttribute("LoginInfo", currentUser);
       model.addAttribute("success", "회원 정보가 성공적으로 업데이트되었습니다.");  // 성공 메시지를 모델에 추가

       return "MyPageDetail";  // 수정 완료 후 마이페이지로 리다이렉트
   }



}
