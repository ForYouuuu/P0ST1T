<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAuthenticated()">
<jsp:include page="/WEB-INF/views/loginHeader.jsp" />
</sec:authorize>

<div class="contentWrap container-fluid">

    <div class="content">
      <div class="row mb-3">
        <div class="col-lg-12">
          <h1 class="page-header">자격취득 인증</h1>
        </div>
        <!-- /.col-lg-12 -->
      </div>
      <h5 class="mb-5">인증완료 후 리뷰 작성이 가능합니다.</h5>
      <div class="example mb-4">
        <ul>
          <li>자격증번호 입력 예시
            <br>예시1) 숫자 + 영문(대문자)인 경우 : 11111222223A
            <br>예시2) 숫자만으로 구성된 경우 : 1111122222
          </li>
        </ul>
      </div>
      <form id="frm01" class="mb-4">

        <div class="d-flex align-items-center mb-4">
          <h4 class="frmLabelBox"><label class="frmLabel" for="qname">자격명</label></h4>

          <select class="form-select inputBox" id="qname">
            <option value="">자격명을 선택하세요.</option>
            <option value="B490007">정보관리기술사</option>
            <option value="B490007">정보처리기사</option>
            <option value="B490007">정보처리산업기사</option>
            <option value="B490007">정보처리기능사</option>
            <option value="B552729">정보보안기사</option>
            <option value="B552729">정보보안산업기사</option>
            <option value="B490007">컴퓨터시스템응용기술사</option>
            <option value="B490007">전자계산기조직응용기사</option>
            <option value="B490007">사무자동화산업기사</option>
            <option value="B490007">정보기기운용기능사</option>
            <option value="B552729">정보통신기술사</option>
            <option value="B552729">정보통신기사</option>
            <option value="B552729">정보통신산업기사</option>
            <option value="B490007">전자계산기기사</option>
            <option value="B490007">전자계산기제어산업기사</option>
            <option value="B490007">전자계산기기능사</option>
            <option value="B490007">로봇소프트웨어개발기사</option>
            <option value="B490007">임베디드기사</option>
            <option value="B490007">컴퓨터그래픽스운용기능사</option>
            <option value="B490007">웹디자인기능사</option>
          </select>

        </div>

        <div class="d-flex align-items-center mb-4">
          <h4 class="frmLabelBox"><label class="frmLabel" for="reqtInstCode">요청기관</label></h4>

          <select class="form-select inputBox" name="reqtInstCode" id="reqtInstCode" disabled>
            <option value="">자격명을 선택하세요.</option>
            <option value="B490007">한국산업인력공단</option>
            <option value="B552729">한국방송통신전파진흥원</option>
          </select>

        </div>

        <div class="d-flex align-items-center mb-4">
          <h4 class="frmLabelBox"><label class="frmLabel" for="reqtUserName">성명</label></h4>

          <input class="form-control inputBox" type="text" value="" id="reqtUserName" name="reqtUserName"
            maxlength="20" />

        </div>

        <div class="d-flex align-items-center mb-4">
          <h4 class="frmLabelBox"><label class="frmLabel" for="ctftNo">자격증번호</label></h4>

          <input class="form-control inputBox" type="text" value="" id="ctftNo" name="ctftNo"
            maxlength="20" />


        </div>
        <div id="wrap-loading">
          <div>
            <img src="/resources/images/loadingicon.gif" alt="ajaxLoader">
          </div>
        </div>
        <button type="button" class="btn btn-primary" id="btnCfirm" title="자격증 진위확인 조회">인증받기</button>

      </form>
      <div class="result"
        style="padding: 13px 0; width: 570px; margin-left: auto;margin-right:auto;margin-bottom:40px; border: 1px solid black; border-radius: 6px;">
        <h4>인증결과</h4>
        <hr>
        <span class="checkText">인증정보 입력후 인증해주세요.</span>
        <div id="checkSuccess" class="mt-3" style="display: none;">
          <div class="mb-2">인증된 정보를 저장하시겠습니까?</div>
          <button class="btn btn-outline-primary" id="btnSave">저장</button>
        </div>
      </div>
    </div>

  </div>
  <jsp:include page="/WEB-INF/views/footer.jsp" />


  <script type="text/javascript">
    document.title = "인증받기 - POST 1T";
    $(document).ready(function () {
    $('head').append($('<link rel="stylesheet" type="text/css" />').attr('href', '/resources/css/certinfo.css'));

      $('#qname').on('change', function () {
        if ($('#qname').val() == "B490007") {
          $('#reqtInstCode option:eq(1)').prop('selected', true);
        } else if ($('#qname').val() == "B552729") {
          $('#reqtInstCode option:eq(2)').prop('selected', true);
        } else {
          $('#reqtInstCode option:eq(0)').prop('selected', true);
        }

      });

      $("#btnCfirm").click(function () {
        fn_cfirm();
      });

      function fn_cfirm() {

        if ($("#qname").val() == "") {
          alert("자격명을 선택하세요.");
          $("#qname").focus();
          return;
        }
        if ($.trim($("#reqtUserName").val()) == "" || $.trim($("#reqtUserName").val()) == null) {
          alert("성명을 입력하세요.");
          $("#reqtUserName").focus();
          return;
        }
        if ($.trim($("#ctftNo").val()) == "" || $.trim($("#ctftNo").val()) == null) {
          alert("자격증번호를 입력하세요.");
          $("#ctftNo").focus();
          return;
        }
        $.ajax({
          url: 'https://cors-dnwhd.herokuapp.com/https://www.gov.kr/mw/NisCertificateConfirmExecute.do',
          type: 'POST',
          async: true,
          data: {
            reqtInstCode: $.trim($("#reqtInstCode").val()),
            reqtUserName: $.trim($("#reqtUserName").val()),
            ctftNo: $.trim($("#ctftNo").val())
          },
          dataType: 'JSON',
          beforeSend: function () {

            $('#wrap-loading').show();
          },
          success: function (data) {

            console.log(data['trfsYn']);
            if (data['trfsYn'] == "Y") {
              $('.checkText').html('인증이 완료되었습니다.');
              $('#checkSuccess').show();
            } else if (data['trfsYn'] == "N") {
              $('.checkText').html('인증에 실패하였습니다. 다시 한 번 확인해주세요.');
              $('#checkSuccess').hide();
            }

          },

          complete: function () {
            $('#wrap-loading').hide();
          }

        });
      }

      $('#btnSave').click(function () {
        $('.result').empty();
        var qname = $("#qname option:selected").text();
        var name = $.trim($("#reqtUserName").val());
        str =
          '<div><h4>아래 인증 정보를 저장합니다</h4><hr>' +
          '<div class="checkText">자격명 : ' + qname + '</div>' +
          '<div class="checkText">성명 : ' + name + '</div>' +
          '<button class="btn btn-outline-primary mt-2" onclick="save();">저장</button></div>';
        $('.result').html(str);

      });

    save = function (){
        $.ajax({
          type: "post",
          url: "/certinfo/saveCfirm",
          data: {
            qname : $("#qname option:selected").text()
          },
          success: function (res) {
            if(res >= 1){
              console.log("save success");
              alert("인증정보가 저장되었습니다.");
              location.href='/';
            }else{
              alert("이미 인증받은 정보입니다.");
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