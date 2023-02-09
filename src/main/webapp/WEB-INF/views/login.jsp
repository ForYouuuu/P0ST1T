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
    * {
          box-sizing: border-box;
        }

        .contentWrap {
          height: auto;
          min-height: calc(100% - 72px);
          padding-bottom: 180px;
          text-align: center;
        }

        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
        }

        .navbar {
          min-width: 1000px;
          min-height: 72px;
          padding: 0.5rem 1rem;
        }

        .header-box{
          width: 1130px;
        }

        .nav-link {
          padding-left: 1.3em !important;
          padding-right: 1.3em !important;
          font-size: 15px;
        }

        .header-box ul {
          list-style: none;
          padding: 0;
        }

        footer{
            padding-top: 70px;
            height:180px;
            position: relative;
            transform: translateY(-100%);
        }
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
            padding-top: 50px;
        }

        .joinHeader {
            width: 100%;
            margin: 0 auto;
            text-align: center;
        }

        .joinTitle {
            text-align: left;
        }

        .content {
            max-width: 460px;
            margin: 0 auto;
            text-align: left;
        }

        .joinRow {
            margin: 30px 0;
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
  <nav class="navbar navbar-expand-md navbar-dark bg-dark">
       <div class="container-fluid d-flex justify-content-between header-box">
         <a class="navbar-brand" href="/">P0ST 1T</a>
         <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse"
           data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false"
           aria-label="Toggle navigation">
           <span class="navbar-toggler-icon"></span>
         </button>
         <div class="navbar-collapse collapse" id="navbarTogglerDemo02" style="flex-grow: 0; text-align: center;">
           <ul class="navbar-nav mr-0">
             <li class="nav-item">
               <a class="nav-link" href="/about">P0ST 1T</a>
             </li>
             <li class="nav-item">
               <a class="nav-link" href="/certinfo/list">자격증정보</a>
             </li>
             <li class="nav-item">
               <a class="nav-link" href="/user/checkCert">인증받기</a>
             </li>
             <li class="nav-item dropdown">
               <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">커뮤니티</a>
               <ul class="dropdown-menu" style="text-align:center;">
                 <li><a href="/noticeboard/list?sort=" class="dropdown-item">공지사항</a></li>
                 <li><a href="/freeboard/list?sort=" class="dropdown-item">자유게시판</a></li>
                 <li><a href="/qnaboard/list?sort=" class="dropdown-item">묻고답하기</a></li>
                 <li><a href="/reviewboard/list?sort=" class="dropdown-item">리뷰</a></li>
                 <li><a href="/inquireboard/list?sort=" class="dropdown-item">문의하기</a></li>
               </ul>
             </li>
             <li class="nav-item">
               <a class="nav-link" href="/user/signup">회원가입</a>
             </li>
             <li class="nav-item">
               <a class="nav-link" href="/user/login">로그인</a>
             </li>
           </ul>
         </div>
       </div>
     </nav>
    <div class="contentWrap">
    <div class="joinContainer mt-5">
    <div class="header">
        <div class="joinHeader">
            <h1>로그인</h1>
        </div>
    </div>
    <div class="content">
    <form:form id="joinForm" name="joinForm" modelAttribute="loginDto">
        <div class="joinRow">
            <h3 class="joinTitle">
                <form:label path="email">이메일</form:label>
            </h3>
            <form:input path="email" class="form-control" />
        </div>

        <div class="joinRow">
            <h3 class="joinTitle">
                <form:label path="password">비밀번호</form:label>
            </h3>
            <form:password maxlength="16" path="password" class="form-control"/>

        </div>
        <div>
            <span class="errorBox"></span>
            <form:errors style="color:red" path="email" />
        </div>

        <div class="d-grid gap-2">
            <form:button class="btn btn-success">로그인</form:button>
        </div>
    </form:form>
    </div>
    <div class="d-flex justify-content-center">
            <a class="mx-2" href="/user/findPwd">비밀번호 찾기</a>
            |
            <a class="mx-2" href="/user/signup">회원가입</a>
    </div>
  </div>
 </div>

<footer class="bg-dark">
    <ul class="nav justify-content-center border-bottom mb-3">
       <li class="nav-item"><a href="/" class="nav-link px-2 text-muted">홈</a></li>
       <li class="nav-item"><a href="/certinfo/list" class="nav-link px-2 text-muted">자격증 정보</a></li>
       <li class="nav-item"><a href="/noticeboard/list?sort=" class="nav-link px-2 text-muted">공지사항</a></li>
       <li class="nav-item"><a href="/inquireboard/list?sort=" class="nav-link px-2 text-muted">문의하기</a></li>
    </ul>
    <p class="text-center text-muted">©2022 POST 1T</p>
</footer>

   <script>
          document.title = "로그인 - POST 1T";
          $(document).ready(function(){

               $("#joinForm").on("submit", function(){
                  if($("#email").val() == "" || $("#password").val() == ""){
                      console.log("폼 데이터 유효 체크");

                      if($("#password").val() == "") {$(".errorBox").html("비밀번호를 입력해주세요.");}
                      if($("#email").val() == "") {$(".errorBox").html("이메일을 입력해주세요.");}
                      return false;
                  }
               });

               $('#email').on('focus',function(){
                $('span').html("");
               });

               $('#password').on('focus',function(){
                 $('span').html("");
               });
          });
      </script>
    </body>
</html>

