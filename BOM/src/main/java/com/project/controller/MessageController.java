package com.project.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.entity.CarEntity;
import com.project.entity.DealEntity;
import com.project.entity.MessageEntity;
import com.project.entity.UserEntity;
import com.project.repository.DealRepository;
import com.project.repository.MessageRepository;
import com.project.repository.UserRepository;


@Controller
public class MessageController {

	@Autowired
	private DealRepository dealRepo;

	@Autowired
	private UserRepository repo;

	@Autowired
	private MessageRepository meRepo;

	// 쪽지함 보여주는 메서드
	@RequestMapping("/messageList")
	private String messageList(Model model, HttpSession session) {
		List<MessageEntity> list = meRepo.findAllOrderBySendAtDesc();
		String userId = (String) session.getAttribute("userId");

		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getAccept_m().equals(userId)) {
				model.addAttribute("list", list.get(i));
			}
		}
		
		//여기 안에 보낸 메세지 로직 추가

		
		
		return "message";
	}

	// 메세지 디테일 메서드
	@RequestMapping("/receiveMessage")
	private String receiveMessage(Model model, HttpSession session, Long idx) {
		List<MessageEntity> list = meRepo.findAllOrderBySendAtDesc();
		String userId = (String) session.getAttribute("userId");

		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getM_idx().equals(idx)) {
				model.addAttribute("list", list.get(i));
			}
		}
		return "";
	}

	// 메세지 작성하러가는 메서드
	@RequestMapping("/smessage")
	private String smessage(HttpSession session, Model model, Long idx) {
		String userId = (String) session.getAttribute("userId");
		model.addAttribute("id", userId);
		Optional<DealEntity> optionalEntity = dealRepo.findById(idx);
	 
		if (optionalEntity.get().getB_idx().equals(idx)){
			model.addAttribute("write", optionalEntity.get().getId());
		}
		
		
			
		return "messageWrite";
	}
	
	
	// 메세지 보내는 메서드
	@RequestMapping("/sendMessage")
	private String sendMessage(HttpSession session,
			@RequestParam("m_title") String title,
			@RequestParam("m_content") String content,
			@RequestParam("accept_m") String accept,
			Model model
			) {
		String userId = (String) session.getAttribute("userId");
		
		MessageEntity msEntity = new MessageEntity();
		msEntity.setM_content(content);
		msEntity.setSend_m(userId);
		msEntity.setM_title(title);
		msEntity.setAccept_m(accept);
	
		LocalDateTime now = LocalDateTime.now();
		Timestamp timestamp = Timestamp.valueOf(now);
		msEntity.setSend_at(timestamp);

		meRepo.save(msEntity);
		
		
		
		return "";
		
	}
	
	
	
	
	
	
}