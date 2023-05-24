package com.gold.Controller;

import com.fasterxml.jackson.databind.ObjectMapper;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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

    @GetMapping("/admin/brandDetail")
    public void brandDetailPage(int brandID, Criteria criteria, Model model) throws Exception {

        model.addAttribute("criteria", criteria);

        model.addAttribute("brandDetail", brandService.brandGetDetail(brandID));

    }

    @PostMapping("/admin/brandModify")
    public String brandModifyAction(BrandVo brandVo, RedirectAttributes rttr) throws Exception {

        logger.info(">>>>>>>>>>>>>>>>>>> 브랜드 정보 수정");

        brandService.brandModify(brandVo);

        return "redirect:/admin/changeBrand";
    }

    @PostMapping("/admin/brandDelete")
    public String brandDeleteAction(int brandID, RedirectAttributes rttr) throws Exception {

        logger.info(">>>>>>>>>>>>>>>>>>> 물품 정보 삭제");

        int result = brandService.brandDelete(brandID);

        rttr.addFlashAttribute("delete_result", result);

        return "redirect:/admin/changeBrand";
    }


    //물품 등록 페이지
    @GetMapping("/admin/addProduct")
    public String AddProductPage(Model model) throws Exception{

        logger.info(">>>>>>>>>>>>>>>>>>> 관리자 물품 등록 페이지 진입");

        ObjectMapper objectMapper = new ObjectMapper();

        List list = productService.cateList();

        String cateList = objectMapper.writeValueAsString(list);

        model.addAttribute("cateList",cateList);

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

    @GetMapping("/admin/brandPop")
    public void brandChoice(Criteria criteria, Model model) throws Exception {
        logger.info(">>>>>>>>>>>>>>>>>>> 브랜드 선택 페이지 진입");

        List list = brandService.brandGetList(criteria);

        if(!list.isEmpty()){
            model.addAttribute("list", list);
        }else{
            model.addAttribute("listEmpty", "empty");
        }

        model.addAttribute("pageMaker", new PageMaker(criteria, brandService.brandGetTotal(criteria)));


    }

    //물품 수정 페이지
    @GetMapping("/admin/changeProduct")
    public String changeProductPage(Criteria criteria, Model model) throws Exception {

        logger.info(">>>>>>>>>>>>>>>>>>> 관리자 물품 수정 페이지 진입");

        List list = productService.productGetList(criteria);

        if(!list.isEmpty()){
            model.addAttribute("list", list);
        }else{
            model.addAttribute("listEmpty", "empty");
        }

        model.addAttribute("pageMaker", new PageMaker(criteria, productService.productGetTotal(criteria)));

        return "admin/changeProduct";
    }


    @GetMapping("/admin/productDetail")
    public void productDetailPage(int productID, Criteria criteria, Model model) throws Exception {

        model.addAttribute("criteria", criteria);

        model.addAttribute("productDetail", productService.productGetDetail(productID));

        ObjectMapper objectMapper = new ObjectMapper();

        List list = productService.cateList();

        String cateList = objectMapper.writeValueAsString(list);

        model.addAttribute("cateList",cateList);
    }

    @PostMapping("/admin/productModify")
    public String productModifyAction(ProductVo productVo) throws Exception {

        logger.info(">>>>>>>>>>>>>>>>>>> 물품 정보 수정");

        productService.productModify(productVo);

        return "redirect:/admin/changeProduct";
    }

    @PostMapping("/admin/productDelete")
    public String productDeleteAction(int productID, RedirectAttributes rttr) throws Exception {

        logger.info(">>>>>>>>>>>>>>>>>>> 물품 정보 삭제");

        int result = productService.productDelete(productID);

        rttr.addFlashAttribute("delete_result", result);

        return "redirect:/admin/changeProduct";
    }

    /* 첨부 파일 업로드 */
    @PostMapping("/admin/uploadAjaxAction")
    public void uploadAjaxActionPOST(MultipartFile[] uploadFile) {

        logger.info("uploadAjaxActionPOST..........");
        //업로드 폴더 지정
        String uploadFolder = "C:\\projects\\Shopping_Page\\src\\main\\webapp\\WEB-INF\\img";
        //날짜를 지정된 형식의 문자열 데이터로 생성하기 위해서 사용
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        //오늘의 날짜 데이터를 얻기 위해서 Date 클래스 타입의 변수를 선언 및 초기화
        Date date = new Date();
        //"yyyy-MM-dd" 형식의 문자열로 변환
        String str = simpleDateFormat.format(date);
        //str 변수의 값의 문자열 중 '-'을 File.separator로 변경
        String datePath = str.replace("-", File.separator);
        //디렉터리를 대상으로 하는 File 객체로 초기화
        File uploadPath = new File(uploadFolder, datePath);
        //폴더가 없을 경우 폴더 생성
        if(uploadPath.exists() == false) {
            uploadPath.mkdirs();
        }

        for(MultipartFile multipartFile:uploadFile){

            /* 파일 이름 */
            String uploadFileName = multipartFile.getOriginalFilename();

            /* uuid 적용 파일 이름 */
            String uuid = UUID.randomUUID().toString();

            uploadFileName = uuid + "_" + uploadFileName;


            /* 파일 위치, 파일 이름을 합친 File 객체 */
            File saveFile = new File(uploadPath, uploadFileName);

            /* 파일 저장, IOException와 IllegalStateException을 일으킬 가능성이 있기 때문에 try catch문 사용*/
            try {
                multipartFile.transferTo(saveFile);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }


    }

    //회원 관리 페이지
    @GetMapping("/admin/manageUser")
    public String manageUserPage() {

        logger.info(">>>>>>>>>>>>>>>>>>> 관리자 회원 관리 페이지 진입");

        return "admin/manageUser";
    }


}
