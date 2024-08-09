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
        List<DealEntity> list = dealRepo.findAll();
        model.addAttribute("list", list);
        return "DealMain";
    }

    @RequestMapping("/goWrite")
    public String goWrite() {
    	System.out.println("goWrite성공");
        return "DealWrite";
    }

    @RequestMapping(value = "/dealWrite", method = RequestMethod.POST)
    public String dealWrite(DealEntity entity, MultipartFile[] files) {
        if (entity == null) {
            return "redirect:/goWrite?error=entity_null";
        }
       

        // Ensure filenames list is initialized
        if (entity.getFilenames() == null) {
            entity.setFilenames(new ArrayList<String> ()); // Initialize the list if it is null
        }
        System.out.println("여기까진 성공 데려오긴함");
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
            Path path = Paths.get(save1Path, filename);
            System.out.println("여긴어때를 데려오긴함");
            try {
                Files.createDirectories(path.getParent());
                file.transferTo(path);
                entity.getFilenames().add(filename); // Add the filename to the list
            } catch (IOException e) {
                e.printStackTrace();
                return "redirect:/goWrite?error=io_exception";
            }
            System.out.println("1를 데려오긴함");
        }
        dealRepo.save(entity);
        System.out.println("안됨를 데려오긴함");

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
}
