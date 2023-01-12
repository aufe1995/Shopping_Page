<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/css/include/header.css">
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>

<div>
    <div>LOGIN</div>
        <form action="/login/action" method="post">
            <div><input type="text" name="userID" placeholder="아이디"></div>
            <div><input type="password" name="userPW" placeholder="비밀번호"></div>
            <div>
                <button type="submit">로그인</button>
                <button type="button" onclick="location.href='/signup'">회원가입</button>
            </div>
        </form>
</div>