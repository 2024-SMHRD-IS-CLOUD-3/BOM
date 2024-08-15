package com.project.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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

	@Value("${file.upload-dir.board}")
	private String savePath;

	@Autowired
	private DealRepository dealRepo;

	@Autowired
	private UserRepository repo;

	@Autowired
	private CarRepository carRepo;

	@RequestMapping("/car_main")
	private String carMain(Model model, DealEntity entity) {

		List<CarEntity> carList = carRepo.findAllOrderByCarIdxDesc();

		model.addAttribute("car", carList);
		System.out.println(carList);
		return "Car_main";
	}
	
	

	@RequestMapping("/goCarWrite")
	private String goCarWrite(HttpSession session) {
		UserEntity loginInfo = (UserEntity) session.getAttribute("LoginInfo");

		if (loginInfo.getId() == null) {
			return "redirect:/car_main";
		} else if (loginInfo.getId().equals("test")) {
			return "CarWrite";
		} else {
			return "car_main";
		}

	}

	@RequestMapping("/carWrite")
	private String carWrite(@RequestParam("car_title") String car_title, @RequestParam("car_price") Long car_price,
			 @RequestParam("car_content") String car_content,
			@RequestParam("file") MultipartFile file, @RequestParam("car_rank") String car_rank,
			@RequestParam("car_cours") String car_cours, HttpSession session, Model model) {

		String userId = (String) session.getAttribute("userId");
		if (file.isEmpty()) {

			return "redirect:/car_Write";
		}

		String uuid = UUID.randomUUID().toString();
		String filename = uuid + "_" + file.getOriginalFilename();
		Path path = Paths.get(savePath + filename);

		try {
			Files.copy(file.getInputStream(), path);
		} catch (IOException e) {
			e.printStackTrace();

			return "redirect:/goCarWrite";
		}

		CarEntity entity = new CarEntity();
		entity.setCar_title(car_title);
		entity.setCar_price(car_price);
		entity.setCar_rank(car_rank);
		entity.setCar_content(car_content);
		entity.setCar_file(filename);
		entity.setCar_cours(car_cours);

		LocalDateTime now = LocalDateTime.now();
		Timestamp timestamp = Timestamp.valueOf(now);
		entity.setCard_at(timestamp);

		carRepo.save(entity);

		return "redirect:/car_main";
	}

	@RequestMapping("goCarDetail")
	public String carDetail(Long idx, Model model) {
		List<CarEntity> car = carRepo.findAll();
		List<UserEntity> user = repo.findAll();

		for (int i = 0; i < car.size(); i++) {
			if (car.get(i).getCar_idx().equals(idx)) {

				model.addAttribute("car", car.get(i));
			}
		}

		for (int l = 0; l < user.size(); l++) {
			if (user.get(l).getId().equals("test")) {

				String duInfo = user.get(l).getUserPp();
				if (duInfo != null) {
					duInfo = "forComm/duInfo";
				} else {
					duInfo = "uploads/free-icon-person-4203951.png";
				}
				model.addAttribute("duInfo", duInfo);
			}

		}

		return "CarDetail";
	}
}
