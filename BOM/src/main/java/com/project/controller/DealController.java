package com.project.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	// 중고거래 게시판 메인페이지(역순정렬 -> 최신글이 제일 위에 보이게)
	@RequestMapping("/b_board")
	public String dealMain(Model model, DealEntity entity) {
		List<DealEntity> list = dealRepo.findAllOrderByBIdxDesc();

		model.addAttribute("deal", list);

		return "B_board";
	}

	// 중고거래 게시판 글 작성하기전에 로그인했는지 확인
	@RequestMapping("/goWrite")
	public String goWrite(HttpSession session) {

		UserEntity loginInfo = (UserEntity) session.getAttribute("LoginInfo");

		if (loginInfo == null) {
			return "login";
		} else {

			return "B_write";

		}
	}

	// 중고거래 게시판 작성
	@RequestMapping("/dealWrite")
	public String dealWrite(@RequestParam("b_title") String title, @RequestParam("how_much") Long price,
			@RequestParam("category") String category, @RequestParam("b_content") String description,
			@RequestParam("file") MultipartFile file, HttpSession session, RedirectAttributes redirectAttributes) {

		String userId = (String) session.getAttribute("userId");
		if (file.isEmpty()) {
			redirectAttributes.addFlashAttribute("message", "파일이 비어 있습니다.");
			return "redirect:/goWrite";
		}

		String uuid = UUID.randomUUID().toString();
		String filename = uuid + "_" + file.getOriginalFilename();
		Path path = Paths.get(savePath + filename);

		try {
			Files.copy(file.getInputStream(), path);
		} catch (IOException e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("message", "파일 업로드 실패.");
			return "redirect:/goWrite";
		}

		DealEntity entity = new DealEntity();
		entity.setB_title(title);
		entity.setHow_much(price);
		entity.setCategory(category);
		entity.setB_content(description);
		entity.setFilenames(filename);
		entity.setId(userId);

		LocalDateTime now = LocalDateTime.now();
		Timestamp timestamp = Timestamp.valueOf(now);
		entity.setCreated_at(timestamp);

		dealRepo.save(entity);

		redirectAttributes.addFlashAttribute("message", "게시물 등록 완료.");
		return "redirect:/b_board";
	}

	// 중고거래 게시판 수정
	@RequestMapping("/modifyWrite")
	public String modifyWrite(@ModelAttribute DealEntity updatedEntity,@RequestParam("b_title") String title, @RequestParam("how_much") Long price,
			@RequestParam("category") String category, @RequestParam("b_content") String description,
			@RequestParam("file") MultipartFile file, HttpSession session, RedirectAttributes redirectAttributes, Long idx) {

		if (file.isEmpty()) {
			redirectAttributes.addFlashAttribute("message", "파일이 비어 있습니다.");
			return "redirect:/goWrite";
		}

		String uuid = UUID.randomUUID().toString();
		String filename = uuid + "_" + file.getOriginalFilename();
		Path path = Paths.get(savePath + filename);

		try {
			Files.copy(file.getInputStream(), path);
		} catch (IOException e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("message", "파일 업로드 실패.");
			return "redirect:/goWrite";
		}
		Optional<DealEntity> optionalEntity = dealRepo.findById(idx);
		
		System.out.println("자라거부기"+idx);
		DealEntity entity = optionalEntity.get();
		entity.setB_title(updatedEntity.getB_title());
		entity.setHow_much(updatedEntity.getHow_much());
		entity.setCategory(updatedEntity.getCategory());
		entity.setB_content(updatedEntity.getB_content());
		entity.setFilenames(filename); 
	
		

		LocalDateTime now = LocalDateTime.now();
		Timestamp timestamp = Timestamp.valueOf(now);
		entity.setCreated_at(timestamp);

		   dealRepo.save(entity);

		redirectAttributes.addFlashAttribute("message", "게시물 등록 완료.");
		return "redirect:/b_board";
	}
	
	// 중고거래게시판 디테일
	@RequestMapping("/goDetail")
	public String goDetail(Model model, HttpSession session, Long idx) {

		List<DealEntity> deal = dealRepo.findAll();

		List<UserEntity> user = repo.findAll();

		System.out.println("보여죵" + idx);
		for (int i = 0; i < deal.size(); i++) {
			if (deal.get(i).getB_idx().equals(idx)) {
				model.addAttribute("yoyo", deal.get(i));
				for (int l = 0; l < user.size(); l++) {
					if (deal.get(i).getId().equals(user.get(l).getId())) {

						model.addAttribute("user", user.get(l));
						model.addAttribute("duAddr", user.get(l).getAddr());

						String duInfo = user.get(l).getUserFile();
						if (duInfo != null) {
							model.addAttribute("duInfo", duInfo);
						} else {
							duInfo = "free-icon-person-4203951.png";
							model.addAttribute("duInfo", duInfo);
						}

						deal.get(i).setB_views(deal.get(i).getB_views() + 1);

					}

				}
			}
		}

		for (int i = 0; i < deal.size(); i++) {
			if (deal.get(i).getB_idx().equals(idx)) {
				String userId = (String) session.getAttribute("userId");
				if(deal.get(i).getId().equals(userId)) {
					return "B_WriteDetail";
							
				}
			}
		}
		return "B_detail";

	}

	@RequestMapping("/goDelete")
	public String goDelete(Long idx) {
		dealRepo.deleteById(idx);
		return "redirect:/b_board";
	}

	
	@RequestMapping("/dealModify")
	public String dealModify(Model model,String dealId, DealEntity entity, Long idx, HttpSession session) {
		
		Optional<DealEntity> optionalEntity = dealRepo.findById(idx);
		System.out.println("안녕하세요"+ optionalEntity);
	    if (optionalEntity.isPresent()) {
	        entity = optionalEntity.get();
	     
	        model.addAttribute("deal", entity);
	       
	        model.addAttribute("file", "uploads/"+entity.getFilenames());

	    } 

		
		return "B_modify";
	}

	@RequestMapping("/goRoom")
	public String room() {
		return "room";
	}

	@RequestMapping("/goChat")
	public String chat(Model model, Long idx) {
		List<DealEntity> deal = dealRepo.findAll();
		System.out.println(idx);
		for (int i = 0; i < deal.size(); i++) {
			if (deal.get(i).getB_idx().equals(idx)) {
				System.out.println(deal.get(i));
				model.addAttribute("chat", deal.get(i));
			}
		}

		return "chat";
	}

}
