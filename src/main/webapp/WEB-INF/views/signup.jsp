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
    <title>???????????? - P0ST 1T</title>
</head>

<body>
    <div class="wrap">
    <div style="width:460px; margin:0 auto;"><a href="/"><img src="/resources/images/p1.png" alt="postit"></a></div>
    <div class="joinContainer">
    <div class="header">
        <div class="joinHeader">
            <h1>????????????</h1>
        </div>
    </div>
    <div class="content my-5">
    <form:form id="joinForm" name="joinForm" modelAttribute="userDto">
        <div class="joinRow">
            <h3 class="joinTitle">
                <form:label path="email">?????????</form:label>
            </h3>
            <form:input path="email" class="form-control" />
            <span class="errorBox emailCheck"></span>
            <form:errors path="email" />
        </div>

        <div class="joinRow">
            <h3 class="joinTitle">
                <form:label path="password">????????????</form:label>
            </h3>
            <form:password maxlength="16" path="password" id="pwd1" name="password" class="form-control"/>
            <span class="pwd-guide">??????, ??????, ???????????? ?????? ?????? 8 ~ 16???</span>
            <span class="errorBox pwdCheck"></span>
            <form:errors path="password" />
        </div>

        <div class="joinRow">
            <h3 class="joinTitle">
                <form:label path="password">???????????? ??????</form:label>
            </h3>
            <input type="password" maxlength="16" id="pwd2" name="pwd2" class="form-control" />
            <span class="errorBox pwdConfirm"></span>
        </div>

        <div class="joinRow">
            <h3 class="joinTitle">
                <form:label path="name">??????</form:label>
            </h3>
            <form:input maxlength="10" path="name" class="form-control"/>
            <span class="errorBox nameCheck"></span>
            <form:errors path="name" />
        </div>

        <div class="joinRow">
            <h3 class="joinTitle">
                <form:label path="nickname">?????????</form:label>
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
        <!-- ???????????? ??????-->
                <div class ="d-grid gap-2">
                    <div class="agreebox d-flex align-items-center justify-content-center">
                            <input type="checkbox" id="privacyAgreeCheckbox" name="privacyAgreeCheckbox" class="agreecheckbox form-check-input">
                                 <label class="agreetext" for="privacyAgreeCheckbox"> [??????] ???????????? ?????? ??? ?????? ?????? &nbsp;&nbsp;&nbsp;</label>
                            <button id="agree1" class="d-inline-block border rounded-pill text-primary px-4 mb-3">?????????</button>

                    </div>

                     <div class="agreebox d-flex align-items-center justify-content-center">
                            <input type="checkbox" id="marketingAgreeCheckbox" name="marketingAgreeCheckbox"  class="agreecheckbox form-check-input">
                                 <label class="agreetext" for="marketingAgreeCheckbox"> [??????] ????????? ?????? ??? ?????? ?????? ?????? </label>
                            <button id="agree2" class="d-inline-block border rounded-pill text-primary px-4 mb-3">?????????</button>
                    </div>

                </div>
                <!-- ???????????? ???-->
        <div class="d-grid gap-2">
            <form:button class="btn btn-success">????????????</form:button>
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
                console.log("????????? ????????? ??????");
                if($("#email").val() !="" && !emailRegex.test($("#email").val())){
                    $(".emailCheck").html("????????? ????????? ???????????? ????????????.");
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
                console.log("???????????? ?????? ?????????");
                    $(".pwd-guide").show();
            });

            $("#pwd1").on("blur", function(){
                console.log("???????????? ?????? ?????????");
                    $(".pwd-guide").hide();
            });

            $("#pwd1").on("propertychange change keyup paste input", function(){
                console.log("???????????? ????????? ??????");
                if($("#pwd1").val() !="" && !pwRegex.test($("#pwd1").val())){
                    $(".pwdCheck").html("???????????? ????????? ???????????? ????????????.");
                } else {
                    $(".pwdCheck").empty();
                }
            });

            $("#pwd2").on("propertychange change keyup paste input", function(){
                console.log("???????????? ?????? ??????");
                if($("#pwd2").val() !="" && !($("#pwd2").val() == $("#pwd1").val())){
                    $(".pwdConfirm").html("??????????????? ???????????? ????????????.");
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
                            $(".emailCheck").html("?????? ????????? ??????????????????.");
                            $(".emailCheck").css("color", "green");
                        } else {
                            $(".emailCheck").html("?????? ????????? ??????????????????.");
                            $(".emailCheck").css("color", "red");
                            emailFlag = false;
                        }
                    },
                    error : function(){
                        alert("???????????????");
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
                                $(".nicknameCheck").html("?????? ????????? ??????????????????.");
                                $(".nicknameCheck").css("color", "green");
                                nicknameFlag = true;
                                } else {
                                    $(".nicknameCheck").html("?????? ???????????? ??????????????????.");
                                    $(".nicknameCheck").css("color", "red");
                                    nicknameFlag = false;
                                }
                        },
                        error : function(){
                            alert("???????????????");
                        }
                });
                } else{
                    $(".nicknameCheck").empty();
                }
            });

                $("#agree1").on("click", function(e){
                    e.preventDefault();
                    window.open("/privacyAgree.jsp", "????????????", "width=600, height=800, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
                });

                $("#agree2").on("click", function(e){
                                    e.preventDefault();
                                     window.open("/marketingAgree.jsp", "????????????", "width=600, height=800, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
                                });

             $("#joinForm").on("submit", function(){
                if($("#email").val() == "" || $("#pwd1").val() == "" || $("#pwd2").val() == "" || $("#name").val() == "" || $("#nickname").val() == ""){
                    console.log("??? ????????? ?????? ??????");
                    if($("#email").val() == "") {$(".emailCheck").html("?????? ???????????????."); $(".emailCheck").css("color", "red");}
                    if($("#pwd1").val() == "") {$(".pwdCheck").html("?????? ???????????????."); $(".pwdCheck").css("color", "red");}
                    if($("#pwd2").val() == "") {$(".pwdConfirm").html("?????? ???????????????."); $(".pwdConfirm").css("color", "red");}
                    if($("#name").val() == "") {$(".nameCheck").html("?????? ???????????????."); $(".nameCheck").css("color", "red");}
                    if($("#nickname").val() == "") {$(".nicknameCheck").html("?????? ???????????????."); $(".nicknameCheck").css("color", "red");}
                    return false;
                } else if($("#pwd1").val() != $("#pwd2").val()){
                    return false;
                } else if(emailFlag != true || nicknameFlag != true){
                    return false;
                } else if($("#privacyAgreeCheckbox").is(":checked") == false){
                   alert("???????????? ?????? ??? ?????? ??????????????? ??????????????????.");
                   return false;
                }$("#wrap-loading").show();
             });


        });
    </script>


</body>

</html>

