package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.entity.CommEntity;
import com.project.repository.CommRepository;
import com.project.repository.UserRepository;

@Controller
public class CommController {

	@Autowired
	private CommRepository com_repo;
	
	@RequestMapping("/goComm")
	public String goComm() {
		return "CommMain";
	}
	
	@RequestMapping("/goCommWrite")
	public String commWrite() {
		return "CommWrite";
	}
	
	@RequestMapping("/commContent")
	public String commContent(CommEntity comm_info,
							@RequestParam("cb_title") String title,
							@RequestParam("cb_content") String content,
							@RequestParam("cb_file") String file) {
		
		// DB에 저장하기 위해 항목별 데이터 입력
		comm_info.setCb_title(title);
		comm_info.setCb_content(content);
		comm_info.setCb_file(file);
		
		if(comm_info != null) {
			System.out.println("DB 저장 완료!");
			return "CommMain";
		}else {
			System.out.println("DB 저장 에러!");
			return "CommWrite";
		}
	}
}
