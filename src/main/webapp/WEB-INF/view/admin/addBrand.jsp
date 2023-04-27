<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="/css/admin/addBrand.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
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
                    <div class="content_title">설립날짜</div>
                    <input class="content_small_section" type="text" name="establishYear" id="establishYear" autocomplete="off" readonly="readonly">
                </div>
                <div class="content_big_section">
                    <div class="content_title">브랜드 설명</div>
                    <textarea class="content_big_box" type="text" name="brandDesc" id="brandDesc"></textarea>
                </div>
                <div class="submit_section">
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
        if(!content_warp.brandName.value.length && !content_warp.brandDesc.value.length){
            alert("모든 항목을 입력해주세요.");
            return false;
        }
        if(content_warp.countryCode.value == '0'){
            alert("모든 항목을 입력해주세요.");
            return false;
        }
        if(content_warp.establishYear.value.length == '0'){
            alert("모든 항목을 입력해주세요.");
            return false;
        }
    }

    const config = {
        dateFormat: 'yy-mm-dd',
        showOn : "button",
        buttonText:"날짜 선택",
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNames: ['일','월','화','수','목','금','토'],
        dayNamesShort: ['일','월','화','수','목','금','토'],
        dayNamesMin: ['일','월','화','수','목','금','토'],
        yearSuffix: '년',
        changeMonth: true,
        changeYear: true
    }

    /* 캘린더 위젯 적용 */
    $(function() {
      $( "input[name='establishYear']" ).datepicker(config);
    });

</script>
</body>
</html>
<!-- 하단 메뉴 -->
<%@ include file="/WEB-INF/view/include/footer.jsp" %>