<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="/css/admin/productDetail.css">
<%-- ajax 사용을 위한 스크립트 추가 --%>
<script   src="https://code.jquery.com/jquery-3.6.0.min.js"   integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="   crossorigin="anonymous"></script>
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
                        <a class="admin_list" href="/admin/addProduct">물품 등록</a>
                    </li>
                    <li>
                        <a class="admin_list_selected" href="/admin/changeProduct">물품 관리</a>
                    </li>
                    <li>
                        <a class="admin_list" href="/admin/manageUser">회원 관리</a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="content_area">
            <div class="content_subject"><span>제품 상세</span></div>
            <form id="content_warp" action="/admin/productModify" method="post">
                <div class="content_section">
                    <div class="content_title">제품 번호</div>
                    <input class="content_box" name="productID" id="productID" value="<c:out value='${productDetail.productID}'></c:out>" readonly/>
                </div>
                <div class="content_section">
                    <div class="content_title">제품 이름</div>
                    <input class="content_box" type="text" name="productName" id="productName" value="<c:out value='${productDetail.productName}'></c:out>">
                </div>
                <div class="content_section">
                    <div class="content_title">브랜드 이름</div>
                    <input class="content_box" type="text" name="brandID" id="brandID" value="<c:out value='${productDetail.brandID}'></c:out>">
                </div>
                <div class="content_section">
                    <div class="content_title">제품 카테고리</div>
                    <input class="content_box" type="text" name="productCate" id="productCate" value="<c:out value='${productDetail.productCate}'></c:out>">
                </div>
                <div class="content_section">
                    <div class="content_title">제품 코드</div>
                    <input class="content_box" type="text" name="productCode" id="productCode" value="<c:out value='${productDetail.productCode}'></c:out>">
                </div>
                <div class="content_big_section">
                    <div class="content_title">제품 설명</div>
                    <textarea class="content_big_box" type="text" name="productDesc" id="productDesc" ><c:out value='${productDetail.productDesc}'></c:out></textarea>
                </div>
                <div class="submit_section">
                    <button class="submit_button" type="submit" class="btn btn-primary" value="false" onclick="return brandChangeCheck()" >확인</button>
                    <button class="submit_button" type="button" class="btn btn-primary" onclick="cancelPage()">취소</button>
                </div>
            </form>
            <form id="moveForm" method="get">
                <input type="hidden" name="brandID" value="${brandDetail.brandID}">
            	<input type="hidden" name="pageNum" value="${criteria.pageNum}">
            	<input type="hidden" name="pageAmount" value="${criteria.pageAmount}">
            	<input type="hidden" name="keyword" value="${criteria.keyword}">
            </form>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<script type="text/javascript">

    function cancelPage() {
        event.preventDefault();

        $("#page_brandID").remove();
        $('#moveForm').attr("action", "/admin/changeBrand");
        moveForm.submit();

    }

    function brandChangeCheck(){
        if(!content_warp.brandName.value.length && !content_warp.establishYear.value.length && !content_warp.brandDesc.value.length){
            alert("모든 항목을 입력해주세요.");
            return false;
        }
        if(content_warp.countryCode.value == '0'){
            alert("본사를 입력해주세요.");
            return false;
        }

        event.preventDefault();

        content_warp.submit();
    }

</script>
</body>
</html>
<!-- 하단 메뉴 -->
<%@ include file="/WEB-INF/view/include/footer.jsp" %>