<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/css/include/header.css">
<link rel="stylesheet" href="/css/login.css">

<%@ include file="/WEB-INF/view/include/header.jsp" %>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>


    <div id="main">로그인</div>
    <hr id="mainLine">
    <div style="white-space: nowrap;">
        <form id="loginDiv" action="/login/action" method="post">
            <div class="inputDiv"><input id="input" type="text" name="userID" placeholder="아이디"></div>
            <div class="inputDiv"><input id="input" type="password" name="userPW" placeholder="비밀번호"></div>
            <button id="loginBtn" type="submit">로그인</button>
            <div id="findDiv">
                <button class="findBtn" type="button" onclick="location.href='/'">아이디 찾기</button>
                <button class="findBtn" type="button" onclick="location.href='/'">비밀번호 찾기</button>
            </div>
        </form>


        <div id="line"></div>
        <div id="signupDiv">
            <button class="signupBtn" type="button" onclick="location.href='/signup'">회원가입</button>
        </div>

    </div>