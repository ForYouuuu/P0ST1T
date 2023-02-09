<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">


<!--에디터  -->
<script src="https://cdn.ckeditor.com/ckeditor5/35.0.1/inline/ckeditor.js"></script>

<!--에디터  -->

  <style>


  .cke_editor_editor .cke_contents{
     min-height:550px;
}

  .needAlter{
      list-style:none;
  }
  .needRight{
      float:right;
  }
  .needBtnRight{
      color:blue;
      float:right;
  }

  /* footer 하단 고정 [S] */
  html, body {
      margin: 0;
      padding: 0;
      height: 100%;
  }

  #body-wrapper {
      min-height: 100%;
      position: relative;
  }


  #body-content {
      margin-top: 100px;
      padding-bottom: 150px; /* footer의 높이 */
  }

  footer {
      width: 100%;
      height: 150px; /* footer의 높이 */
      position: absolute;
      bottom: 0;
      left: 0;
  }
  /* footer 하단 고정 [E] */

   img{
    height: 130px;
    width: 130px;
  }


    textarea {
      width: 100%;
      height: 30em;
      border: none;
      resize: none;
    }

    a {
      text-decoration: none;
    }
    a:link {
      color :black;
    }
    a:visited {
      color : black;
    }
    a:hover {
      color : blue;
    }
  </style>


</head>

<body>


  <nav class="navbar navbar-expand-lg navbar-dark bg-dark  sticky-top" aria-label="Tenth navbar example">
    <div class="container-fluid">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/admin/userlist">POST IT PROJECT - ADMIN</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <div id="body-wrapper">
    <div id="body-content">


        <script src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>