<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/css/user/login.css">
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<%-- ajax 사용을 위한 스크립트 추가 --%>
<script   src="https://code.jquery.com/jquery-3.6.0.min.js"   integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="   crossorigin="anonymous">
</script>
</head>
<body>
<div class="wrapper">

    <div class="wrap">

        <div class="title_area">
            <span>로그인</span>
        </div>

        <hr class="boundary">

        <div class="login_content">

            <form class="login_wrap" action="/user/loginAction.do" method="post">

                <c:if test="${result == 0}">
                    <div class="login_warning" id="login_warning">아이디 혹은 비밀번호를 확인해주세요.</div>
                </c:if>

                <div class="input_box">
                    <input class="input" type="text" id="userID" name="userID" placeholder="아이디">
                    <input class="input" type="password" id="userPW" name="userPW" placeholder="비밀번호">
                </div>

                <button class="login_submit" type="submit">로그인</button>

            </form>

            <div class="account_wrap">
                <button class="account_button" type="button" onclick="location.href='/preparing'">계정 찾기</button>
                <button class="account_button" type="button" onclick="location.href='/user/join'">회원가입</button>
            </div>

            <div class="clearfix"></div>

        </div>
    </div>
</div>
<script type="text/javascript">
    <%-- 아이디 입력 값이 입력됐을 때 --%>
    $('#userID').keyup(function() {
        $('#login_warning').hide();
    });
</script>
</body>
</html>
<%@ include file="/WEB-INF/view/include/footer.jsp" %>