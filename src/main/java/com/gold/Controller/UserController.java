package com.gold.Controller;

import com.gold.service.MailService;
import com.gold.service.UserService;
import com.gold.user.UserVo;
import org.jetbrains.annotations.NotNull;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class UserController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    UserService userService;

    @Autowired
    MailService mailService;

    //관리자 페이지
    @GetMapping("/admin")
    public String adminPage() {

        logger.info(">>>>>>>>>>>>>>>>>>> 관리자 페이지 진입");

        return "admin";
    }

    //로그인 페이지
    @GetMapping("/user/login")
    public String loginPage(@NotNull Model model, @RequestParam(value = "error", required = false) String error, @RequestParam(value = "exception", required = false) String exception) {
        model.addAttribute("error", error);
        model.addAttribute("exception", exception);

        logger.info(">>>>>>>>>>>>>>>>>>> 로그인 페이지 진입");

        return "user/login";
    }

    //회원가입 페이지
    @GetMapping("/user/join")
    public String joinPage() {

        logger.info(">>>>>>>>>>>>>>>>>>> 회원가입 페이지 진입");

        return "user/join";
    }

    //회원가입 실행 시
    @PostMapping("/join/action")
    public String joinAction(UserVo userVO) {

        userService.joinUser(userVO);

        logger.info(">>>>>>>>>>>>>>>>>>> 회원가입 완료");

        return "redirect:/user/login";
    }


    @ResponseBody
    @PostMapping("/idCheck")
    public int idCheck(String userID) throws Exception {

        int result = userService.idCheck(userID);

        logger.info(">>>>>>>>>>>>>>>>>>> 아이디 중복 확인");

        return result;
    }

    @ResponseBody
    @PostMapping("/mailCheck")
    public String mailCheck(String userMail) throws Exception {

        String result = mailService.sendSimpleMessage(userMail);

        logger.info(">>>>>>>>>>>>>>>>>>> 메일 인증 확인"+result);

        return result;
    }

    @PostMapping("/login/action")
    public String loginAction(HttpServletRequest request, HttpServletResponse response) {

        logger.info(">>>>>>>>>>>>>>>>>>> 로그인 실행");
        return "main";
    }

    @GetMapping("logout")
    public String logout(HttpServletRequest request, HttpServletResponse response){
        new SecurityContextLogoutHandler().logout(request, response, SecurityContextHolder.getContext().getAuthentication());
        logger.info(">>>>>>>>>>>>>>>>>>> 로그아웃 실행");
        return "redirect:/";
    }




}
