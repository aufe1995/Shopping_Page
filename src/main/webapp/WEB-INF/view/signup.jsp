<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/css/include/header.css">
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<%-- ajax 사용을 위한 스크립트 추가 --%>
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
                <input type="text" placeholder="아이디" name="userID" id="userID" maxlength="15">
                <button type="button" onclick="idCheck()" id="userIdChk" value="N">중복확인</button>
                <div style="color:red;" id="check">확인</div>
                <div>아이디는 4자 이상, 15자 이하로, 영문과 숫자만 입력 가능합니다.</div>
            </div>

            <div id="password">
                <div>비밀번호</div>
                <input type="password" placeholder="비밀번호" name="userPW" id="userPW" maxlength="16">
                <div>비밀번호는 8자 이상, 16자 이하로, 영문과 숫자, 특수문자(!,@,#,$,%,^,&,*,~,_)만 입력 가능합니다.</div>
            </div>

            <div id="passcheck">
                <div>비밀번호 확인</div>
                <input type="password" placeholder="비밀번호 확인" name="pwCheck" id="pwCheck" maxlength="16">
                <font id="pwChkText" size="2"></font>
            </div>

            <div id="name">
                <div>이름</div>
                <input type="text" placeholder="이름" name="userName" maxlength="10">
            </div>

            <div id="phone">
                <div>전화번호</div>
                <input type="text" placeholder="전화번호" name="userPhone" maxlength="20">
            </div>

            <div id="email">
                <div>메일</div>
                <input type="text" placeholder="이메일" name="userEmail" id="userEmail" maxlength="50">
                <div>ex)abc@email.com</div>
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

    <%-- 아이디 입력 값이 변경됐을 때 --%>
    $('#userID').on("propertychange change keyup paste input", function() {
        $('#userIdChk').attr('value','N')
        $('#check').attr('style','color:red')
    });

    <%-- 비밀번호 확인 입력 값이 변경됐을 때 --%>
    $(function(){
        $('#userPW').keyup(function(){
          $('#pwChkText').html('');
        });

        $('#pwCheck').keyup(function(){

            if($('#userPW').val() != $('#pwCheck').val()){
              $('#pwChkText').html('비밀번호 일치하지 않음<br><br>');
              $('#pwChkText').attr('color', 'red');
            } else{
              $('#pwChkText').html('비밀번호 일치함<br><br>');
              $('#pwChkText').attr('color', 'green');
            }

        });
    });


    <%-- 아이디 입력 값 규칙 및 사용 여부 확인 --%>
    function idCheck() {

        const idValidation = /^[a-zA-Z0-9_-]{4,15}$/;

        if(!idValidation.test($('#userID').val())){
            alert("아이디 규칙을 확인 해주세요.");
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
                        $('#check').attr('style','color:green')
                    } else {
                        alert("중복된 아이디입니다. 다시 입력해주세요.");
                    }
                }
            })
        }
    }

    function signupCheck(){

        const pwValidation = /^[a-zA-Z0-9!,@,#,$,%,^,&,*,?,_,~]{8,16}$/;
        const emailValidation = /^[A-z|0-9]([A-z|0-9]*)(@)([A-z]*)(\.)([A-z]*)$/;

        // 아이디 유효성 검사
        if(!signupForm.userID.value.length){
            alert("아이디를 입력해주세요.");
            return false;
        }

        if($('#userIdChk').val() == "N"){
            alert("아이디 중복 검사를 해주세요.");
            return false;
        }

        // 비밀번호 유효성 검사
        if(!signupForm.userPW.value.length){
            alert("비밀번호를 입력해주세요.");
            return false;
        }

        if(!pwValidation.test($('#userPW').val())){
            alert("비밀번호 규칙을 확인해주세요.");
            return false;
        }


        // 비밀번호 재입력 확인
        if(signupForm.userPW.value != signupForm.pwCheck.value){
            alert("비밀번호를 동일하게 입력해주세요.");
            return false;
        }

        // 이름 입력 확인
        if(!signupForm.userName.value.length){
            alert("이름을 입력해주세요.");
            return false;
        }

        // 전화번호 입력 확인
        if(!signupForm.userPhone.value.length){
            alert("전화번호를 입력해주세요.");
            return false;
        }

        // 메일 입력 확인
        if(!signupForm.userEmail.value.length){
            alert("메일을 입력해주세요.");
            return false;
        }

        // 메일 양식 확인
        if(!emailValidation.test($('#userEmail').val())){
            alert("메일을 양식을 확인해주세요.");
            return false;
        }

        // 주소 입력 확인
        if(!signupForm.userADR.value.length){
            alert("주소를 입력해주세요.");
            return false;
        }

    }
</script>
</html>