package com.project.controller;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	// 페이지당 표시할 게시물 수 설정
    private static final int PAGE_SIZE = 10;

	// 파일 저장 경로
	@Value("${file.upload-dir.commu}")
	private String uploadDir;

	@RequestMapping("/goComm")
	public String goComm(Model model, 
						@RequestParam(value = "page", defaultValue = "0") int page) {
		
		// 데이터베이스에서 게시물 목록을 조회
        List<CommEntity> posts = com_repo.findAll();

        // 페이지 정보를 포함한 게시물 조회
        Pageable pageable = PageRequest.of(page, PAGE_SIZE, Sort.by(Sort.Direction.DESC, "idx"));
        Page<CommEntity> postsPage = com_repo.findAll(pageable);

        // 페이지 정보와 게시물 리스트를 모델에 추가
        model.addAttribute("posts", postsPage.getContent());
        model.addAttribute("totalPages", postsPage.getTotalPages());
        model.addAttribute("currentPage", page);
		
		return "CommMain";
	}

	@RequestMapping("/goCommWrite")
	public String commWrite(HttpSession session) {
		if (session.getAttribute("userId") != null) {
			return "CommWrite";
		} else {
			return "login";
		}
	}

	@RequestMapping("/commContent")
	public String dealWrite(@RequestParam("cb_title") String title,
						    @RequestParam("cb_content") String content,
						    @RequestParam("cb_file") MultipartFile file,
						    @RequestParam("id") String userId,
						    RedirectAttributes redirectAttributes) {

		// 새로운 CommEntity 객체 생성 및 필드 설정
	    CommEntity comm_info = new CommEntity();
	    comm_info.setCb_title(title);
	    comm_info.setCb_content(content);
	    comm_info.setId(userId);
	    
	    // 현재 날짜와 시간 설정
	    LocalDateTime now = LocalDateTime.now();
	    Timestamp timestamp = Timestamp.valueOf(now);
	    comm_info.setCreated_at(timestamp);


	    // 파일 업로드 처리
	    if (!file.isEmpty()) {
	        String uuid = UUID.randomUUID().toString();
	        String filename = uuid + "_" + file.getOriginalFilename();

	        Path path = Paths.get(uploadDir + filename);

	        try {
	            file.transferTo(path);
	            comm_info.setCb_file(filename);
	        } catch (Exception e) {
	            e.printStackTrace();
	            redirectAttributes.addFlashAttribute("message", "File upload failed!");
	            return "CommWrite";
	        }
	    } else {
	        comm_info.setCb_file(null);
	    }

		// 나머지 필드 저장
		comm_info = com_repo.save(comm_info); // -> insert sql 문장 실행

		if (comm_info != null) {
			System.out.println("DB저장완료");
			return "redirect:/goComm";
		} else {
			System.out.println("DB저장실패");
			return "CommWrite";
		}
	}
	
}
