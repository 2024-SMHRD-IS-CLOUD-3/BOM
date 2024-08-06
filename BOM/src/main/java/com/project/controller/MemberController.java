package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 이 클래스는 Controller임을 알리는 Annotation
@Controller
public class MemberController {

	@RequestMapping("/")
	public String main() {
		return "main";
	}
	
}
