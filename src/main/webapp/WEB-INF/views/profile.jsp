<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAuthenticated()">
<jsp:include page="/WEB-INF/views/loginHeader.jsp" />
</sec:authorize>
<div class="container-fluid contentWrap">

        <div class="content">
            <div class="d-flex" style="height:900px; margin-bottom:50px;">
                <nav class="nav flex-column border" style="width: 120px;">
                    <a class="nav-link my-2" href="javascript:showProfile();">프로필</a>
                    <a class="nav-link my-2" href="/user/profile?pageNum=1&amount=10&isBoardList=Y">작성글</a>
                    <a class="nav-link my-2" href="/user/profile?pageNum=1&amount=10&isReplyList=Y">작성댓글</a>
                </nav>
                <div class="flex-grow-1 border" style="text-align: left;">
                <div id="profile1">
                <div class="mx-3 mt-4"><h3>프로필</h3></div>
                    <form id="profileForm" style="width:735px; margin:20px auto;">
                        <div class="mb-4"><h4>기본정보</h4></div>
                        <div class="d-flex align-items-center">
                            <label for="email" style="width: 135px;">이메일</label>
                            <input style="width: 600px" id="email" name="email" class="form-control" type="text" value='<c:out value="${user.email}" />'/>

                        </div><span class="errorBox emailCheck" style="margin-left:135px;"></span>
                        <div class="d-flex align-items-center">
                            <label for="nickname" style="width: 135px;">닉네임</label>
                            <input style="width: 600px" id="nickname" name="nickname" class="form-control" type="text" value='<c:out value="${user.nickname}" />'/>

                        </div><span class="errorBox nicknameCheck" style="margin-left:135px;"></span>
                        <div class="d-flex align-items-center">
                            <label for="name" style="width: 135px;">이름</label>
                            <input style="width: 600px" id="name" name="name" class="form-control" type="text" value='<c:out value="${user.name}" />'/>

                        </div><span class="errorBox nameCheck" style="margin-left:135px;"></span>
                        <div class="d-flex justify-content-end" style=" width:735px;"><button id="btnModify" class="btn btn-success">기본정보 변경</button></div>
                    </form>

                    <form id="pwdForm" style="width:735px; margin:20px auto;">
                    <div class="mb-4"><h4>비밀번호 변경</h4></div>

                        <div class="d-flex align-items-center">
                            <label for="oldPwd" style="width: 135px;">현재 비밀번호</label>
                            <input style="width: 600px" id="oldPwd" name="oldPwd" class="form-control"
                                type="password" />
                        </div>
                        <span class="errorBox oldPwd" style="margin-left:135px; color:red;"></span>
                        <div class="d-flex align-items-center">
                            <label for="newPwd" style="width: 135px;">새 비밀번호</label>
                            <input style="width: 600px" id="newPwd" name="newPwd" class="form-control"
                                type="password" />
                        </div>
                         <span class="errorBox pwdCheck" style="margin-left:135px; color:red;"></span>
                        <div style="margin-left:135px; color:blue;">비밀번호 규칙 : 영문, 숫자, 특수문자 사용 8 ~ 20자</div>
                        <div class="d-flex align-items-center" style="margin-top:21px;">
                            <label for="newPwd2" style="width: 135px;">새 비밀번호 확인</label>
                            <input style="width: 600px" id="newPwd2" name="newPwd2" class="form-control"
                                type="password" />
                        </div>
                        <span class="errorBox pwdConfirm" style="margin-left:135px; color:red;"></span>
                        <div class="d-flex justify-content-end" style=" width:735px;"><button id="btnModifyPwd" class="btn btn-success">비밀번호 변경</button></div>
                    </form>
                    <div class="d-flex justify-content-end mt-4" style=" width:735px;margin:24px auto;"><button id="signoutBtn" class="btn btn-danger">회원탈퇴</button></div>
                </div>

                <div id="profile2" style="display:none;">
                <div class="mx-3 mt-4 mb-5"><h3>내 작성글</h3></div>
                    <%@include file="/WEB-INF/views/includes/myBoard.jsp" %>
                      <!-- 페이징 -->
                      <%@include file="/WEB-INF/views/includes/myboardpaging.jsp"%>
                       <!-- 페이징 -->
                </div>

                <div id="profile3" style="display:none;">
                                <div class="mx-3 mt-4 mb-5"><h3>내 작성댓글</h3></div>
                                    <%@include file="/WEB-INF/views/includes/myReply.jsp" %>
                                      <!-- 페이징 -->
                                      <%@include file="/WEB-INF/views/includes/replypaging.jsp"%>
                                       <!-- 페이징 -->
                                </div>
            </div>
<!-- Modal1 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog"
        style="position: absolute; width:500px; top:20%; left:50%; transform:translate(-50%, -50%)">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title" id="myModalLabel">프로필 수정</h4>
          </div>
          <div class="modal-body" style="text-align: left;">
            <div id="emailChangeText">* 이메일 변경시 재인증이 완료되어야 변경됩니다.</div>
            <div class="modal-group">
              <label for="pwd" class="mb-2">비밀번호 확인</label>
              <input class="form-control" type="password" name="pwd" id="pwd">
            </div>

          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-outline-success" id="modalModBtn">확인</button>
            <button type="button" class="btn btn-outline-dark" data-dismiss="modal" id="modalCloBtn">닫기</button>
          </div>
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
      <div id="wrap-loading"><div>
                  <img src="/resources/images/loadingicon.gif" alt="ajaxLoader">
                </div>
              </div>
    </div>
    <!-- /.modal -->
    <!-- Modal2 -->
        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog"
            style="position: absolute; width:500px; top:20%; left:50%; transform:translate(-50%, -50%)">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">회원 탈퇴</h4>
              </div>
              <div class="modal-body" style="text-align: left;">
                <div class="modal-group">
                  <label for="pwd" class="mb-2">비밀번호 확인</label>
                  <input class="form-control" type="password" name="pwd2" id="pwd2">
                </div>

              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-outline-success" id="modalSignOut">확인</button>
                <button type="button" class="btn btn-outline-dark" data-dismiss="modal" id="modalCloBtn2">닫기</button>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
          <div id="wrap-loading"><div>
                      <img src="/resources/images/loadingicon.gif" alt="ajaxLoader">
                    </div>
                  </div>
        </div>
        <!-- /.modal -->
        </div>
</div>
<form id="actionForm" action="/user/profile" method='get'>
        <input type="hidden" name="pageNum" value="">
        <input type="hidden" name="amount" value="10">
        <input type="hidden" name="isBoardList" value="">
        <input type="hidden" name="isReplyList" value="">
    </form>
    </div>
    <jsp:include page="/WEB-INF/views/footer.jsp" />

        <script>
        document.title = "마이페이지 - POST 1T";
        var emailRegex =
              /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()\[\]\.,;:\s@\"]+\.)+[^<>()\[\]\.,;:\s@\"]{2,})$/;
               var pwRegex =
                          /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+])(?!.*[^a-zA-z0-9$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;

        var emailFlag = true;
        var emailChange = false;
        var nicknameFlag = true;
        var pwdFlag = false;
            $(document).ready(function () {
            $('head').append($('<link rel="stylesheet" type="text/css" />').attr('href', '/resources/css/certinfo.css'));

        showProfile = function (){
            $('#profile1').show();
            $('#profile2').hide();
            $('#profile3').hide();
        }
        showMyBoard = function (){
            $('#profile2').show();
            $('#profile1').hide();
            $('#profile3').hide();
        }
        showMyReply = function (){
            $('#profile3').show();
            $('#profile1').hide();
            $('#profile2').hide();
        }
        if("${isBoardList}" == "Y"){
                         showMyBoard();
                     }
        if("${isReplyList}" == "Y"){
                       showMyReply();
        }
        $("#pwd").on("keydown", function (e) {
            if (e.keyCode == 13) {
                $("#modalModBtn").trigger("click");
            }
        });

        $("#pwd2").on("keydown", function (e) {
            if (e.keyCode == 13) {
                $("#modalSignOut").trigger("click");
            }
        });

            $("#nickname").on("propertychange change keyup paste input", function(){
                var nickname = $("#nickname").val();
                if(nickname == "${user.nickname}"){
                    $(".nicknameCheck").empty();
                    nicknameFlag = true;
                }
                else if(nickname != ""){
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
                    $(".nicknameCheck").html("닉네임을 입력해주세요.");
                    $(".nicknameCheck").css("color", "red");
                    nicknameFlag = false;
                }
            });

          $("#name").on("propertychange change keyup paste input", function () {
            if ($("#name").val() == "") {
              $(".nameCheck").html("이름을 입력해주세요.");
              $(".nameCheck").css("color", "red");
            } else {
              $(".nameCheck").empty();
            }
          });

      $("#email").on("propertychange change keyup paste input", function () {

        var email = $("#email").val();
        console.log("이메일 유효성 검사");
        if(email == ""){
          $(".emailCheck").html("이메일을 입력해주세요.");
          $(".emailCheck").css("color", "red");
          emailFlag = false;
        }else if ($("#email").val() != "" && !emailRegex.test($("#email").val())) {
          $(".emailCheck").html("이메일 형식이 유효하지 않습니다.");
          $(".emailCheck").css("color", "red");
          emailFlag = false;
        } else if(email != "${user.email}"){
          $.ajax({
              type: "post",
              url: "/emailCheck",
              data: {
                email: email
              },
              success: function (res) {
                if (res) {
                  $(".emailCheck").html("사용 가능한 이메일입니다.");
                  $(".emailCheck").css("color", "green");
                  emailFlag = true;
                  emailChange = true;
                } else {
                  $(".emailCheck").html("이미 가입된 이메일입니다.");
                  $(".emailCheck").css("color", "red");
                  emailFlag = false;
                  emailChange = false;
                }
              },
              error: function () {
                alert("에러입니다");
              }
            });
          }else if(email == "${user.email}"){
            $(".emailCheck").empty();
            emailFlag = true;
            emailChange = false;
          }

      });

      $("#btnModify").on("click", function (e) {
        e.preventDefault();
        if ($("#nickname").val() == "" || $("#name").val() == "" || $("#email").val() == "") {
            if ($("#nickname").val() == "") {
                $(".nickname").html("닉네임을 입력해주세요.");
            }
            if ($("#name").val() == "") {
                $(".name").html("이름을 입력해주세요.");
            }
            if ($("#email").val() == "") {
                $(".email").html("이메일을 입력해주세요.");
            }
            return false;
        }else if(emailFlag != true || nicknameFlag != true){
            return false;
        }
        if(!emailChange){
            $("#emailChangeText").hide();
        }else{
            $("#emailChangeText").show();
        }
        $("#myModal").modal("show");
      });

        $("#modalModBtn").on("click", function () {
        $.ajax({
            type: "post",
            url: "/user/checkPwd",
            data: {
              pwd: $("#pwd").val()
            },
            success: function (res) {
                console.log(res);
              if (res) {
                $("#profileForm").submit();

              } else {
              alert("비밀번호가 일치하지 않습니다.");
              }
            },
            error: function () {
              alert("에러입니다");
            }
          });
        });

      $("#modalCloBtn").on("click", function () {
        $(".modal").modal("hide");
      });

        $("#profileForm").on("submit", function(e){
            e.preventDefault();
             $.ajax({
                type: "post",
                url: "/user/modifyProfile",
                beforeSend: function () {
                   $('#wrap-loading').show();
                },
                data: {
                  email: $("#email").val(),
                  nickname: $("#nickname").val(),
                  name: $("#name").val()
                },
                success: function () {console.log("modify success");
                    alert("변경사항이 저장되었습니다.");
                    location.reload();
                },
                complete: function () {
                   $('#wrap-loading').hide();
                },
                error: function () {
                  alert("에러입니다");
                }
              });
        });

           $("#newPwd").on("propertychange change keyup paste input", function () {
                console.log("비밀번호 유효성 검사");
                if ($("#newPwd").val() != "" && !pwRegex.test($("#newPwd").val())) {
                    $(".pwdCheck").html("비밀번호 규칙이 만족되지 않습니다.");
                    pwdFlag = false;
                } else {
                    $(".pwdCheck").empty();
                    pwdFlag = true;
                }
            });

            $("#newPwd2").on("propertychange change keyup paste input", function () {
                console.log("비밀번호 일치 검사");
                if ($("#newPwd2").val() != "" && !($("#newPwd").val() == $("#newPwd2").val())) {
                    $(".pwdConfirm").html("비밀번호가 일치하지 않습니다.");
                } else {
                    $(".pwdConfirm").empty();
                }
            });

            $("#btnModifyPwd").on("click", function (e) {
                e.preventDefault();
                if ($("#oldPwd").val() == "" || $("#newPwd").val() == "" || $("#newPwd2").val() == "") {

                    if ($("#oldPwd").val() == "") {
                        $(".oldPwd").html("현재 비밀번호를 입력해주세요.");
                    }
                    if ($("#newPwd").val() == "") {
                        $(".pwdCheck").html("새 비밀번호를 입력해주세요.");
                    }
                    if ($("#newPwd2").val() == "") {
                        $(".pwdConfirm").html("비밀번호 확인을 입력해주세요.");
                    }
                    return false;
                } else if ($("#newPwd").val() != $("#newPwd2").val()) {
                    return false;
                } else if(pwdFlag != true){
                   return false;
                }
                $.ajax({
                    type: "post",
                    url: "/user/modifyPwd",
                    beforeSend: function () {
                        $('#wrap-loading').show();
                    },
                    data: {
                        oldPwd: $("#oldPwd").val(),
                        newPwd: $("#newPwd").val()
                    },
                    success: function (res) {
                        if (res) {
                            console.log("pwdmodify success");
                            alert("비밀번호가 변경되었습니다.");
                            location.reload();
                        }else{
                            alert("현재 비밀번호가 일치하지 않습니다.");
                        }
                    },
                    complete: function () {
                        $('#wrap-loading').hide();
                    },
                    error: function () {
                        alert("에러입니다");
                    }
                });
            });

            var actionForm = $("#actionForm");
            $("#profile2 .page-item a").on("click" ,function(e){
                e.preventDefault();
                console.log("click.......");
                actionForm.find("input[name='pageNum']").val($(this).attr("href"));
                actionForm.find("input[name='isBoardList']").val("Y");
                //pageNum을 찾아서 href를 수정해줘 ~
                actionForm.submit();
            });

            $("#profile3 .page-item a").on("click" ,function(e){
                e.preventDefault();
                console.log("click.......");
                actionForm.find("input[name='pageNum']").val($(this).attr("href"));
                actionForm.find("input[name='isReplyList']").val("Y");
                //pageNum을 찾아서 href를 수정해줘 ~
                actionForm.submit();
            });

            $("#signoutBtn").on("click", function(){
                $("#myModal2").modal("show");
            });

            $('#modalSignOut').on('click', function(){
                $.ajax({
                    type: "post",
                    url: "/user/checkPwd",
                    data: {
                      pwd: $("#pwd2").val()
                    },
                    success: function (res) {
                        console.log(res);
                      if (res) {
                        signout();

                      } else {
                      alert("비밀번호가 일치하지 않습니다.");
                      }
                    },
                    error: function () {
                      alert("에러입니다");
                    }
                  });
            });

            $('#modalCloBtn2').on('click', function(){
                $("#myModal2").modal("hide");
            });

            function signout(){
                 $.ajax({
                     type: "get",
                     url: "/user/singout",
                     data: {
                     },
                     success: function (res) {
                         console.log(res);
                       if (res) {
                            alert(res);
                            location.href='/user/logout';
                       } else {
                       alert("오류가 발생했습니다.");
                       }
                     },
                     error: function () {
                       alert("에러입니다");
                     }
                   });
            }
            });
    </script>
   </body>
 </html>
