<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

	<div class="header">
		<div class="header1">
			<a href="/"><img src="/img/logo.png" alt="이미지" onclick="location.href='/'"> </a>
		</div>
		
		
		<div style="width:87%">
			<div class="search_item"><input type="text" placeholder="검색어를 입력하세요." name="item">
				<button>검색</button></div>
		</div>
		

			
		<div class="menu">
			<div>
				<button>랭킹</button>
				<button>남성</button>
				<button>여성</button>
				<button>아동</button>
				<button>기획전</button>
				<button>이벤트</button>
				<button>베스트리뷰</button>
				<nav id="login">
				    <sec:authorize access="isAnonymous()">
                        <button onclick="location.href='/login'">LOGIN</button>
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                        <div><sec:authentication property="name" />님 환영합니다. <button onclick="location.href='/logout'">LOGOUT</button></div>
                    </sec:authorize>
				</nav>
			</div>
		</div>
		


	</div>

