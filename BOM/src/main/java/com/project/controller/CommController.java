package com.project.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.entity.CommEntity;
import com.project.repository.CommRepository;
import com.project.repository.UserRepository;

@Controller
public class CommController {

	@Autowired
	private CommRepository com_repo;
	
	// 파일 저장 경로
	@Value("${file.upload-dir.commu}")
    private String uploadDir;
	
	@RequestMapping("/goComm")
	public String goComm() {
		return "CommMain";
	}
	
	@RequestMapping("/goCommWrite")
	public String commWrite() {
		return "CommWrite";
	}
	
	@RequestMapping("/commContent")
	public String commContent(CommEntity comm_info,
							@RequestParam("cb_title") String title,
							@RequestParam("cb_content") String content,
							@RequestParam("cb_file") MultipartFile file,
							RedirectAttributes redirectAttributes,
							HttpSession session) {
		
		// 세션에서 로그인한 사용자의 ID 가져오기
		String userId = (String)session.getAttribute("LoginInfo");
		
		// 파일 저장 경로 설정
		String filePath = uploadDir + File.separator + file.getOriginalFilename();
        File destinationFile = new File(filePath);
        
        try {
            // 파일 저장
            file.transferTo(destinationFile);

            // 파일 경로를 DB에 저장
            comm_info.setCb_title(title);
            comm_info.setCb_content(content);
            comm_info.setCb_file(file.getOriginalFilename());  // DB에는 파일 이름 저장
            comm_info.setId(userId);

            comm_info = com_repo.save(comm_info);

            redirectAttributes.addFlashAttribute("message", "파일 업로드 성공!");

        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("message", "파일 업로드 실패!");
        }
		
		if(comm_info != null) {
			System.out.println("DB 저장 완료!");
			return "CommMain";
		}else {
			System.out.println("DB 저장 에러!");
			return "CommWrite";
		}
	}
}
