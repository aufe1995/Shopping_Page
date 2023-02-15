<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/include/header.css">
</head>
<body>
<div class="header">
	<div class="head">

		<div class="logo_area">
			<a href="/"><img src="/img/logo.png" alt="이미지" onclick="location.href='/'" height="60px"></a>

            <!-- 로그인 하지 않은 상태 -->
            <c:if test="${user == null}">
			<div class="login_area">
			    <div class="login_button" onclick="location.href='/user/login'">로그인</a></div>
            </div>
            </c:if>

            <!-- 유저 로그인 상태 -->
            <c:if test="${user.level > 0}">
			<div class="login_area">
                <div class="login_button" onclick="location.href='/logout'">로그아웃</a></div>
            </div>
            <div class="user_area">
                <div class="login_button" onclick="location.href='/preparing'">정보수정</a></div>
            </div>
            <div class="user_info">${user.userName}님 반갑습니다.</div>
            </c:if>

            <!-- 관리자 로그인 상태 -->
            <c:if test="${user.level == 0}">
			<div class="login_area">
                <div class="login_button" onclick="location.href='/logout'">로그아웃</a></div>
            </div>
            <div class="admin_area">
                <div class="login_button" onclick="location.href='/admin'">관리자 페이지</a></div>
            </div>
            </c:if>
		</div>

		<div class="search_area">
			<h1>Search area</h1>
		</div>

		<div class="menu_area">
			<button class="menu_button" onclick="location.href='/preparing'">랭킹</button>
			<button class="menu_button" onclick="location.href='/preparing'">남성</button>
			<button class="menu_button" onclick="location.href='/preparing'">여성</button>
			<button class="menu_button" onclick="location.href='/preparing'">아동</button>
			<button class="menu_button" onclick="location.href='/preparing'">기획전</button>
			<button class="menu_button" onclick="location.href='/preparing'">이벤트</button>
			<button class="menu_button" onclick="location.href='/preparing'">베스트리뷰</button>
		</div>

		<div class="clearfix"></div>
		<hr>

	</div>

</div>
</body>
</html>