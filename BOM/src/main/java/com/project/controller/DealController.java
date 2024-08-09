package com.project.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.entity.DealEntity;
import com.project.repository.DealRepository;

@Controller
public class DealController {

    @Value("${save.path}")
    private String savePath;

    @Autowired
    private DealRepository dealRepo;

    @RequestMapping("/list")
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
    public String saveWrite(DealEntity entity, @RequestParam("files") MultipartFile[] files) {
    	
        if (entity == null) {
            return "redirect:/goWrite?error=entity_null";
        }

        if (entity.getFilenames() == null) {
            entity.setFilenames(new ArrayList<String>());
        }

        if (files == null || files.length == 0) {
            return "redirect:/goWrite?error=no_files";
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

        dealRepo.save(entity);
        return "redirect:/list";
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
