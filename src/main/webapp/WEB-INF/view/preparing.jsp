<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<link rel="stylesheet" href="/css/preparing.css">

<html>
<head>
<meta charset="UTF-8">
<title>준비중</title>
</head>
<body>
<div class="wrapper">
    <div class="wrap">
        <div class="content_warp">
            <div class="content_box">
                <span>현재 페이지는 준비중입니다.</span>
                <button class="content_button" onclick="location.href='/'">처음으로</button>
                <button class="content_button" onclick="javascript:history.back();">이전으로</button>
            </div>

        </div>
    </div>
</div>
</body>
</html>
<!-- 하단 메뉴 -->
<%@ include file="/WEB-INF/view/include/footer.jsp" %>