package com.gold.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

    private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

    //관리자 페이지
    @GetMapping("/admin")
    public String adminPage() {

        logger.info(">>>>>>>>>>>>>>>>>>> 관리자 페이지 진입");

        return "admin/main";
    }

    //브랜드 등록 페이지
    @GetMapping("/admin/addBrand")
    public String addBrandPage() {

        logger.info(">>>>>>>>>>>>>>>>>>> 관리자 브랜드 등록 페이지 진입");

        return "admin/addBrand";
    }

    //브랜드 수정 페이지
    @GetMapping("/admin/changeBrand")
    public String changeBrandPage() {

        logger.info(">>>>>>>>>>>>>>>>>>> 관리자 브랜드 수정 페이지 진입");

        return "admin/changeBrand";
    }

    //물품 등록 페이지
    @GetMapping("/admin/addProduct")
    public String AddProductPage() {

        logger.info(">>>>>>>>>>>>>>>>>>> 관리자 물품 등록 페이지 진입");

        return "admin/addProduct";
    }

    //물품 수정 페이지
    @GetMapping("/admin/changeProduct")
    public String changeProductPage() {

        logger.info(">>>>>>>>>>>>>>>>>>> 관리자 물품 수정 페이지 진입");

        return "admin/changeProduct";
    }

    //회원 관리 페이지
    @GetMapping("/admin/manageUser")
    public String manageUserPage() {

        logger.info(">>>>>>>>>>>>>>>>>>> 관리자 회원 관리 페이지 진입");

        return "admin/manageUser";
    }
}
