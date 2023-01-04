package com.gold.Controller;

import com.gold.service.UserService;
import com.gold.user.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MainController {
	@Autowired
	UserService userService;
	
	@GetMapping("/")
	public String index() {
		return "home";
	}
	
	@GetMapping("/otherpage")
	public String otherPage() {
		return "otherpage";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@GetMapping("/signup")
	public String signUpForm() { return "signup"; }

	@PostMapping("/signUp")
	public String signUp(UserVO userVO) {
		userService.joinUser(userVO);
		return "login";
	}

	@GetMapping("/join_db")
	public String join_db() {return "join_db";}

}
