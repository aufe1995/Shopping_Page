<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="/css/admin/addBrand.css">

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
            <div class="admin_navi_warp">
                <ul>
                    <li>
                        <a class="admin_list_selected" href="/admin/addBrand">브랜드 등록</a>
                    </li>
                    <li>
                        <a class="admin_list" href="/admin/changeBrand">브랜드 관리</a>
                    </li>
                    <li>
                        <a class="admin_list" href="/admin/addProduct">물품 등록</a>
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
            <div class="content_subject"><span>브랜드 등록</span></div>
            <form id="content_warp" method="post" action="/admin/addBrandAction.do">
                <div class="content_section">
                    <div class="content_title">브랜드 이름</div>
                    <input class="content_box" type="text" name="brandName" id="brandName">
                </div>
                <div class="content_section">
                    <div class="content_title">본사</div>
                    <select class="content_box" name="countryCode" id="countryCode">
                        <option value="0" selected>------------------ 국가 선택 ------------------</option>
                        <option value="410">대한민국</option>
                        <option value="840">미국</option>
                        <option value="826">영국</option>
                        <option value="329">일본</option>
                        <option value="276">독일</option>
                        <option value="250">프랑스</option>
                        <option value="380">이탈리아</option>
                    </select>
                </div>
                <div class="content_section">
                    <div class="content_title">설립년도</div>
                    <input class="content_box" type="number" name="establishYear" id="establishYear" min="1000" max="2999">
                </div>
                <div class="content_section">
                    <div class="content_title">브랜드 설명</div>
                    <input class="content_box" type="text" name="brandDesc" id="brandDesc">
                </div>
                <div id="submit_section">
                    <button class="submit_button" type="submit" class="btn btn-primary" value="false" onclick="return brandAddCheck()" >확인</button>
                    <button class="submit_button" type="button" class="btn btn-primary" onclick="location.href='/admin'">취소</button>
                </div>
            </form>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<script type="text/javascript">

    function brandAddCheck(){
        if(!content_warp.brandName.value.length && !content_warp.establishYear.value.length && !content_warp.brandDesc.value.length){
            alert("모든 항목을 입력해주세요.");
            return false;
        }
        if(content_warp.countryCode.value == '0'){
            alert("모든 항목을 입력해주세요.");
            return false;
        }

    }

</script>
</body>
</html>
<!-- 하단 메뉴 -->
<%@ include file="/WEB-INF/view/include/footer.jsp" %>