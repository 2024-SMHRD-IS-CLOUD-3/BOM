package com.project.controller;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	public String dealMain(Model model, DealEntity entity) {
		List<DealEntity> list = dealRepo.findAllOrderByBIdxDesc();
		model.addAttribute("deal", list);
		System.out.println(list);

		return "B_board";
	}

	@RequestMapping("/goWrite")
	public String goWrite(HttpSession session) {
		UserEntity loginInfo = (UserEntity) session.getAttribute("LoginInfo");
		return "B_content";
	}

	@RequestMapping("/dealWrite")
	public String dealWrite(DealEntity entity, MultipartFile file, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		if (file.isEmpty()) {
			return "redirect:/goWrite";
		}

		String uuid = UUID.randomUUID().toString();
		String filename = uuid + "_" + file.getOriginalFilename();

		Path path = Paths.get(savePath + filename);
		System.out.println("경로 확인 : " + path);
		try {
			file.transferTo(path);
			entity.setFilenames(filename);

		} catch (Exception e) {
			e.printStackTrace();
		}

		entity.setId(userId);
	    LocalDateTime now = LocalDateTime.now();
	    Timestamp timestamp = Timestamp.valueOf(now);
		entity.setCreated_at(timestamp);
		

		// DB에 저장
		entity = dealRepo.save(entity);

		if (entity != null) {
			System.out.println("DB저장완료?");
		} else {
			System.out.println("DB저장실패..?");
		}

		return "redirect:/b_board";

	}

	@RequestMapping("/goDetail")
	public String goDetail(Model model, HttpSession session, Long b_idx) {

		List<DealEntity> deal = dealRepo.findAll();
		model.addAttribute("deal", deal);
		

		List<UserEntity> user = repo.findAll();

		model.addAttribute("user", user);
		
		
		for(int i=0; i<deal.size(); i++) {
        	for(int l=0; l<user.size();l++) {
        		if(deal.get(i).getId().equals(user.get(l).getId())) {
        			String duAddr = user.get(l).getAddr();
        			model.addAttribute("duAddr", duAddr);
        			
        			
        			String duInfo = user.get(l).getUserPp();
        			if(duInfo != null) {
        				duInfo= "forComm/duInfo";
        			} else {
        				duInfo= "uploads/free-icon-person-4203951.png";
        			}
        			
        			deal.get(i).setB_views(deal.get(i).getB_views()+1);
        			
        			model.addAttribute("duInfo", duInfo);
        		}
        		
        	}
        	
        }
      
		
		
		
	
		dealRepo.saveAll(deal); // 변경 사항 저장
		model.addAttribute("deal", deal);

		return "B_detail";

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
