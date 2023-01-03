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
<div id="userid"><div>아이디</div><input type="text" placeholder="아이디" name="userID"><button>중복확인</button></div>
<div id="password"><div>비밀번호</div><input type="text" placeholder="비밀번호" name="userPassword"></div>
<div id="passcheck"><div>비밀번호 확인</div><input type="text" placeholder="비밀번호 확인" name="passwordCheck"></div>
<div id="name"><div>이름</div><input type="text" placeholder="이름" name="userName"></div>
<div id="socialnum"><div>주민번호</div><input type="text" placeholder="주민번호" name="userSocialnum"></div>
<div id="phone"><div>전화번호</div><input type="text" placeholder="전화번호" name="userPhone"></div>
<div id="email"><div>메일</div><input type="text" placeholder="이메일" name="userEmail"></div>
<div id="address"><div>주소</div><input type="text" placeholder="주소" name="userAddress"></div>
<div><button type="submit">확인</button><button onclick="location.href='/login'">취소</button></div>
</html>