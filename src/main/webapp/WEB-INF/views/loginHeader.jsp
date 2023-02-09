<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>
  <style>
      * {
        box-sizing: border-box;
      }

      html, body {
        margin: 0;
        padding: 0;
        height: 100%;
      }

      .navbar {
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
      </style>
  <title>인증된 IT자격증 리뷰 - P0ST 1T</title>
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
               <a class="nav-link" href="/user/profile">마이페이지</a>
             </li>
             <li class="nav-item">
               <a class="nav-link" href="/user/logout">로그아웃</a>
             </li>
           </ul>
         </div>
       </div>
     </nav>