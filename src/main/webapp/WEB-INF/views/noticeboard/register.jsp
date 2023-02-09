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

             <div class="boardHeader col-8 card py-2"><h1 style="color: white;">공지사항 등록</h1></div></div>

        <div class="row">
          <div class="col-2"> </div>



    <div class="col-8 card ">
      <form role="form" action="/noticeboard/register" method="post">

    <label for="categoryid">분류</label>
    <select id="categoryid" name="categoryid" class="custom-select" onchange="document.getElementById('categoryname').value = this.options[this.selectedIndex].text">
 			<option value="1" <c:if test="${categoryid==1}"> selected </c:if>>공지사항</option>
 			<option value="2" <c:if test="${categoryid=='2'}"> selected </c:if>>자유게시판</option>
  			<option value="3" <c:if test="${categoryid=='3'}"> selected </c:if>>묻고답하기</option>
  			<option value="4" <c:if test="${categoryid=='4'}"> selected </c:if>>리뷰</option>
  			<option value="5" <c:if test="${categoryid=='5'}"> selected </c:if>>문의하기</option>

    </select>
    <input type="hidden" id="categoryname" name="categoryname" value="${noticeBoardVO.categoryname}" >



      <div class="form-group">
        <label for="title">제목</label>
          <input id="title" class="form-control" maxlength="30" name="title" placeholder="제목은 3글자 이상 입력해주세요." value="${noticeboardVO.title}">
            <span>	${valid_title }</span>
      </div>

      <div class="form-group">
        <label for="content">내용</label>
          <textarea id="content" class="form-control " maxlength="2000" rows="10" placeholder="내용은 10글자 이상 입력해주세요." name="content">${noticeboardVO.content}</textarea>
              <span>${valid_content }</span>
      </div>

      <div class="form-group">
        <label for="writer">작성자</label>
        <input class="form-control" placeholder="Enter text" id="writer" name="writer" value="${noticeboardVO.writer}" readonly>
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
<%@include file="/WEB-INF/views/footer.jsp"%>
<script>
    document.title = "공지사항 등록 - POST 1T";
    $(document).ready(function () {
        $("#categoryname").val($("#categoryid option:selected").text());
        $('head').append($('<link rel="stylesheet" type="text/css" />').attr('href', '/resources/css/board.css'));
        $("#writer").val("${user.nickname}");
    });
</script>
</body></html>


