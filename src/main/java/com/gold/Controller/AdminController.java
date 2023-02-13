package com.gold.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

public class AdminController {

    private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

    //관리자 페이지
    @GetMapping("/admin")
    public String adminPage() {

        logger.info(">>>>>>>>>>>>>>>>>>> 관리자 페이지 진입");

        return "admin/main";
    }
}
