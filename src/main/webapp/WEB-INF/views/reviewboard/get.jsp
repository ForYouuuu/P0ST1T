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
    <div id="body-content">

    <div class="container" >
      <div class="row mb-2">
                    <div class="col-1"></div>

                  <div class="boardHeader col-10 card py-2"><h1 style="color: white;">리뷰<span style="margin-left:10px;font-size:20px;">[<c:out value="${vo.qname}"/>]</span></h1></div></div>

          <div class="row">

            <div class="col-1"> </div>

          <div class="col-10 card ">
            <div class="form-group">
              <input type="hidden" class="form-control" name="bno"  value='<c:out value="${vo.bno}"/>' readonly>
          </div>

        <div class="d-flex flex-column form-group mt-2">
                <div class="d-flex align-items-center mb-1" style="width:100%;">
                  <input class="form-control-plaintext" style="font-size:25px;width:100%;display:inline;" name="title" value='<c:out value="${vo.title}"/>' readonly>

                    </div>
                    <div style="padding-right:15px;"><span style=" text-align:center;">작성자 <c:out value="${vo.writer}"/></span>
                    <span style="margin-left:20px; text-align:center;">작성일 <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${vo.updatedate }"/></span>
                    <span style="text-align:center;float:right;">조회수 <c:out value="${vo.viewcount}"/></span>
                    </div>
                </div>
                <hr>
                <div class="form-group">
                  <textarea class="form-control-plaintext" rows="3" name="content"  readonly><c:out value="${vo.content}" /></textarea>
                </div>


        <hr>
        <div class="container">
                <div class="d-flex justify-content-end mb-3">
                    <c:if test="${user.userId == vo.writerid}">
                        <button data-oper="modify" class="btn btn-primary justify-content-right "
                            onClick="location.href='modify?bno=<c:out value=" ${bVo.bno}" />'">수정</button>
                    </c:if>

                    <button data-oper="list" class="btn btn-primary goBack">목록</button>
                    <button type="button" id="like-btn" onClick="updateLike();">추천🤍${vo.likehit}</button>
                </div>

                <form id="operForm" action="/reviewboard/modify" method="get">
                  <input type="hidden" id="bno" name="bno" value='<c:out value="${vo.bno}"/>'>
                  <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
                  <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
                  <input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
                  <input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
                  <input type="hidden" name="sort" value='<c:out value="${cri.sort}"/>'>
                  <input type="hidden" name= "qid" value='<c:out value="${cri.qid}"/>'>
                </form>

        </div>
      </div>
    </div>
</div>

<%@include file="/WEB-INF/views/includes/replyform.jsp"%>


<%@include file="/WEB-INF/views/includes/reviewboardlist.jsp"%>

<%@include file="/WEB-INF/views/footer.jsp"%>

<script type ="text/javascript" src="/resources/js/reply.js"></script>

<%@include file="/WEB-INF/views/includes/replyajax.jsp"%>

 <script type="text/javascript">

      $(document).ready(function(){
      if("${isLiked}" == "true"){
                  $("#like-btn").css('background', '#6CC0FF');
                  $("#like-btn").html("추천❤${vo.likehit}");

              }
       <!-- 게시글 상세 -->
             	var operForm = $("#operForm");

         	    $("button[data-oper='modify']").on('click', function(e){
         		    operForm.attr("action","/reviewboard/modify").submit();
         	     });

         	    $("button[data-oper='list']").on("click",function(e){
             		operForm.find("#bno").remove();
         	    	operForm.attr("action", "/reviewboard/list");
         		    operForm.submit();
         	     });
        });
    </script>
</body>
</html>
