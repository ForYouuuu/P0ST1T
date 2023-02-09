<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>이메일 변경 실패 - POST 1T</title>
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
    </style>
</head>

<body>



    <div class="wrap">
        <div class="container">
            <div class="header">
                <h1>이메일 변경 실패</h1>

            </div>

            <div class="content">
                <h2>이메일 변경에 실패했습니다.</h2>
                <h2>가입되지 않은 사용자입니다.</h2>
                <div class="d-grid gap-2">
                    <button type="button" class="btn btn-success" onclick=WinClose();>닫기</button>
                </div>


            </div>
        </div>

        <script>
            function WinClose() {
                window.open('', '_self').close();
            }
        </script>
</body>

</html>