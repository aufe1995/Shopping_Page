<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/css/user/join.css">
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<%-- ajax 사용을 위한 스크립트 추가 --%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<div class="wrapper">

    <div class="wrap">

        <div class="title_area">
            <span>회원가입</span>
        </div>

        <hr class="boundary">

        <div class="join_content">

            <form class="join_warp" id="join_form" method="post" action="/join/action">
                <div id="id_warp">
                    <div class="join_title">아이디</div>
                    <input class="input_small_box" type="text" placeholder="아이디" name="userID" id="userID" maxlength="15">
                    <button class="join_button" type="button" onclick="idCheck()" id="userIdChk" value="N">중복확인</button>
                    <span></span>
                    <div class="join_desc">* 아이디는 4자 이상, 15자 이하로, 영문과 숫자만 입력 가능합니다.</div>
                </div>

                <div id="password_warp">
                    <div class="join_title">비밀번호</div>
                    <input class="input_box" type="password" placeholder="비밀번호" name="userPW" id="userPW" maxlength="16">
                    <span></span>
                    <div class="join_desc">* 비밀번호는 8자 이상, 16자 이하로, 영문과 숫자, 특수문자(!,@,#,$,%,^,&,*,~,_)만 입력 가능합니다.</div>
                </div>

                <div id="pw_check_warp">
                    <div class="join_title">비밀번호 확인</div>
                    <input class="input_box" type="password" placeholder="비밀번호 확인" name="pwCheck" id="pwCheck" maxlength="16">
                    <span></span>
                </div>

                <div id="name_warp">
                    <div class="join_title">이름</div>
                    <input class="input_box" type="text" placeholder="이름" name="userName" maxlength="10">
                </div>

                <div id="mail_warp">
                    <div class="join_title">메일</div>
                    <input class="input_small_box" type="text" placeholder="메일" name="userMail" id="userMail" maxlength="50">
                    <button class="join_button" type="button" id="emailChk" >인증번호 전송</button>
                    <input class="input_add_box" type="text" placeholder="인증번호" name="mailCheck" id="mailCheck" maxlength="10">
                </div>

                <div id="address_warp">
                    <div class="join_title">주소</div>
                    <input class="input_small_box" type="text" name="userZIP" id="userZIP" maxlength="100">
                    <button class="join_button" type="button" id="emailChk" >주소 찾기</button>
                    <input class="input_add_box" type="text" name="userADR" id="userADR" maxlength="100">
                    <input class="input_add_box" type="text" name="userDADR" id="userDADR" maxlength="100">
                </div>

                <div id="submit_warp">
                    <button class="submit_button" type="submit" class="btn btn-primary" value="회원가입" onclick="return joinCheck()">확인</button>
                    <button class="submit_button" type="button" class="btn btn-primary" onclick="location.href='/user/login'">취소</button>
                </div>
            </form>

        </div>

</div>

<script type="text/javascript">

    <%-- 아이디 입력 값이 변경됐을 때 --%>
    $('#userID').keyup(function() {
        $('#userIdChk').attr('value','N');
        $('#id_warp span').html('X');
        $('#id_warp span').attr('style','color:red')
    });

    <%-- 비밀번호 확인 입력 값이 변경됐을 때 --%>
    $(function(){

        const pwValidation = /^[a-zA-Z0-9!,@,#,$,%,^,&,*,?,_,~]{8,16}$/;

        $('#userPW').keyup(function(){
            $('#password_warp span').html('X');
            $('#password_warp span').attr('style', 'color:red');
            $('#pw_check_warp span').html('X');
            $('#pw_check_warp span').attr('style', 'color:red');

            if(pwValidation.test($('#userPW').val()) && $('#userPW').val() == $('#pwCheck').val()){
                $('#password_warp span').html('√');
                $('#password_warp span').attr('style', 'color:green');
                $('#pw_check_warp span').html('√');
                $('#pw_check_warp span').attr('style', 'color:green');
            } else if(pwValidation.test($('#userPW').val()) && $('#userPW').val() != $('#pwCheck').val()){
                $('#password_warp span').html('√');
                $('#password_warp span').attr('style', 'color:green');
            }
        });

        $('#pwCheck').keyup(function(){

            if($('#userPW').val() != $('#pwCheck').val()){
              $('#pw_check_warp span').html('X');
              $('#pw_check_warp span').attr('style', 'color:red');
            } else{
              $('#pw_check_warp span').html('√');
              $('#pw_check_warp span').attr('style', 'color:green');
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
                        $('#id_warp span').html('√');
                        $('#id_warp span').attr('style','color:green');
                        $('#userIdChk').attr('value','Y');
                    } else {
                        alert("중복된 아이디입니다. 다시 입력해주세요.");
                    }
                }
            })
        }
    }

    function joinCheck(){

        const pwValidation = /^[a-zA-Z0-9!,@,#,$,%,^,&,*,?,_,~]{8,16}$/;

        // 아이디 유효성 검사
        if(!join_form.userID.value.length){
            alert("아이디를 입력해주세요.");
            return false;
        }

        if($('#userIdChk').val() != "Y"){
            alert("아이디 중복 검사를 해주세요.");
            return false;
        }

        // 비밀번호 유효성 검사
        if(!join_form.userPW.value.length){
            alert("비밀번호를 입력해주세요.");
            return false;
        }

        if(!pwValidation.test($('#userPW').val())){
            alert("비밀번호 규칙을 확인해주세요.");
            return false;
        }

        // 비밀번호 재입력 확인
        if(join_form.userPW.value != join_form.pwCheck.value){
            alert("비밀번호를 동일하게 입력해주세요.");
            return false;
        }

        // 이름 입력 확인
        if(!join_form.userName.value.length){
            alert("이름을 입력해주세요.");
            return false;
        }

        // 메일 입력 확인
        if(!join_form.userMail.value.length){
            alert("메일을 입력해주세요.");
            return false;
        }

        // 주소 입력 확인
        if(!join_form.userZIP.value.length || !join_form.userADR.value.length || !join_form.userDADR.value.length){
            alert("주소를 입력해주세요.");
            return false;
        }

    }

</script>
</body>
</html>
<%@ include file="/WEB-INF/view/include/footer.jsp" %>
