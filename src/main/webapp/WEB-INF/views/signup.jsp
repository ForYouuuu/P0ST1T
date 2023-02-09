<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>

<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <style>
        .wrap {
            width: 100%;
            margin: 0;
            padding: 0;
        }

        .joinContainer {
            width: 460px;
            margin: 0 auto;
        }

        .header {
            max-width: 460px;
            margin: 0 auto;
            padding-top: 35px;
        }

        .joinHeader {
            width: 100%;
            margin: 0 auto;
            text-align: center;
        }

        .content {
            max-width: 460px;
            margin: 0 auto;
        }

        .joinRow {
            margin: 30px 0;
        }

        button {
            margin-top: 20px;
        }

        .errorBox {
            color: red;
            display:inline-block;
            margin-top:10px;
        }

        .pwd-guide{
            display:inline-block;
            color: gray;
            margin-top:10px;
        }

        .agreetext{
            margin: 0 12px;
            cursor: pointer;
        }

        .agreecheckbox{
            margin: 0;
            cursor: pointer;
        }

        #wrap-loading {
            position: absolute;
            top:50%;
            left:50%;
            transform: translate(-50%, -50%);
            display: none;
        }


    </style>
    <title>회원가입 - P0ST 1T</title>
</head>

<body>
    <div class="wrap">
    <div style="width:460px; margin:0 auto;"><a href="/"><img src="/resources/images/p1.png" alt="postit"></a></div>
    <div class="joinContainer">
    <div class="header">
        <div class="joinHeader">
            <h1>회원가입</h1>
        </div>
    </div>
    <div class="content my-5">
    <form:form id="joinForm" name="joinForm" modelAttribute="userDto">
        <div class="joinRow">
            <h3 class="joinTitle">
                <form:label path="email">이메일</form:label>
            </h3>
            <form:input path="email" class="form-control" />
            <span class="errorBox emailCheck"></span>
            <form:errors path="email" />
        </div>

        <div class="joinRow">
            <h3 class="joinTitle">
                <form:label path="password">비밀번호</form:label>
            </h3>
            <form:password maxlength="16" path="password" id="pwd1" name="password" class="form-control"/>
            <span class="pwd-guide">영문, 숫자, 특수문자 모두 포함 8 ~ 16자</span>
            <span class="errorBox pwdCheck"></span>
            <form:errors path="password" />
        </div>

        <div class="joinRow">
            <h3 class="joinTitle">
                <form:label path="password">비밀번호 확인</form:label>
            </h3>
            <input type="password" maxlength="16" id="pwd2" name="pwd2" class="form-control" />
            <span class="errorBox pwdConfirm"></span>
        </div>

        <div class="joinRow">
            <h3 class="joinTitle">
                <form:label path="name">이름</form:label>
            </h3>
            <form:input maxlength="10" path="name" class="form-control"/>
            <span class="errorBox nameCheck"></span>
            <form:errors path="name" />
        </div>

        <div class="joinRow">
            <h3 class="joinTitle">
                <form:label path="nickname">닉네임</form:label>
            </h3>
            <form:input maxlength="12" path="nickname" class="form-control"/>
            <span class="errorBox nicknameCheck"></span>
            <form:errors path="nickname" />
        </div>
         <div id="wrap-loading">
          <div>
            <img src="/resources/images/loadingicon.gif" alt="ajaxLoader">
          </div>
        </div>
        <!-- 약관동의 시작-->
                <div class ="d-grid gap-2">
                    <div class="agreebox d-flex align-items-center justify-content-center">
                            <input type="checkbox" id="privacyAgreeCheckbox" name="privacyAgreeCheckbox" class="agreecheckbox form-check-input">
                                 <label class="agreetext" for="privacyAgreeCheckbox"> [필수] 개인정보 수집 및 이용 동의 &nbsp;&nbsp;&nbsp;</label>
                            <button id="agree1" class="d-inline-block border rounded-pill text-primary px-4 mb-3">자세히</button>

                    </div>

                     <div class="agreebox d-flex align-items-center justify-content-center">
                            <input type="checkbox" id="marketingAgreeCheckbox" name="marketingAgreeCheckbox"  class="agreecheckbox form-check-input">
                                 <label class="agreetext" for="marketingAgreeCheckbox"> [선택] 마케팅 활용 및 정보 수신 동의 </label>
                            <button id="agree2" class="d-inline-block border rounded-pill text-primary px-4 mb-3">자세히</button>
                    </div>

                </div>
                <!-- 약관동의 끝-->
        <div class="d-grid gap-2">
            <form:button class="btn btn-success">가입하기</form:button>
        </div>
    </form:form>
    </div>
    </div>
    </div>



    <script>


        var emailRegex = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()\[\]\.,;:\s@\"]+\.)+[^<>()\[\]\.,;:\s@\"]{2,})$/;
        var pwRegex = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+])(?!.*[^a-zA-z0-9$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
        var emailFlag = false;
        var nicknameFlag = false;

        $(document).ready(function(){
            $('.pwd-guide').hide();

            $("#email").on("propertychange change keyup paste input", function(){
                console.log("이메일 유효성 검사");
                if($("#email").val() !="" && !emailRegex.test($("#email").val())){
                    $(".emailCheck").html("이메일 형식이 유효하지 않습니다.");
                    $(".emailCheck").css("color", "red");
                    emailFlag = false;
                } else {
                    $(".emailCheck").empty();
                    emailFlag = true;
                    if($("#email").val() == ""){
                       emailFlag = false;
                    }
                }
            });

            $("#pwd1").on("focus", function(){
                console.log("비밀번호 조건 띄우기");
                    $(".pwd-guide").show();
            });

            $("#pwd1").on("blur", function(){
                console.log("비밀번호 조건 숨기기");
                    $(".pwd-guide").hide();
            });

            $("#pwd1").on("propertychange change keyup paste input", function(){
                console.log("비밀번호 유효성 검사");
                if($("#pwd1").val() !="" && !pwRegex.test($("#pwd1").val())){
                    $(".pwdCheck").html("비밀번호 규칙이 만족되지 않습니다.");
                } else {
                    $(".pwdCheck").empty();
                }
            });

            $("#pwd2").on("propertychange change keyup paste input", function(){
                console.log("비밀번호 일치 검사");
                if($("#pwd2").val() !="" && !($("#pwd2").val() == $("#pwd1").val())){
                    $(".pwdConfirm").html("비밀번호가 일치하지 않습니다.");
                } else {
                    $(".pwdConfirm").empty();
                }
            });

            $("#email").on("blur", function(){
                if(emailFlag){
                var email = $("#email").val();
                $.ajax({
                    type : "post",
                    url : "/emailCheck",
                    data : {email : email},
                    success : function(res){
                        if(res){
                            $(".emailCheck").html("사용 가능한 이메일입니다.");
                            $(".emailCheck").css("color", "green");
                        } else {
                            $(".emailCheck").html("이미 가입된 이메일입니다.");
                            $(".emailCheck").css("color", "red");
                            emailFlag = false;
                        }
                    },
                    error : function(){
                        alert("에러입니다");
                    }
                });
                }
            });

            $("#name").on("blur", function(){
                if($("#name").val() != ""){
                    $(".nameCheck").empty();
                }
            });

            $("#nickname").on("propertychange change keyup paste input", function(){
                var nickname = $("#nickname").val();
                if(nickname != ""){
                    $.ajax({
                        type : "post",
                        url : "/nicknameCheck",
                        data : {nickname : nickname},
                        success : function(res){
                            if(res){
                                $(".nicknameCheck").html("사용 가능한 닉네임입니다.");
                                $(".nicknameCheck").css("color", "green");
                                nicknameFlag = true;
                                } else {
                                    $(".nicknameCheck").html("이미 사용중인 닉네임입니다.");
                                    $(".nicknameCheck").css("color", "red");
                                    nicknameFlag = false;
                                }
                        },
                        error : function(){
                            alert("에러입니다");
                        }
                });
                } else{
                    $(".nicknameCheck").empty();
                }
            });

                $("#agree1").on("click", function(e){
                    e.preventDefault();
                    window.open("/privacyAgree.jsp", "약관동의", "width=600, height=800, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
                });

                $("#agree2").on("click", function(e){
                                    e.preventDefault();
                                     window.open("/marketingAgree.jsp", "약관동의", "width=600, height=800, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
                                });

             $("#joinForm").on("submit", function(){
                if($("#email").val() == "" || $("#pwd1").val() == "" || $("#pwd2").val() == "" || $("#name").val() == "" || $("#nickname").val() == ""){
                    console.log("폼 데이터 유효 체크");
                    if($("#email").val() == "") {$(".emailCheck").html("필수 정보입니다."); $(".emailCheck").css("color", "red");}
                    if($("#pwd1").val() == "") {$(".pwdCheck").html("필수 정보입니다."); $(".pwdCheck").css("color", "red");}
                    if($("#pwd2").val() == "") {$(".pwdConfirm").html("필수 정보입니다."); $(".pwdConfirm").css("color", "red");}
                    if($("#name").val() == "") {$(".nameCheck").html("필수 정보입니다."); $(".nameCheck").css("color", "red");}
                    if($("#nickname").val() == "") {$(".nicknameCheck").html("필수 정보입니다."); $(".nicknameCheck").css("color", "red");}
                    return false;
                } else if($("#pwd1").val() != $("#pwd2").val()){
                    return false;
                } else if(emailFlag != true || nicknameFlag != true){
                    return false;
                } else if($("#privacyAgreeCheckbox").is(":checked") == false){
                   alert("개인정보 수집 및 이용 동의항목을 체크해주세요.");
                   return false;
                }$("#wrap-loading").show();
             });


        });
    </script>


</body>

</html>

