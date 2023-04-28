<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>브랜드 선택</title>
<link rel="stylesheet" href="/css/admin/brandPop.css">
<script   src="https://code.jquery.com/jquery-3.6.0.min.js"   integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="   crossorigin="anonymous"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
</head>
<body>
    <div class="content_area">
        <div class="content_subject"><span>브랜드 관리</span></div>

        <div class="content_wrap">
        <!-- 검색 -->
            <div class="search_wrap">
                <form id="search_form" action="/admin/brandPop" method="get">
                    <input type="hidden" name="pageNum" id="pageNum" value='<c:out value="${pageMaker.criteria.pageNum }"></c:out>'>
                    <input type="hidden" name="pageAmount" id="pageAmount" value='${pageMaker.criteria.pageAmount}'>
                    <input type="text" name="keyword" id="keyword" value='<c:out value="${pageMaker.criteria.keyword}"></c:out>'>
                    <button class="search_btn" onclick="return searchCheck()"> 검색 </button>
                </form>
            </div>

            <div class="clearfix"></div>

            <!-- 게시물 있을 경우 -->
            <c:if test="${listEmpty != 'empty'}">
                <table class="brand_table">
                    <thread>
                        <tr>
                            <td class="brand_num">번호</td>
                            <td class="brand_name">브랜드 이름</td>
                            <td class="brand_country">본사</td>
                        </tr>
                    <thread>
                    <c:forEach items="${list}" var="list">
                        <tr>
                            <td><c:out value="${list.brandID}"/></td>
                            <td>
                                <a class="move" href='<c:out value="${list.brandID}"/>' data-name='<c:out value="${list.brandName}"/>'>
                                    <c:out value="${list.brandName}"/>
                                </a>
                            </td>
                            <td><c:out value="${list.countryCode}"/></td>
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
            
            <form id="page_form" action="/admin/brandPop" method="get">
            	<input type="hidden" name="pageNum" value="${pageMaker.criteria.pageNum}">
            	<input type="hidden" name="pageAmount" value="${pageMaker.criteria.pageAmount}">
            	<input type="hidden" name="keyword" value="${pageMaker.criteria.keyword}">
            </form>
        </div>

<script>

    $(".page_btn a").on("click", function() {

        event.preventDefault();

        $('#page_form').find("input[name='pageNum']").val($(this).attr("href"));

        page_form.submit();

    });

    $(".move").on("click", function() {

        event.preventDefault();

        let brandID = $(this).attr("href");
        let brandName = $(this).data("name");
        $(opener.document).find("#brandID").val(brandID);
        $(opener.document).find("#brandName").val(brandName);

        window.close();

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