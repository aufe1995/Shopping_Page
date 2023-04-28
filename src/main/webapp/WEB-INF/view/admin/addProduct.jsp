<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="/css/admin/addProduct.css">
<script   src="https://code.jquery.com/jquery-3.6.0.min.js"   integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="   crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/37.0.1/classic/ckeditor.js"></script>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
</head>
<body>
<div class="wrapper">
    <div class="wrap">

        <div class="title_area">
            <span>관리자 페이지</span>
        </div>

        <hr class="boundary">

        <div class="navi_bar_area">
            <div class="admin_navi_wrap">
                <ul>
                    <li>
                        <a class="admin_list" href="/admin/addBrand">브랜드 등록</a>
                    </li>
                    <li>
                        <a class="admin_list" href="/admin/changeBrand">브랜드 관리</a>
                    </li>
                    <li>
                        <a class="admin_list_selected" href="/admin/addProduct">물품 등록</a>
                    </li>
                    <li>
                        <a class="admin_list" href="/admin/changeProduct">물품 관리</a>
                    </li>
                    <li>
                        <a class="admin_list" href="/admin/manageUser">회원 관리</a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="content_area">
            <div class="content_subject"><span>물품 등록</span></div>
            <form id="content_warp" method="post" action="/admin/addProductAction.do">
                <div class="content_section">
                    <div class="content_title">물품 이름</div>
                    <input class="content_box" type="text" name="productName" id="productName">
                </div>
                <div class="content_section">
                    <div class="content_title">브랜드</div>
                    <input class="content_small_section" name="brandName" id="brandName"  readonly="readonly">
                    <input name="brandID" id="brandID" type="hidden">
                    <button class="brand_btn" onclick="popUp()">브랜드 선택</button>
                </div>
                <div class="content_section">
                    <div class="content_title">카테고리</div>
                    <input class="content_box" type="text" name="productCate" id="productCate">
                </div>
                <div class="content_section">
                    <div class="content_title">제품코드</div>
                    <input class="content_box" type="text" name="productCode" id="productCode">
                </div>
                <div class="content_big_section">
                    <div class="content_title">제품설명</div>
                    <textarea type="text" name="productDesc" id="productDesc"></textarea>
                </div>
                <div class="submit_section">
                    <button class="submit_button" type="submit" class="btn btn-primary" value="false" onclick="return productAddCheck()" >확인</button>
                    <button class="submit_button" type="button" class="btn btn-primary" onclick="location.href='/admin'">취소</button>
                </div>
            </form>

        </div>
        <div class="clearfix"></div>
    </div>
</div>
<script type="text/javascript">

    function productAddCheck(){
        if(!content_warp.productName.value.length && !content_warp.productCode.value.length && !content_warp.productCate.value.length){
            alert("모든 항목을 입력해주세요.");
            return false;
        }
        if(content_warp.brandID.value.length == '0'){
            alert("모든 항목을 입력해주세요.");
            return false;
        }

    }

    function popUp() {

        event.preventDefault();

        let popUrl = "/admin/brandPop";
        let popOption = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";

        window.open(popUrl,"브랜드 선택",popOption);

    }

    ClassicEditor
        .create(document.querySelector('#productDesc'))
        .catch(error=>{
    	    console.error(error);
        });

</script>
</body>
</html>
<!-- 하단 메뉴 -->
<%@ include file="/WEB-INF/view/include/footer.jsp" %>