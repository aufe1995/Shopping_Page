<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

			<div class="login_area">
                <div class="login_button" onclick="location.href='/user/login'">로그인</a></div>
            </div>
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

	</div>

</div>
</body>
</html>