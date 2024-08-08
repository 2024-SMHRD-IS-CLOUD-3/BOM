package com.project.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;


import com.project.entity.DealEntity;

import com.project.repository.DealRepository;

@Controller
public class DealController {

    @Value("$ {save1.path}")
    private String save1Path;

    @Autowired
    private DealRepository dealRepo;



    @RequestMapping("/list")
    public String DealMain(Model model) {
        ArrayList<DealEntity> list = (ArrayList<DealEntity>) dealRepo.findAll();
        model.addAttribute("list", list);
        return "DealMain";
    }

    @RequestMapping("/goWrite")
    public String goWrite() {
        return "DealWrite";
    }

    @RequestMapping(value = "/DealWrite", method = RequestMethod.POST)
    public String dealWrite(DealEntity entity, MultipartFile[] files) {
        if (entity == null) {
            return "redirect:/goWrite?error=entity_null";
        }

        for (MultipartFile file : files) {
            if (file.isEmpty()) {
                continue;
            }

            String uuid = UUID.randomUUID().toString();
            String originalFilename = file.getOriginalFilename();
            if (originalFilename == null) {
                continue;
            }
            String filename = uuid + "_" + originalFilename;
            Path path = Paths.get(save1Path, filename);

            try {
                Files.createDirectories(path.getParent());
                file.transferTo(path);
                entity.getFilenames().add(filename); // 파일 이름 리스트에 추가
            } catch (IOException e) {
                e.printStackTrace();
                return "redirect:/goWrite?error=io_exception";
            }
        }
        dealRepo.save(entity);
        return "redirect:/list";
    }

    @RequestMapping("/goDetail")
    public String goDetail(Long idx, Model model) {
        Optional<DealEntity> optionalEntity = dealRepo.findById(idx);
        if (optionalEntity.isPresent()) {
            DealEntity entity = optionalEntity.get();
            entity.incrementView();
            dealRepo.save(entity); // 변경 사항 저장
            model.addAttribute("deal", entity);
            
            // 댓글 리스트 추가
           
        
            
            return "DealDetail";
        } else {
            return "redirect:/list?notfound";
        }
    }

 

    @RequestMapping("/goDelete")
    public String goDelete(Long idx) {
        Optional<DealEntity> optionalEntity = dealRepo.findById(idx);
        if (optionalEntity.isPresent()) {
            DealEntity entity = optionalEntity.get();
            // 파일 삭제
            for (String filename : entity.getFilenames()) {
                Path path = Paths.get(save1Path, filename);
                try {
                    Files.deleteIfExists(path);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            dealRepo.deleteById(idx);
        }
        return "redirect:/list";
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

    @RequestMapping(value = "/DealModify", method = RequestMethod.POST)
    public String dealModify(Long idx, String title, String writer, String content, MultipartFile[] files, HttpServletRequest request) {
        if (idx == null) {
            return "redirect:/list?error=idx_null";
        }

        Optional<DealEntity> optionalEntity = dealRepo.findById(idx);
        if (optionalEntity.isPresent()) {
            DealEntity entity = optionalEntity.get();
            entity.setBTitle(title);
            entity.setBContent(content);

            String[] removedFiles = request.getParameterValues("removedFiles");
            if (removedFiles != null) {
                for (String filename : removedFiles) {
                    entity.getFilenames().remove(filename);
                    // 실제 파일 시스템에서 파일 삭제
                    Path path = Paths.get(save1Path, filename);
                    try {
                        Files.deleteIfExists(path);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }

            for (MultipartFile file : files) {
                if (file.isEmpty()) {
                    continue;
                }

                String uuid = UUID.randomUUID().toString();
                String originalFilename = file.getOriginalFilename();
                if (originalFilename == null) {
                    continue;
                }
                String filename = uuid + "_" + originalFilename;
                Path path = Paths.get(save1Path, filename);

                try {
                    Files.createDirectories(path.getParent());
                    file.transferTo(path);
                    entity.getFilenames().add(filename); // 파일 이름 리스트에 추가
                } catch (IOException e) {
                    e.printStackTrace();
                    return "redirect:/goModify?error=io_exception";
                }
            }

            entity.setCreatedAt(); // 수정 시간 업데이트
            dealRepo.save(entity);
            return "redirect:/list";
        } else {
            return "redirect:/list?notfound";
        }
    }
}
