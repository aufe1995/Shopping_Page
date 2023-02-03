<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/css/include/header.css">
<link rel="stylesheet" href="/css/home.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<!-- 상단 메뉴 -->
<%@ include file="/WEB-INF/view/include/header.jsp" %>

<head>
<meta charset="UTF-8">
<title>TOPTEN MALL</title>
</head>

	<!--  콘텐츠 -->
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide"><img src="/img/main_1.PNG"></div>
			<div class="swiper-slide"><img src="/img/main_2.png"></div>
			<div class="swiper-slide"><img src="/img/main_3.png"></div>
			<div class="swiper-slide"><img src="/img/main_4.png"></div>
			<div class="swiper-slide"><img src="/img/main_5.png"></div>
			<div class="swiper-slide"><img src="/img/main_6.png"></div>
			<div class="swiper-slide"><img src="/img/main_7.png"></div>
			<div class="swiper-slide"><img src="/img/main_8.png"></div>
			<div class="swiper-slide"><img src="/img/main_9.png"></div>
			<div class="swiper-slide"><img src="/img/main_10.png"></div>
			<div class="swiper-slide"><img src="/img/main_11.png"></div>
			<div class="swiper-slide"><img src="/img/main_12.png"></div>
			<div class="swiper-slide"><img src="/img/main_13.png"></div>
			<div class="swiper-slide"><img src="/img/main_14.png"></div>
		</div>

		<!-- 네비게이션 -->
		<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
		<div class="swiper-button-prev"></div><!-- 이전 버튼 -->

		<!-- 페이징 -->
		<div class="swiper-pagination"></div>
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

	<br>
	<div class="main1" style="text-align : center;"><img src="/img/site_img/size_site.png" alt="이미지"></div><br>
	<div class="main2" >
			<div class="site"><img src="/img/site_img/check_site.png" alt="이미지">
				<div class="main2_str">12월에도 매일 만나요</div><div>app으로 매일 출석체크 하세요</div><div>최대 20% 쿠폰 지급!</div></div>

			<div class="site"><img src="/img/site_img/drama_site.png" alt="이미지"><br>
				<div class="main2_str">셋셋남녀 AWARDS</div><div>공감 코미디 시트콤 부문 1위!</div><div>셋셋남녀 완결 기념 어워즈 이벤트 GO!</div></div>

			<div class="site"><img src="/img/site_img/cashmere_site.png" alt="이미지"><br>
				<div class="main2_str">우아하게 겨울나기</div><div>캐시 100%부터 블렌드까지</div><div>합리적으로 즐기는 캐시미어 아이템</div></div>

			<div class="site"><img src="/img/site_img/outer_site.png" alt="이미지"><br>
				<div class="main2_str">내가 찾던 #아우터</div><div>눈이와도 가볍고 따뜻하게!</div><div>TMAKER와 함께하는 설레는 겨울</div></div>
	</div>

	<br><br><br>

	<div class="main3_title">
		<div class="right_side"><div>고객님을 위한 추천 상품</div><div>12 items</div></div>
		<div class="left_side"><button style="float:left">←</button><div style="float:left">2/2</div><button style="float:left">→</button></div>
	</div>

		<div class="main3">
			<div class="clothes"><img alt="이미지" src="/img/main2_img/clothes1.png"><div>카테고리</div><div>물품이름</div><span>가격 </span><span>할인전가격 </span><span>할인 퍼센트</span></div>
			<div class="clothes"><img alt="이미지" src="/img/main2_img/clothes2.png"><div>카테고리</div><div>물품이름</div><span>가격 </span><span>할인전가격 </span><span>할인 퍼센트</span></div>
			<div class="clothes"><img alt="이미지" src="/img/main2_img/clothes3.png"><div>카테고리</div><div>물품이름</div><span>가격 </span><span>할인전가격 </span><span>할인 퍼센트</span></div>
			<div class="clothes"><img alt="이미지" src="/img/main2_img/clothes4.png"><div>카테고리</div><div>물품이름</div><span>가격 </span><span>할인전가격 </span><span>할인 퍼센트</span></div>
			<div class="clothes"><img alt="이미지" src="/img/main2_img/clothes5.png"><div>카테고리</div><div>물품이름</div><span>가격 </span><span>할인전가격 </span><span>할인 퍼센트</span></div>
			<div class="clothes"><img alt="이미지" src="/img/main2_img/clothes6.png"><div>카테고리</div><div>물품이름</div><span>가격 </span><span>할인전가격 </span><span>할인 퍼센트</span></div>
		</div>


<!-- 하단 메뉴 -->
<%@ include file="/WEB-INF/view/include/footer.jsp" %>