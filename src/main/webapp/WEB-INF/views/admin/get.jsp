<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>
<%@include file="/WEB-INF/views/admin/adminheader.jsp"%>

    <div class="container mt-5" >

      <h1 class="text-center mt-3 mb-5"> 관리자 게시판</h1>
          <div class="row">

            <div class="col-1"> </div>

          <div class="col-10 card ">
            <div class="form-group">
              <input type="hidden" class="form-control" name="bno"  value='<c:out value="${vo.bno}"/>' readonly>
          </div>

        <div class="form-group">
            <label> 게시판 </label> <input class="form-control" name="boardname" value='<c:out value="${vo.boardname}"/>' readonly>
        </div>

        <div class="form-group">
          <label>제목</label> <input class="form-control" name="title" value='<c:out value="${vo.title}"/>' readonly>
        </div>

        <div class="form-group">
          <label>내용</label>
          <textarea class="form-control " rows="3" name="content"  readonly>
              <c:out value="${vo.content}" />
            </textarea>
        </div>

        <div class="form-group">
          <label type="">작성자</label>
          <input class="form-control" placeholder="Enter text" name="writer"
                value='<c:out value="${vo.writer}"/>' readonly>
        </div>

        <div class="container mt-4">
          <div class="row">

            <div class="col-lg-6 col-sm-12 text-lg-start text-center "> </div>
              <div class="col-lg-6 col-sm-12 text-lg-end text-center ">
                <button type= "button"  class ="btn btn-warning" onClick="history.go(-1);return false;">목록으로</button>
                <button type="button" id="like-btn" onClick="updateLike();">추천${vo.likehit}</button>
              </div>

                <form id="operForm" action="/admin/modify" method="get">
                  <input type="hidden" id="bno" name="bno" value='<c:out value="${vo.bno}"/>'>
                  <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
                  <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
                  <input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
                  <input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
                  <input type="hidden" name="boardid" value='<c:out value="${cri.boardid}"/>'>
                  <input type="hidden" name="categoryname" value='<c:out value="${cri.categoryname}"/>'>

                </form>
          </div>
        </div>
      </div>
    </div>
</div>

<!-- 게시글 상세 끝 -->
<%@include file="/WEB-INF/views/includes/replyform.jsp"%>
<%@include file="/WEB-INF/views/admin/list.jsp"%>
<%@include file="/WEB-INF/views/includes/replyajax.jsp"%>
<script type ="text/javascript" src="/resources/js/reply.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>


  <script type="text/javascript">

        $(document).ready(function(){
         <!-- 게시글 상세 -->
               	var operForm = $("#operForm");

           	    $("button[data-oper='modify']").on('click', function(e){
           		    operForm.attr("action","/admin/modify").submit();
           	     });

           	    $("button[data-oper='list']").on("click",function(e){
               		operForm.find("#bno").remove();
           	    	operForm.attr("action", "/admin/boardlist?boardid=0");
           		    operForm.submit();
           	     });
          });
  </script>



