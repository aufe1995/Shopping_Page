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
<script   src="https://code.jquery.com/jquery-3.6.0.min.js"   integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="   crossorigin="anonymous"></script>
<%-- 다음 주소록 사용을 위한 스크립트 추가 --%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<div class="wrapper">

    <div class="wrap">

        <div class="title_area">
            <span>회원가입</span>
        </div>

        <hr class="boundary">

        <div class="join_content">

            <form class="join_wrap" id="join_form" method="post" action="/user/joinAction">
                <div id="id_wrap">
                    <div class="join_title">아이디</div>
                    <input class="input_small_box" type="text" placeholder="아이디" name="userID" id="userID" maxlength="15">
                    <button class="join_button" type="button" onclick="idCheck()" id="userIdChk" value="N">중복확인</button>
                    <span></span>
                    <div class="join_desc">* 아이디는 4자 이상, 15자 이하로, 영문과 숫자만 입력 가능합니다.</div>
                </div>

                <div id="password_wrap">
                    <div class="join_title">비밀번호</div>
                    <input class="input_box" type="password" placeholder="비밀번호" name="userPW" id="userPW" maxlength="16">
                    <span></span>
                    <div class="join_desc">* 비밀번호는 8자 이상, 16자 이하로, 영문과 숫자, 특수문자(!,@,#,$,%,^,&,*,~,_)만 입력 가능합니다.</div>
                </div>

                <div id="pw_check_wrap">
                    <div class="join_title">비밀번호 확인</div>
                    <input class="input_box" type="password" placeholder="비밀번호 확인" name="pwCheck" id="pwCheck" maxlength="16">
                    <span></span>
                </div>

                <div id="name_wrap">
                    <div class="join_title">이름</div>
                    <input class="input_box" type="text" placeholder="이름" name="userName" maxlength="10">
                </div>

                <div id="mail_wrap">
                    <div class="join_title">메일</div>
                    <input class="input_small_box" type="text" placeholder="메일" name="userMail" id="userMail" maxlength="50">
                    <button class="join_button" type="button" onclick="mailCheck()" id="mailChk" >인증번호 전송</button>
                    <input class="input_small_add_box" type="text" placeholder="인증번호" name="userAuth" id="userAuth" maxlength="10">
                    <button class="join_button" type="button" onclick="authCheck()" id="authChk" value="false">확인</button>
                </div>

                <div id="address_warp">
                    <div class="join_title">주소</div>
                    <input class="input_small_box" type="text" name="userZIP" id="userZIP" maxlength="20" readonly="readonly">
                    <button class="join_button" type="button" onclick="addressFind()" id="ZIPFind">주소 찾기</button>
                    <input class="input_add_box" type="text" name="userADR" id="userADR" maxlength="20" readonly="readonly">
                    <input class="input_add_box" type="text" name="userDADR" id="userDADR" maxlength="100">
                </div>

                <div id="submit_wrap">
                    <button class="submit_button" type="submit" class="btn btn-primary" value="회원가입" onclick="return joinCheck()">확인</button>
                    <button class="submit_button" type="button" class="btn btn-primary" onclick="location.href='/user/login'">취소</button>
                </div>
            </form>

        </div>
    </div>
</div>

<script type="text/javascript">

    var key = '';

    <%-- 아이디 입력 값이 변경됐을 때 --%>
    $('#userID').keyup(function() {
        $('#userIdChk').attr('value','N');
        $('#id_warp span').html('X');
        $('#id_warp span').attr('style','color:red');
    });

    <%-- 비밀번호 확인 입력 값이 변경됐을 때 --%>
    const pwValidation = /^[a-zA-Z0-9!,@,#,$,%,^,&,*,?,_,~]{8,16}$/;

    $('#userPW').keyup(function(){
        $('#password_warp span').html('X');
        $('#password_warp span').attr('style', 'color:red');
        $('#pw_check_warp span').html('');

        if(pwValidation.test($('#userPW').val())){
            $('#password_warp span').html('√');
            $('#password_warp span').attr('style', 'color:green');
        } else {
            $('#password_warp span').html('X');
            $('#password_warp span').attr('style', 'color:red');
        }
    });

    $('#pwCheck').keyup(function(){
        if($('#userPW').val() == $('#pwCheck').val()){
            $('#pw_check_warp span').html('√');
            $('#pw_check_warp span').attr('style', 'color:green');
        } else{
            $('#pw_check_warp span').html('X');
            $('#pw_check_warp span').attr('style', 'color:red');
        }
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

    <%-- 메일 입력 값 확인 및 인증 번호 전송 --%>
    function mailCheck() {

        const mailValidation = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;

        if(!mailValidation.test($('#userMail').val())){
            alert("메일을 정확히 입력해주세요.");
        }
        else{
            $.ajax({
                url : "/mailCheck",
                type : "POST",
                dataType : "JSON",
                data : {"userMail" : $("#userMail").val()},
                success : function (data) {
                    alert("인증 번호가 전송되었습니다.")
                    key = data;
                }
            })
        }
    }

    <%-- 메일 입력 인증 번호 확인 --%>
    function authCheck() {
        $('#authChk').attr('value','false');

        if(!join_form.userAuth.value.length){
            alert("인증 번호를 입력해주세요.");
        }
        else{
            if( key == $('#userAuth').val()){
                alert("인증이 확인되었습니다.");
                $('#authChk').attr('value','true');
                $('#userMail').prop('readonly', 'true');
                $('#userAuth').prop('disabled', 'true');
            } else {
                alert("인증 번호를 확인바랍니다.");
            }
        }
    }

    <%-- 다음 주소 검색 연동 --%>
    function addressFind() {

        new daum.Postcode({
            oncomplete: function (data){
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    addr += extraAddr;

                } else {
                    addr += '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('userZIP').value = data.zonecode;
                document.getElementById("userADR").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("userDADR").focus();
            }
        }).open();
    }

    <%-- 회원가입 입력 값 확인 --%>
    function joinCheck(){

        const pwValidation = /^[a-zA-Z0-9!,@,#,$,%,^,&,*,?,_,~]{8,16}$/;

        // 아이디 유효성 검사
        if(!join_form.userID.value.length){
            alert("아이디를 입력해주세요.");
            return false;
        }

        // 아이디 중복 확인
        if($('#userIdChk').val() != "Y"){
            alert("아이디 중복 검사를 해주세요.");
            return false;
        }

        // 비밀번호 유효성 검사
        if(!join_form.userPW.value.length){
            alert("비밀번호를 입력해주세요.");
            return false;
        }

        // 비밀번호 규칙 확인
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
        if(!$('#authChk').val()){
            alert("메일을 인증해주세요.");
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
