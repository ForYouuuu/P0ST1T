<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAnonymous()">
<jsp:include page="/WEB-INF/views/header.jsp" />
</sec:authorize>
<sec:authorize access="isAuthenticated()">
<jsp:include page="/WEB-INF/views/loginHeader.jsp" />
</sec:authorize>

  <div class="container contentWrap2">
    <div class="row">
    <div class="col">
    <div class="content">


      <div class="container pt-7 pb-2" style="text-align: center;margin-top:70px;">
        <div style="width: 100%; display: inline-block">

            <b style="font-size: 3.3ch;">인증된 </b>
            <b style="color: dodgerblue; font-size: 6ch;">자격증</b>
            <b style="font-size: 3.3ch;"> 리뷰 &nbsp;&nbsp;&nbsp;</b>
            <b style="font-size: 6ch;">P0ST 1T</b>


        </div>
      </div>

      <div class="container pt-7 pb-2 aboutcert" style="text-align: center;margin-top:150px;visibility: hidden;">
        <div style="width: 100%; display: inline-block">
          <div class="landingpage-title mt-2" id="top-box">
            <b style="font-size: 5ch;">📘 자격증정보</b>

          </div>
          <div class="landingpage-title mt-5" id="top-box">
            <b style="font-size: 3ch;">IT 국가기술자격증의 정보를 확인하세요.</b>
          </div>
        </div>
      </div>

      <div class="container pt-7 pb-2 aboutcfirm" style="text-align: center;margin-top:150px;visibility: hidden;">
        <div style="width: 100%; display: inline-block">
          <div class="landingpage-title mt-2" id="top-box">
            <b style="font-size: 5ch;">✔ 인증받기</b>

          </div>
          <div class="landingpage-title mt-5" id="top-box">
            <b style="font-size: 3ch;">자격증 취득을 인증받고 리뷰를 작성해보세요.</b>
          </div>
        </div>
      </div>

      <div class="container pt-7 pb-2 aboutcommunity" style="text-align: center;margin-top:150px;visibility: hidden;">
        <div style="width: 100%; display: inline-block">
          <div class="landingpage-title mt-2" id="top-box">
            <b style="font-size: 5ch;">💬 커뮤니티</b>

          </div>
          <div class="landingpage-title mt-5" id="top-box" style="text-align: center; width: 100%; margin: 0 auto;">
            <b style="font-size: 3ch;">자유게시판</b>
          </div>
          <div class="landingpage-title mt-3" id="top-box" style="text-align: center; width: 100%; margin: 0 auto;">
            <b style="font-size: 2.5ch;">자유주제의 글을 작성하고 공유하세요.</b>
          </div>
          <div class="landingpage-title mt-5" id="top-box" style="text-align: center; width: 100%; margin: 0 auto;">
            <b style="font-size: 3ch;">묻고답하기</b>
          </div>
          <div class="landingpage-title mt-3" id="top-box" style="text-align: center; width: 100%; margin: 0 auto;">
            <b style="font-size: 2.5ch;">자격증과 관련된 질문과 답변을 공유하세요.</b>
          </div>
          <div class="landingpage-title mt-5" id="top-box" style="text-align: center; width: 100%; margin: 0 auto;">
            <b style="font-size: 3ch;">리뷰</b>
          </div>
          <div class="landingpage-title mt-3" id="top-box" style="text-align: center; width: 100%; margin: 0 auto;">
            <b style="font-size: 2.5ch;">인증된 자격증 취득자의 믿을 수 있는 리뷰를 조회하세요.</b>
          </div>
          <div class="landingpage-title mt-5" id="top-box" style="text-align: center; width: 100%; margin: 0 auto;">
            <b style="font-size: 3ch;">문의하기</b>
          </div>
          <div class="landingpage-title mt-3" id="top-box" style="text-align: center; width: 100%; margin: 0 auto;">
            <b style="font-size: 2.5ch;">관리자에게 문의하고 싶은 사항을 등록하세요.</b>
          </div>
        </div>
      </div>

      <div class="container pt-7 pb-2 aboutteam"
        style="text-align: center;margin-top:150px;margin-bottom: 200px;visibility: hidden;">
        <div style="width: 100%; display: inline-block">
          <div class="landingpage-title mt-2" id="top-box">
            <b style="font-size: 5ch;">👥 팀 소개</b>

          </div>
          <div class="landingpage-title mt-5" id="top-box" style="width: 100%; margin: 0 auto;">
            <b style="font-size: 3ch;">👤 민경운</b>
          </div>
          <div class="landingpage-title mt-3" id="top-box" style="width: 100%; margin: 0 auto;">
            <b style="font-size: 2.5ch;">관리자메뉴, 커뮤니티, 디자인 구현</b>
          </div>
          <div class="landingpage-title mt-5" id="top-box" style="width: 100%; margin: 0 auto;">
            <b style="font-size: 3ch;">👤 김우종</b>
          </div>
          <div class="landingpage-title mt-3" id="top-box" style="width: 100%; margin: 0 auto;">
            <b style="font-size: 2.5ch;">로그인/가입, 인증, 자격증정보, 커뮤니티, 보안 구현</b>
          </div>
          <div class="landingpage-title mt-5" id="top-box" style="width: 100%; margin: 0 auto;">
            <b style="font-size: 3ch;">👤 김의집</b>
          </div>
          <div class="landingpage-title mt-3" id="top-box" style="width: 100%; margin: 0 auto;">
            <b style="font-size: 2.5ch;">관리자메뉴, 커뮤니티, 디자인 구현</b>
          </div>
          <div class="landingpage-title mt-5" id="top-box" style="text-align:center;width: 100%; margin: 0 auto;">
            <b style="font-size: 2.5ch;">주소</b>
          </div>
          <div class="landingpage-title mt-3" id="top-box" style="text-align:center;width: 100%; margin: 0 auto;">
            <b style="font-size: 2.3ch;">서울시 관악구 봉천로 227 보라매샤르망 5층</b>
          </div>
          <div class="landingpage-title mt-5" id="top-box" style="text-align:center;width: 100%; margin: 0 auto;">
            <b style="font-size: 2.5ch;">이메일</b>
          </div>
          <div class="landingpage-title mt-3" id="top-box" style="text-align:center;width: 100%; margin: 0 auto;">
            <b style="font-size: 2.3ch;">민경운 achieve-life@naver.com</b>
          </div>
          <div class="landingpage-title mt-2" id="top-box" style="text-align:center;width: 100%; margin: 0 auto;">
            <b style="font-size: 2.3ch;">김우종 dnwhd0502@gmail.com</b>
          </div>
          <div class="landingpage-title mt-2" id="top-box" style="text-align:center;width: 100%; margin: 0 auto;">
            <b style="font-size: 2.3ch;">김의집 houseofkim@naver.com</b>
          </div>
        </div>
      </div>
    </div>
  </div>
  </div>
  </div>


<sec:authorize access="hasRole('ROLE_ADMIN')">
<jsp:include page="/WEB-INF/views/adminfooter.jsp" />
</sec:authorize>
<sec:authorize access="isAnonymous()">
<jsp:include page="/WEB-INF/views/footer.jsp" />
</sec:authorize>
<sec:authorize access="isAuthenticated() && !hasRole('ROLE_ADMIN')">
<jsp:include page="/WEB-INF/views/footer.jsp" />
</sec:authorize>

<script type="text/javascript">
    $(document).ready(function () {
    $('head').append($('<link rel="stylesheet" type="text/css" />').attr('href', '/resources/css/certinfo.css'));
});

</script>
<style>
@keyframes fadeIn{
    from{
      opacity: 0;
      transform: translateY(20px);
    }

    to{
      opacity: 3;
      transform: none;
      visibility: visible;
    }
  }

  @-moz-keyframes fadeIn{
    from{
      opacity: 0;
      transform: translateY(20px);
    }

    to{
      opacity: 3;
      transform: none;
      visibility: visible;
    }
  }

  @-webkit-keyframes fadeIn{
    from{
      opacity: 0;
      transform: translateY(20px);
    }

    to{
      opacity: 3;
      transform: none;
      visibility: visible;
    }
  }

  @-o-keyframes fadeIn{
    from{
      opacity: 0;
      transform: translateY(20px);
    }

    to{
      opacity: 3;
      transform: none;
      visibility: visible;
    }
  }

  .aboutcert{

    animation: fadeIn 1.2s ease-in-out;
    -moz-animation: fadeIn 1.2s ease-in-out;
    -webkit-animation: fadeIn 1.2s ease-in-out;
    -o-animation: fadeIn 1.2s ease-in-out;
    animation-fill-mode: forwards;
  }

  .aboutcfirm{
    animation: fadeIn 1.2s ease-in-out;
    -moz-animation: fadeIn 1.2s ease-in-out;
    -webkit-animation: fadeIn 1.2s ease-in-out;
    -o-animation: fadeIn 1.2s ease-in-out;
    animation-delay: 1s;
    animation-fill-mode: forwards;

  }

  .aboutcommunity{
    animation: fadeIn 1.2s ease-in-out;
    -moz-animation: fadeIn 1.2s ease-in-out;
    -webkit-animation: fadeIn 1.2s ease-in-out;
    -o-animation: fadeIn 1.2s ease-in-out;
    animation-delay: 2s;
    animation-fill-mode: forwards;
  }

  .aboutteam{

    animation: fadeIn 1.2s ease-in-out;
    -moz-animation: fadeIn 1.2s ease-in-out;
    -webkit-animation: fadeIn 1.2s ease-in-out;
    -o-animation: fadeIn 1.2s ease-in-out;
    animation-delay: 3s;
    animation-fill-mode: forwards;
  }
</style>
</body>
</html>