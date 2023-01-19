package com.gold.Controller;

import com.gold.service.UserService;
import com.gold.user.UserVo;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
public class MainController {
	@Autowired
	UserService userService;

	//홈페이지
	@GetMapping("/")
	public String index() {
		return "home";
	}

	//구현 준비중인 페이지
	@GetMapping("/otherpage")
	public String otherPage() {
		return "otherpage";
	}

	//로그인 페이지
	@GetMapping("/login")
	public String login(@NotNull Model model, @RequestParam(value = "error", required = false) String error, @RequestParam(value = "exception", required = false) String exception) {
		model.addAttribute("error", error);
		model.addAttribute("exception", exception);
		return "login";
	}

	@PostMapping("/login/action")
	public String loginAction() {
		return "redirect:/";
	}

	//회원가입 페이지
	@GetMapping("/signup")
	public String signUpForm() { return "signup"; }

	//회원가입 실행 시
	@PostMapping("/signup/action")
	public String signUp(UserVo userVO) {
		userService.joinUser(userVO);
		return "redirect:/";
	}

	@ResponseBody
	@PostMapping("/idCheck")
	public int idCheck(String userID) throws Exception {
		int result = userService.idCheck(userID);
		return result;
	}

}
