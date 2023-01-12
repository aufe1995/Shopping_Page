<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/css/include/header.css">
<%@ include file="/WEB-INF/view/include/header.jsp" %>
//ajax 사용을 위한 스크립트 추가
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<div>회원가입</div>
        <form name="signupForm" method="post" action="/signup/action">
            <div id="userid">
                <div>아이디</div>
                <input type="text" placeholder="아이디" name="userID" id="userID" maxlength="20">
                <button type="button" onclick="idCheck()" id="userIdChk" value="N">중복확인</button>
            </div>

            <div id="password">
                <div>비밀번호</div>
                <input type="password" placeholder="비밀번호" name="userPW" maxlength="20">
            </div>

            <div id="passcheck">
                <div>비밀번호 확인</div>
                <input type="password" placeholder="비밀번호 확인" name="pwCheck" maxlength="20">
            </div>

            <div id="name">
                <div>이름</div>
                <input type="text" placeholder="이름" name="userName" maxlength="20">
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
                <button type="submit" class="btn btn-primary" value="회원가입" onclick="return signupCheck()">확인</button>
                <button type="button" class="btn btn-primary" onclick="location.href='/login'">취소</button>
            </div>
        </form>

<script type="text/javascript">
    function idCheck() {

        if(signupForm.userID.value.length == 0){
            alert("아이디를 입력해주세요.");
        }
        else{
            $.ajax({
                url : "/idCheck",
                type : "POST",
                dataType : "JSON",
                data : {"userID" : $("#userID").val()},
                success : function (data) {
                    if(data == 0){
                        alert("이용 가능한 아이디입니다.");
                        $('#userIdChk').attr('value','Y')
                    } else {
                        alert("이용 불가한 아이디입니다. 다시 입력해주세요.");
                        $('#userIdChk').attr('value','N')
                    }
                }
            })
        }
    }

    function signupCheck(){
        // 아이디 유효성 검사
        if(signupForm.userID.value.length == 0){
            alert("아이디를 입력해주세요.");
            return false;
        }

        if($('#userIdChk').val() == "N"){
            alert("아이디 중복 검사를 해주세요.");
            return false;
        }

        // 비밀번호 유효성 검사
        if(signupForm.userPW.value.length == 0){
            alert("비밀번호를 입력해주세요.");
            return false;
        }

        // 비밀번호 재입력 확인
        if(signupForm.userPW.value != signupForm.pwCheck.value){
            alert("비밀번호를 동일하게 입력해주세요.");
            return false;
        }

        // 이름 입력 확인
        if(signupForm.userName.value.length == 0){
            alert("이름을 입력해주세요.");
            return false;
        }

        // 전화번호 입력 확인
        if(signupForm.userPhone.value.length == 0){
            alert("전화번호를 입력해주세요.");
            return false;
        }

        // 메일 입력 확인
        if(signupForm.userEmail.value.length == 0){
            alert("메일을 입력해주세요.");
            return false;
        }

        // 주소 입력 확인
        if(signupForm.userADR.value.length == 0){
            alert("주소를 입력해주세요.");
            return false;
        }

    }
</script>
</html>