<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
 <meta charset="UTF-8">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
     <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
     <style>
         .wrap {
             width: 100%;
             margin: 0;
             padding: 0;
         }

         .container {
             width: 460px;
             margin: 0 auto;
         }

         .header {
             max-width: 460px;
             margin: 0 auto;
             padding-top: 50px;
         }


         .content {
             max-width: 460px;
             margin: 0 auto;
         }

         button {
             margin-top: 20px;
         }

         .errorBox {
             color: red;
         }


     </style>
</head>
<body>
<div class="wrap">
        <div class="container">
            <div class="header">
                <h1>이메일 인증 후 로그인이 가능합니다.</h1>

            </div>

            <div class="content">
                <h2>전송된 인증 메일을 통해 인증을 진행해주세요.</h2>
                <h2>인증 완료 후 아래 버튼을 눌러주세요.</h2>
                <h2>인증 링크가 만료되거나 메일이 전송되지 않은경우 재전송 버튼을 눌러주세요.</h2>
                <span class="errorBox"></span>
                <div class="d-grid gap-2">
                    <button type="button" class="btn btn-success emailCheck">인증 완료</button>
                </div>
                <div class="d-grid gap-2">
                    <button type="button" class="btn btn-success resend">인증 메일 재전송</button>
                </div>

            </div>
        </div>

<script type="text/javascript">

$(".emailCheck").on("click", function(){
            var email = "<c:out value='${userDto.email}${loginDto.email}'/>";
            $.ajax({
            type : "post",
            url : "/isEmailAuth",
            data : {email : email},
            success : function(res){
                if(res){
                        location.href='/';
                    } else {
                        $(".errorBox").html("이메일 인증을 완료해주세요.");
                    }
            },
            error : function(){
                alert("에러입니다");
            }
    });

            });
            $(".resend").on("click", function(){
               var email = "<c:out value='${userDto.email}${loginDto.email}'/>";
                       $.ajax({
                       type : "post",
                       url : "/resendEmail",
                       data : {email : email},
                       success : function(){
                            alert("인증 메일이 재전송되었습니다.");
                       },
                       error : function(){
                           alert("에러입니다");
                       }
               });

           });
</script>
</body>
</html>