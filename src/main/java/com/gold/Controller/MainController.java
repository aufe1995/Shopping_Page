package com.gold.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	//홈페이지
	@GetMapping("/")
	public String mainPage() {

		logger.info(">>>>>>>>>>>>>>>>>>> 홈페이지 진입");

		return "main";
	}

	//구현 준비중인 페이지
	@GetMapping("/preparing")
	public String preparingPage() {

		logger.info(">>>>>>>>>>>>>>>>>>> 미완성 페이지 진입");

		return "preparing";
	}



}
