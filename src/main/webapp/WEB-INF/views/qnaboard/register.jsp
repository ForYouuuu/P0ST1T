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

             <div class="boardHeader col-8 card py-2"><h1 style="color: white;">묻고답하기 등록</h1></div></div>

        <div class="row">
          <div class="col-2"> </div>





    <div class="col-8 card ">
      <form role="form" action="/qnaboard/register" method="post">

    <div class="form-group">
    <label for="qid">자격명</label>
    <select id="qid" name="qid" class="form-select custom-select" onchange="document.getElementById('qname').value = this.options[this.selectedIndex].text">
 			<option value="1" <c:if test="${qid==1}"> selected </c:if>>정보관리기술사</option>
 			<option value="2" <c:if test="${qid=='2'}"> selected </c:if>>정보처리기사</option>
  			<option value="3" <c:if test="${qid=='3'}"> selected </c:if>>정보처리산업기사</option>
  			<option value="4" <c:if test="${qid=='4'}"> selected </c:if>>정보처리기능사</option>
  			<option value="5" <c:if test="${qid=='5'}"> selected </c:if>>정보보안기사</option>
  			<option value="6" <c:if test="${qid=='6'}"> selected </c:if>>정보보안산업기사</option>
  			<option value="7" <c:if test="${qid=='7'}"> selected </c:if>>컴퓨터시스템응용기술사</option>
  			<option value="8" <c:if test="${qid=='8'}"> selected </c:if>>전자계산기조직응용기사</option>
  			<option value="9" <c:if test="${qid=='9'}"> selected </c:if>>빅데이터분석기사</option>
  			<option value="10" <c:if test="${qid=='10'}"> selected </c:if>>사무자동화산업기사</option>
  			<option value="11" <c:if test="${qid=='11'}"> selected </c:if>>정보기기운용기능사</option>
  			<option value="12" <c:if test="${qid=='12'}"> selected </c:if>>정보통신기술사</option>
  			<option value="13" <c:if test="${qid=='13'}"> selected </c:if>>정보통신기사</option>
  			<option value="14" <c:if test="${qid=='14'}"> selected </c:if>>정보통신산업기사</option>
  			<option value="15" <c:if test="${qid=='15'}"> selected </c:if>>전자계산기기사</option>
  			<option value="16" <c:if test="${qid=='16'}"> selected </c:if>>전자계산기제어산업기사</option>
  			<option value="17" <c:if test="${qid=='17'}"> selected </c:if>>전자계산기기능사</option>
  			<option value="18" <c:if test="${qid=='18'}"> selected </c:if>>로봇소프트웨어개발기사</option>
  			<option value="19" <c:if test="${qid=='19'}"> selected </c:if>>임베디드기사</option>
  			<option value="20" <c:if test="${qid=='20'}"> selected </c:if>>컴퓨터그래픽스운용기능사</option>
  			<option value="21" <c:if test="${qid=='21'}"> selected </c:if>>웹디자인기능사</option>
    </select>
    <input type="hidden" id="qname" name="qname" value="${qnaBoardVO.qname}" >
    </div>


      <div class="form-group">
        <label for="title">제목</label>
          <input id="title" class="form-control" maxlength="30" placeholder="제목은 3글자 이상 입력해주세요." name="title" value="${qnaBoardVO.title}">
            <span>	${valid_title }</span>
      </div>

      <div class="form-group">
        <label for="content">내용</label>
          <textarea id="content" class="form-control" maxlength="2000" rows="10" placeholder="내용은 10글자 이상 입력해주세요." name="content">${qnaBoardVO.content}</textarea>
              <span>${valid_content }</span>
      </div>

      <div class="form-group">
        <label for="writer">작성자</label>
        <input class="form-control" placeholder="Enter text" id="writer" name="writer" value="${qnaBoardVO.writer}" readonly>

      </div>

      <div class="container mt-2 mb-4">
        <div class="row">
          <div class="col-lg-6 col-sm-12 text-lg-start text-center "> </div>
            <div class="col-lg-6 col-sm-12 text-lg-end text-center ">
              <button type="submit" class="btn btn-primary justify-content-right regBtn ">등록</button>
              <button type= "button"  class ="btn btn-warning" onClick="history.go(-1);return false;">취소</button>
            </div></div></div>
          </form>


        </div>
      </div>
    </div>
  </div>
</div>
<%@include file="/WEB-INF/views/footer.jsp"%>
<script>
    document.title = "묻고답하기 등록 - POST 1T";
    $(document).ready(function () {
        $("#qname").val($("#qid option:selected").text());
        $('head').append($('<link rel="stylesheet" type="text/css" />').attr('href', '/resources/css/board.css'));
        $("#writer").val("${user.nickname}");
    });
</script>
</body></html>







