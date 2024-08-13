package com.project.controller;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.entity.CommEntity;
import com.project.entity.DealEntity;
import com.project.entity.UserEntity;
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
	public String commWrite(HttpSession session) {
		if(session.getAttribute("userId")!=null) {
			return "CommWrite";
		}else {
			return "login";
		}
	}
	
	@RequestMapping("/commContent")
	public String dealWrite(CommEntity comm_info, MultipartFile file) {
			
		String uuid = UUID.randomUUID().toString();

		// 사용자가 선택한 파일의 이름 가져오기!
		String filename = uuid + "_" + file.getOriginalFilename();

		// 파일 저장을 위한 경로 작업진행!
		Path path = Paths.get(uploadDir + filename);

		// 해당 경로에 파일 저장 작업!-> try/catch
		try {
			comm_info.setCb_file(filename); 
			file.transferTo(path);
	     } catch (Exception e) {
	        e.printStackTrace();
	     }
  
      // 나머지 필드 저장
      comm_info = com_repo.save(comm_info); // -> insert sql 문장 실행
      
      if(comm_info != null) {
    	  System.out.println("DB저장완료");
    	  return "CommMain";
      }else {
    	  return "CommWrite";
      }
	}
}
