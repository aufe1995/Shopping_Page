package com.gold.Controller;

import com.gold.service.UserService;
import com.gold.user.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

	@GetMapping
	public String login() {
		return "login";
	}

	//로그인 실패시
	@GetMapping("/access_denied")
	public String accessDenied() {
		return "access_denied";
	}

	//유저 페이지
	@GetMapping("/user_access")
	public String userAccess(Model model, Authentication authentication){
		UserVO userVO = (UserVO) authentication.getPrincipal();
		model.addAttribute("info", userVO.getUserID() + "의 " + userVO.getUserName()+"님");
		return "user_access";
	}

	@GetMapping("/signup")
	public String signUpForm() { return "signup"; }

	@PostMapping("/signUp")
	public String signUp(UserVO userVO) {
		userService.joinUser(userVO);
		return "redirect:/login";
	}



}
