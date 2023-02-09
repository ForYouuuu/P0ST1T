<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>
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
  <title>비밀번호 찾기 - POST 1T</title>
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
      padding-top: 50px;
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
    }
  </style>
</head>

<body>
  <div class="wrap">
    <div class="joinContainer">
      <div class="header">
        <div class="joinHeader">
          <h1>비밀번호 찾기</h1>
        </div>
      </div>
      <div class="content">
        <form id="findPwdForm" name="findPwdForm">
          <div class="joinRow">
            <h3 class="joinTitle">
              <label for="email">이메일</label>
            </h3>
            <input id="email" name="email" class="form-control" type="text" value="" />
          </div>

          <div>
            <span class="errorBox"></span>
          </div>

          <div class="d-grid gap-2">
            <button class="btn btn-success" type="submit" value="Submit">임시 비밀번호 발급</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <script>
    $(document).ready(function () {

      $("#findPwdForm").on("submit", function (e) {
        e.preventDefault();
        if ($("#email").val() == "") {
            $(".errorBox").html("이메일을 입력해주세요.");
          return false;
        }
        var email = $("#email").val();
        $.ajax({
            type : "post",
            url : "/user/findPwd",
            data : {email : email},
            success : function(res){
                if(res){
                    $(".content").empty();
                    str = "";
                    str += "<h2>임시 비밀번호가 전송되었습니다.</h2>" +
                        "<h2>메일 확인 후 임시 비밀번호 로그인해주세요.</h2>" +
                        "<div class='d-grid gap-2'>" +
                        "<button type='button' class='btn btn-success' onclick='location.href=\"/\"'; >메인으로</button>" +
                        "</div>";
                    $(".content").html(str);
                } else {
                    $(".errorBox").html("가입되지 않은 이메일입니다.");
                }
                },
                error : function(){
                    alert("에러입니다");
                }
        });
      });
    });
  </script>


</body>

</html>