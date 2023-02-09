<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WEB SHOPPING</title>
<link rel="stylesheet" href="/css/main.css">

<%@ include file="/WEB-INF/view/include/header.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
</head>
<body>
<div class="wrapper">
    <div class="wrap">

            <div class="navi_bar_area">
                <!--  콘텐츠 -->
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide"><img src="/img/main/eventpage1.png" onclick="location.href='/preparing'"></div>
                        <div class="swiper-slide"><img src="/img/main/eventpage2.png" onclick="location.href='/preparing'"></div>
                        <div class="swiper-slide"><img src="/img/main/eventpage3.png" onclick="location.href='/preparing'"></div>
                    </div>

                    <!-- 네비게이션 -->
                    <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
                    <div class="swiper-button-prev"></div><!-- 이전 버튼 -->

                    <!-- 페이징 -->
                    <div class="swiper-pagination"></div>
                </div>
            </div>

            <div class="content_area">
                    <h1>관리자 페이지</h1>
            </div>

    </div>
</div>

<script>
new Swiper('.swiper-container', {

	slidesPerView : 1, // 동시에 보여줄 슬라이드 갯수
	spaceBetween : 30, // 슬라이드간 간격
	slidesPerGroup : 1, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

	loopFillGroupWithBlank : true,

	loop : true, // 무한 반복

	pagination : { // 페이징
		el : '.swiper-pagination',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	},
	navigation : { // 네비게이션
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},
});

</script>
</body>
</html>
<!-- 하단 메뉴 -->
<%@ include file="/WEB-INF/view/include/footer.jsp" %>