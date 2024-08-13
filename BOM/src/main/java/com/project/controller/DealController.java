package com.project.controller;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.project.entity.DealEntity;
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
   public String dealMain(Model model, DealEntity entity) {
      List<DealEntity> list = dealRepo.findAllOrderByBIdxDesc();
      model.addAttribute("deal", list);
      return "B_board";
   }
   
   @RequestMapping("/goWrite")
   public String goWrite() {
      return "B_content";
   }
   
   @RequestMapping("/dealWrite")
   public String dealWrite(DealEntity entity, MultipartFile file) {
      if (file.isEmpty()) {
         return "redirect:/goWrite";
      }

      String uuid = UUID.randomUUID().toString();
      System.out.println("UUID 확인용 :" + uuid);

      // 사용자가 선택한 파일의 이름 가져오기!
      String filename = uuid + "_" + file.getOriginalFilename();
      System.out.println("수정된 filename :" + filename);

      // 파일 저장을 위한 경로 작업진행!
      Path path = Paths.get(savePath + filename);

      // 해당 경로에 파일 저장 작업!-> try/catch
      try {
         file.transferTo(path);
         entity.setFilenames(filename);

         dealRepo.save(entity); // -> insert sql 문장 실행
      } catch (Exception e) {
         e.printStackTrace();
      }

      return "redirect:/b_board";

   }
   
   @RequestMapping("/goDetail")
   public String goDetail(Long b_idx, Model model) {
		/*
		 * Optional<DealEntity> optionalEntity = dealRepo.findById(b_idx); if
		 * (optionalEntity.isPresent()) { DealEntity entity = optionalEntity.get();
		 * model.addAttribute("deal", entity);
		 */
         return "B_detail";
         
			/*
			 * } else { // 데이터가 없는 경우 처리 return "redirect:/b_board?notfound";
			 */
    //  }
   }
   @RequestMapping("/goDelete")
   public String goDelete(Long b_idx) {
      dealRepo.deleteById(b_idx);
      return "redirect:/b_board";
   }

   @RequestMapping("/dealModify")
   public String dealModify(Model model, DealEntity entity, Long b_idx) {

      Optional<DealEntity> optionalEntity = dealRepo.findById(b_idx);
   
         entity = optionalEntity.get();
         model.addAttribute("deal", entity);
      return "B_Modify";
   }
   
   @RequestMapping("/goChat")
   public String chat() {
	   return "chat";
   }
   
   
   
   
   
   
   
}
