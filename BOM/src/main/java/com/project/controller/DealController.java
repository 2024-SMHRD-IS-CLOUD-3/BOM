package com.project.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.entity.DealEntity;
import com.project.entity.UserEntity;
import com.project.repository.DealRepository;
import com.project.repository.UserRepository;

@Controller
public class DealController {

    @Value("${file.upload-dir.board}")
    private String savePath;

    @Autowired
    private DealRepository dealRepo;	
    @Autowired
	private UserRepository repo;

    @RequestMapping("/b_board")
    public String DealMain(Model model) {
        List<DealEntity> list = dealRepo.findAllOrderByBIdxDesc();
        model.addAttribute("list", list);
        return "B_board";
    }


    @RequestMapping("/goWrite")
    public String goWrite() {
        return "B_content";
    }

    @RequestMapping("/saveWrite")
    public String saveWrite(DealEntity entity, @RequestParam("files") MultipartFile[] files, Model model, HttpSession session) {
        // 세션에서 로그인된 사용자 정보 가져오기
        UserEntity user_info = (UserEntity) session.getAttribute("LoginInfo");
        
        if (user_info == null) {
            model.addAttribute("error", "로그인된 사용자가 없습니다.");
            return "redirect:/goLogin";  // 로그인 페이지로 리다이렉션
        }

        // 게시글 작성자 ID 설정
        entity.setId(user_info.getId());

        // 게시글 작성자 ID 설정
        entity.setId(user_info.getId());
    	
    	
        if (entity.getCategory() == null || entity.getCategory().isEmpty()) {
            model.addAttribute("error", "카테고리는 필수 입력 사항입니다.");
            System.out.println("카테고리 입력해라");
            return "redirect:/goWrite";
        }

        if (entity.getB_title() == null || entity.getB_title().isEmpty()) {
            model.addAttribute("error", "제목은 필수 입력 사항입니다.");
            System.out.println("제목입력해라");
            return "redirect:/goWrite";
        }

        if (entity.getHow_much() == null) {
            model.addAttribute("error", "가격은 필수 입력 사항입니다.");
            System.out.println("가격 입력해라");
            return "redirect:/goWrite";
        }
        
        if (files != null && files.length > 0) {
            for (MultipartFile file : files) {
                if (!file.isEmpty()) {
                    String uuid = UUID.randomUUID().toString();
                    String originalFilename = file.getOriginalFilename();
                    if (originalFilename != null) {
                        String filename = uuid + "_" + originalFilename;
                        Path path = Paths.get(savePath, filename);
                        try {
                            Files.createDirectories(path.getParent());
                            file.transferTo(path);
                            entity.getFilenames().add(filename);
                        } catch (IOException e) {
                            e.printStackTrace();
                            return "redirect:/goWrite?error=io_exception";
                        }
                    }
                }
            }
        }

        // 엔티티 저장
        dealRepo.save(entity);
        
        List<DealEntity> list = dealRepo.findAllOrderByBIdxDesc();
        model.addAttribute("deal", entity);
        return "B_board";
    }


    @RequestMapping("/goDetail")
    public String goDetail(Long idx, Model model) {
        Optional<DealEntity> optionalEntity = dealRepo.findById(idx);
        if (optionalEntity.isPresent()) {
            DealEntity entity = optionalEntity.get();
            entity.incrementView();
            dealRepo.save(entity);
            model.addAttribute("deal", entity);
            return "DealDetail";
        } else {
            return "redirect:/list?notfound";
        }
    }

    @RequestMapping("/goModify")
    public String goModify(Model model, Long idx) {
        if (idx == null) {
            return "redirect:/list";
        }

        Optional<DealEntity> optionalEntity = dealRepo.findById(idx);
        if (optionalEntity.isPresent()) {
            DealEntity entity = optionalEntity.get();
            model.addAttribute("deal", entity);
            return "DealModify";
        } else {
            return "redirect:/list?notfound";
        }
    }

    @RequestMapping("/goB_content")
    public String goB_content() {
        return "B_content";
    }
}
