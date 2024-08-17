package com.project.controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.entity.CarEntity;
import com.project.entity.DealEntity;
import com.project.entity.UserEntity;
import com.project.repository.CarRepository;
import com.project.repository.DealRepository;
import com.project.repository.UserRepository;

@Controller
public class CarController {

	@Value("${file.upload-dir.stroller}")
	private String savePath;

	@Autowired
	private DealRepository dealRepo;

	@Autowired
	private UserRepository repo;

	@Autowired
	private CarRepository carRepo;
	

	

	@RequestMapping("/car")
	public String car(HttpSession session) {

		String userId = (String) session.getAttribute("userId");
		if (userId == null) {
			return "login";
		}

		if (userId.equals("test")) {

			return "redirect:/pathAdmin";
		} else {
			return "redirect:/gogo";
		}

	}

	@RequestMapping("/pathAdmin")
	public String pathAdmin(Model model) {
		List<CarEntity> entity = carRepo.findAllDesc();

		System.out.println("나에게 엔티티를 보여줘" + entity);
		model.addAttribute("deal", entity);

		return "admin";
	}
	
	@RequestMapping("/updateStatus")
	public String updateStatus(@RequestParam("car_idx") Long car_idx, 
	                           @RequestParam("car_cours") String car_cours) {

	    Optional<CarEntity> optionalEntity = carRepo.findById(car_idx);
	   
	    
	    System.out.println(car_cours+"를 보여줘");
	    if (optionalEntity.isPresent()) {
	        CarEntity entity = optionalEntity.get();
	
	        
	        // 사용자가 선택한 car_cours 값을 설정
	        entity.setCar_cours(car_cours);
	        carRepo.save(entity);  // 변경 사항을 저장
	        System.out.println("업데이트된 car_cours: " + entity.getCar_cours());
	    } else {
	        System.out.println("해당 ID로 엔티티를 찾을 수 없습니다: " + car_idx);
	        // 오류 처리 로직
	    }

	    return "redirect:/pathAdmin";
	}

	@RequestMapping("goCar")
	private String goCar(Model model) {

		List<CarEntity> entity = carRepo.findAllDesc();
		for(int i =0; i<entity.size(); i++) {
		if(entity.get(i).getCar_cours().equals("완료")) {
			model.addAttribute("list", entity.get(i).getCar_cours());
		}
		}
		

		return "stroller";

	}

	@RequestMapping("/gogo")
	private String gogo(HttpSession session) {

		UserEntity loginInfo = (UserEntity) session.getAttribute("LoginInfo");

		if (loginInfo == null) {
			return "login";
		} else if (loginInfo.getId().equals("test")) {
			return "redirect:/pathAdmin";
		} else {

			return "redirect:/goCarWrite";
		}
	}

	@RequestMapping("/goCarWrite")
	private String goCarWrite(HttpSession session, Model model) {
		UserEntity loginInfo = (UserEntity) session.getAttribute("LoginInfo");
		if (loginInfo.getId() != null) {
			model.addAttribute("id", loginInfo.getId());
			return "strollerWrite";
		} else if (loginInfo.getId().equals("test")) {
			return "admin";
		} else {

			return "redirect:/doLogin";
		}
	}

	@Transactional
	@RequestMapping("/carWrite")
	private String carWrite(@RequestParam("b_title") String title, @RequestParam("how_much") Long price,
			@RequestParam("category") String category, @RequestParam("b_content") String content,
			@RequestParam("file") MultipartFile file, HttpSession session, Model model,
			RedirectAttributes redirectAttributes) {

		String userId = (String) session.getAttribute("userId");
		if (file.isEmpty()) {
			redirectAttributes.addFlashAttribute("message", "파일이 비어 있습니다.");
			return "redirect:/goCarWrite";
		}

		String uuid = UUID.randomUUID().toString();
		String filename = uuid + "_" + file.getOriginalFilename();
		Path path = Paths.get(savePath + filename);

		try (InputStream inputStream = file.getInputStream()) {
			Files.copy(inputStream, path, StandardCopyOption.REPLACE_EXISTING);

		} catch (IOException e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("message", "파일 업로드 실패.");
			return "redirect:/goCarWrite";
		}

		CarEntity carEntity = new CarEntity();
		carEntity.setCar_content(content);
		carEntity.setCar_cours("신청");
		carEntity.setCar_file(filename);
		carEntity.setCar_price(price);
		carEntity.setCar_title(title);
		carEntity.setId(userId);

		System.out.println("보여줘 너의 엔티티를 " + carEntity);

		LocalDateTime now = LocalDateTime.now();
		Timestamp timestamp = Timestamp.valueOf(now);
		carEntity.setCard_at(timestamp);

		carRepo.save(carEntity);

		return "index";
	}

	@RequestMapping("goCarDetail")
	public String carDetail(Long idx, Model model,HttpSession session) {
		List<CarEntity> car = carRepo.findAll();
		List<UserEntity> user = repo.findAll();
		String userId = (String) session.getAttribute("userId");
		if(!userId.equals("test")) {
			for (int i = 0; i < car.size(); i++) {
				for (int l = 0; l < user.size(); l++) {
					if (user.get(l).getId().equals(car.get(i).getId())) {
						model.addAttribute("id", user.get(l).getId());
			
					}
				}
			} 
				
			
		} else {
			model.addAttribute("id", "test");
		}
		
		
		
		
		for (int i = 0; i < car.size(); i++) {
			if (car.get(i).getCar_idx().equals(idx)) {
				model.addAttribute("car", car.get(i));
				System.out.println("메롱메롱"+ car.get(i));
			for (int l = 0; l < user.size(); l++) {
				if (user.get(l).getId().equals(car.get(i).getId())) {
					model.addAttribute("id", user.get(l).getId());
					String duInfo = user.get(l).getUserFile();
					if (duInfo != null) {
						duInfo = "forComm/duInfo";
					} else {
						duInfo = "uploads/free-icon-person-4203951.png";
					}
					model.addAttribute("duInfo", duInfo);
				}
		}

		

		}

		
	}
		return "CarDetail";
}
}
