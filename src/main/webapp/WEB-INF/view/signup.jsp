<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/css/include/header.css">
<%@ include file="/WEB-INF/view/include/header.jsp" %>

<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<div>회원가입</div>
        <form method="post" action="/signUp">
            <div id="userid">
                <div>아이디</div>
                <input type="text" placeholder="아이디" name="userID" maxlength="20">
                <button>중복확인</button>
            </div>

            <div id="password">
                <div>비밀번호</div>
                <input type="text" placeholder="비밀번호" name="userPW" maxlength="20">
            </div>

            <div id="passcheck">
                <div>비밀번호 확인</div>
                <input type="text" placeholder="비밀번호 확인" name="pwCheck" maxlength="20">
            </div>

            <div id="name">
                <div>이름</div>
                <input type="text" placeholder="이름" name="userName" maxlength="20">
            </div>

            <div id="RRN">
                <div>주민번호</div>
                <input type="text" placeholder="주민번호" name="userRRN" maxlength="20">
            </div>

            <div id="phone">
                <div>전화번호</div>
                <input type="text" placeholder="전화번호" name="userPhone" maxlength="20">
            </div>

            <div id="email">
                <div>메일</div>
                <input type="text" placeholder="이메일" name="userEmail" maxlength="50">
            </div>

            <div id="address">
                <div>주소</div>
                <input type="text" placeholder="주소" name="userADR" maxlength="100">
            </div>

            <div>
                <button type="submit" value="회원가입">확인</button>
            </div>
        </form>
<button onclick="location.href='/login'">취소</button>

</html>