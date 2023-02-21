package com.gold.Controller;

import com.gold.model.Criteria;
import com.gold.model.PageMaker;
import com.gold.service.BrandService;
import com.gold.service.ProductService;
import com.gold.model.BrandVo;
import com.gold.model.ProductVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class AdminController {

    private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

    @Autowired
    private BrandService brandService;

    @Autowired
    private ProductService productService;

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

    //브랜드 등록 실행
    @PostMapping("/admin/addBrandAction.do")
    public String addBrandAction(BrandVo brandVo, RedirectAttributes rttr) throws Exception {

        logger.info(">>>>>>>>>>>>>>>>>>> 브랜드 등록 실행");

        brandService.addBrand(brandVo);

        rttr.addFlashAttribute("add_result", brandVo.getBrandName());

        return "redirect:/admin";
    }

    //브랜드 수정 페이지
    @GetMapping("/admin/changeBrand")
    public String changeBrandPage(Criteria criteria, Model model) throws Exception {

        logger.info(">>>>>>>>>>>>>>>>>>> 관리자 브랜드 수정 페이지 진입");

        List list = brandService.brandGetList(criteria);

        if(!list.isEmpty()){
            model.addAttribute("list", list);
        }else{
            model.addAttribute("listEmpty", "empty");
        }

        model.addAttribute("pageMaker", new PageMaker(criteria, brandService.brandGetTotal(criteria)));

        return "admin/changeBrand";
    }

    //물품 등록 페이지
    @GetMapping("/admin/addProduct")
    public String AddProductPage() {

        logger.info(">>>>>>>>>>>>>>>>>>> 관리자 물품 등록 페이지 진입");

        return "admin/addProduct";
    }

    //물품 등록 실행
    @PostMapping("/admin/addProductAction.do")
    public String addProductAction(ProductVo productVo, RedirectAttributes rttr) throws Exception {

        logger.info(">>>>>>>>>>>>>>>>>>> 물품 등록 실행");

        productService.addProduct(productVo);

        rttr.addFlashAttribute("add_result", productVo.getProductName());

        return "redirect:/admin";
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
