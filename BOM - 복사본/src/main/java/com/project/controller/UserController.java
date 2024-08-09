package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 이 클래스는 Controller임을 알리는 Annotation
@Controller
public class UserController {

	@RequestMapping("/")
	public String main() {
		return "main";
	}
	
	@RequestMapping("/Join")
	public void Join() {
		// JPA(Java Persistence API)
		// : Java DB를 위한 API
		// : 구현된 클래스와 매핑을 할 때 사용되는 프레임워크
		// : Sql 사용 지양(Sql 구문 작성 필요 없음)
	}
	
}
