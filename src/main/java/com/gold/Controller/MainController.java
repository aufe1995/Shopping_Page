package com.gold.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("/")
	public String index() {
		return "home";
	}
	
	@GetMapping("/otherpage")
	public String otherpage() {
		return "otherpage";
	}

}
