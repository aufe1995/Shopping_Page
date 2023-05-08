<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="/css/admin/changeProduct.css">
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
            <div class="content_subject"><span>물품 관리</span></div>
                <div class="content_wrap">
                    <!-- 검색 -->
                    <div class="search_wrap">
                        <form id="search_form" action="/admin/changeProduct" method="get">
                            <input type="hidden" name="pageNum" id="pageNum" value='<c:out value="${pageMaker.criteria.pageNum}"></c:out>'>
                            <input type="hidden" name="pageAmount" id="pageAmount" value='${pageMaker.criteria.pageAmount}'>
                            <input type="text" name="keyword" id="keyword" value='<c:out value="${pageMaker.criteria.keyword}"></c:out>'>
                            <button class="search_btn" onclick="return searchCheck()"> 검색 </button>
                        </form>
                    </div>

                    <div class="clearfix"></div>

                    <!-- 게시물 있을 경우 -->
                    <c:if test="${listEmpty != 'empty'}">
                        <table class="product_table">
                            <!-- 제품 테이블 제목 -->
                            <thread>
                                <tr>
                                    <td class="product_num">번호</td>
                                    <td class="product_name">제품 이름</td>
                                    <td class="product_cate">제품 카테고리</td>
                                    <td class="brand_id">브랜드 아이디</td>
                                    <td class="product_code">제품 코드</td>
                                </tr>
                            <thread>
                            <!-- 제품 테이블 내용 -->
                            <c:forEach items="${list}" var="list">
                                <tr>
                                    <td><c:out value="${list.productID}"/></td>
                                        <td>
                                            <a class="move" href='<c:out value="${list.productID}"/>'>
                                                <c:out value="${list.productName}"/>
                                            </a>
                                        </td>
                                    <td><c:out value="${list.productCate}"/></td>
                                    <td><c:out value="${list.brandID}"/></td>
                                    <td><c:out value="${list.productCode}"/></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>

                    <!-- 게시물 없을 경우 -->
                    <c:if test="${listEmpty == 'empty'}">
                        <div class="empty">등록된 브랜드가 없습니다.</div>
                    </c:if>
                </div>

                <div class="page_wrap">
                    <ul class="page_content">

                        <!-- 이전 버튼 -->
                        <c:if test="${pageMaker.prev}">
                            <li class="page_btn prev">
                                <a href="${pageMaker.pageStart - 1}">이전</a>
                            </li>
                        </c:if>

                        <!-- 페이지 번호 -->
                        <c:forEach begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd}" var="num">
                            <li class="page_btn ${pageMaker.criteria.pageNum == num ? " active":""}">
                                <a href="${num}">${num}</a>
                            </li>
                        </c:forEach>

                        <!-- 다음 버튼 -->
                        <c:if test="${pageMaker.next}">
                            <li class="page_btn next">
                                <a href="${pageMaker.pageEnd + 1}">다음</a>
                            </li>
                        </c:if>
                    </ul>
                </div>

                <form id="page_form" action="/admin/changeProduct" method="get">
                    <input type="hidden" name="pageNum" value="${pageMaker.criteria.pageNum}">
                    <input type="hidden" name="pageAmount" value="${pageMaker.criteria.pageAmount}">
                    <input type="hidden" name="keyword" value="${pageMaker.criteria.keyword}">
                </form>
            </div>
        <div class="clearfix"></div>
    </div>
</div>
<script type="text/javascript">


    $(".page_btn a").on("click", function() {

        event.preventDefault();

        $('#page_form').find("input[name='pageNum']").val($(this).attr("href"));

        page_form.submit();

    });

    $(".move").on("click", function() {

        event.preventDefault();

        $('#page_form').append("<input type='hidden' name='productID' value='"+ $(this).attr("href") + "'>");

        $('#page_form').attr("action", "/admin/productDetail");

        page_form.submit();

    });

    function searchCheck() {

        event.preventDefault();

        if(!search_form.keyword.value.length){
            alert("검색어를 입력해주세요.");
            return false;
        }else{
            $('#pageNum').attr('value','1');
            search_form.submit();
        }

    }
</script>
</body>
</html>
<!-- 하단 메뉴 -->
<%@ include file="/WEB-INF/view/include/footer.jsp" %>