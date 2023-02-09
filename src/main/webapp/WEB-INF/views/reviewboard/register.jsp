<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sec:authorize access="isAnonymous()">
<jsp:include page="/WEB-INF/views/header.jsp" />
</sec:authorize>
<sec:authorize access="isAuthenticated()">
<jsp:include page="/WEB-INF/views/loginHeader.jsp" />
</sec:authorize>

<div id="body-wrapper">
    <div id="body-content" style="margin-bottom:50px;">
  <div class="container" >
  <div class="row mb-2">
      <div class="col-2"></div>

           <div class="boardHeader col-8 card py-2"><h1 style="color: white;">리뷰 등록</h1></div></div>

        <div class="row">
          <div class="col-2"> </div>



    <div class="col-8 card ">
      <form role="form" action="/reviewboard/register" method="post">

<div class="form-group">
    <label for="qid">자격명</label>
    <select id="qid" name="qid" class="form-select custom-select" onchange="document.getElementById('qname').value = this.options[this.selectedIndex].text">

        </select>
        <input type="hidden" id="qname" name="qname" value="${qnaBoardVO.qname}" >
</div>


      <div class="form-group">
        <label for="title">제목</label>
          <input id="title" class="form-control" maxlength="30" name="title" placeholder="제목은 3글자 이상 입력해주세요." value="${reviewBoardVO.title}">
            <span>	${valid_title }</span>
      </div>

      <div class="form-group">
        <label for="content">내용</label>
          <textarea id="content" class="form-control" maxlength="2000" rows="10" placeholder="내용은 10글자 이상 입력해주세요." name="content">${reviewBoardVO.content}</textarea>
              <span>${valid_content }</span>
      </div>

      <div class="form-group">
        <label for="writer">작성자</label>
        <input class="form-control" placeholder="Enter text" id="writer" name="writer" value="${reviewBoardVO.writer}" readonly>
      </div>

      <div class="container mt-2 mb-4">
        <div class="row">
          <div class="col-lg-6 col-sm-12 text-lg-start text-center "> </div>
            <div class="col-lg-6 col-sm-12 text-lg-end text-center ">
              <button type="submit" class="btn btn-primary justify-content-right ">등록</button>
              <button type= "button"  class ="btn btn-warning" onClick="history.go(-1);return false;">취소</button>
            </div></div></div>
          </form>


        </div>
      </div>
    </div>
  </div>
</div>
<script>function fn_append(qid){
                switch(qid){

                                case 1: $('#qid').append('<option value="1">정보관리기술사</option>');break;
                                case 2: $('#qid').append('<option value="2">정보처리기사</option>');break;
                                case 3: $('#qid').append('<option value="3">정보처리산업기사</option>');break;
                                case 4: $('#qid').append('<option value="4">정보처리기능사</option>');break;
                                case 5: $('#qid').append('<option value="5">정보보안기사</option>');break;
                                case 6: $('#qid').append('<option value="6">정보보안산업기사</option>');break;
                                case 7: $('#qid').append('<option value="7">컴퓨터시스템응용기술사</option>');break;
                                case 8: $('#qid').append('<option value="8">전자계산기조직응용기사</option>');break;
                                case 9: $('#qid').append('<option value="9">빅데이터분석기사</option>');break;
                                case 10: $('#qid').append('<option value="10">사무자동화산업기사</option>');break;
                                case 11: $('#qid').append('<option value="11">정보기기운용기능사</option>');break;
                                case 12: $('#qid').append('<option value="12">정보통신기술사</option>');break;
                                case 13: $('#qid').append('<option value="13">정보통신기사</option>');break;
                                case 14: $('#qid').append('<option value="14">정보통신산업기사</option>');break;
                                case 15: $('#qid').append('<option value="15">전자계산기기사</option>');break;
                                case 16: $('#qid').append('<option value="16">전자계산기제어산업기사</option>');break;
                                case 17: $('#qid').append('<option value="17">전자계산기기능사</option>');break;
                                case 18: $('#qid').append('<option value="18">로봇소프트웨어개발기사</option>');break;
                                case 19: $('#qid').append('<option value="19">임베디드기사</option>');break;
                                case 20: $('#qid').append('<option value="20">컴퓨터그래픽스운용기능사</option>');break;
                                case 21: $('#qid').append('<option value="21">웹디자인기능사</option>');break;
                                }
            }</script>
<c:forEach items="${cfirmList}" var="item">
<c:set var="qid" value="${item.user_cfirm}"/>
<script language=javascript>fn_append(${qid});</script>
</c:forEach>
<%@include file="/WEB-INF/views/footer.jsp"%>

<script type="text/javascript">
    document.title = "리뷰 등록 - POST 1T";
    $(document).ready(function () {

        $("#qname").val($("#qid option:selected").text());
        $('head').append($('<link rel="stylesheet" type="text/css" />').attr('href', '/resources/css/board.css'));
                    $("#writer").val("${user.nickname}");
    });
</script>
</body></html>
