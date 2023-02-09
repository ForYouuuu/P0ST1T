<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

           <div class="boardHeader col-8 card py-2"><h1 style="color: white;">리뷰 수정</h1></div></div>


      <div class="row">
        <div class="col-2"> </div>

        <div class="col-8 card ">
           <form role="form" action="/reviewboard/modify" method="post">
               <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
               <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
                 <input type='hidden' name='writerid' value='<c:out value="${vo.writerid}"/>'>
                 <input type="hidden" name= "categoryid" value='<c:out value="${cri.categoryid}"/>'>

              <div class="form-group">
                  <input type="hidden" class="form-control" name="bno"  value='<c:out value="${vo.bno}"/>' readonly>
              </div>

              <div class="form-group">
                <label for="title">제목</label>
                    <input id="title" class="form-control" name="title" maxlength="30" placeholder="제목은 3글자 이상 입력해주세요."
                     value='<c:out value="${vo.title}"/>' >
                     <span>	${valid_title }</span>
                </div>

              <div class="form-group">
                <label for="content">내용</label>
                    <textarea id="content" class="form-control" rows="3" maxlength="2000" placeholder="내용은 10글자 이상 입력해주세요." name="content"><c:out value="${vo.content}"/></textarea>
                    <span>${valid_content }</span>
               </div>

            <div class="form-group">
              <label for="writer">작성자</label>
                <input class="form-control"  name="writer"
                value='<c:out value="${vo.writer}"/>' readonly>
            </div>



        <div class="container mt-2 mb-4">
          <div class="row">
            <div class="col-lg-6 col-sm-12 text-lg-start text-center "> </div>
              <div class="col-lg-6 col-sm-12 text-lg-end text-center ">
                 <button type="submit" data-oper='modify' class="btn btn-light justify-content-right">저장</button>
                  <button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
                <button type="submit" data-oper='list' class="btn btn-primary">취소</button>
              </div></div></div>
           </form>
          </div>

        </div>

      </div>
    </div>
  </div>




<script type="text/javascript">
document.title = "리뷰 수정 - POST 1T";
$(document).ready(function(){
    $('head').append($('<link rel="stylesheet" type="text/css" />').attr('href', '/resources/css/board.css'));

	var formObj = $("form");

	$('button').on("click", function(e){
		e.preventDefault();

		var operation = $(this).data("oper");
		console.log(operation);

		if(operation === "remove"){
			formObj.attr("action", "/reviewboard/remove");

		}else if(operation ==="list"){
			formObj.attr("action","/reviewboard/list").attr("method","get");
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var typeTag = $("input[name='type']").clone();
			var keywordTag = $("input[name='keyword']").clone();
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(typeTag);
			formObj.append(keywordTag);
		}

		formObj.submit();
	});
});
</script>

<%@include file="/WEB-INF/views/footer.jsp"%>
    </body></html>