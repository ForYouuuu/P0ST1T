<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<sec:authorize access="isAnonymous()">
<jsp:include page="/WEB-INF/views/header.jsp" />
</sec:authorize>
<sec:authorize access="isAuthenticated()">
<jsp:include page="/WEB-INF/views/loginHeader.jsp" />
</sec:authorize>
<div id="body-wrapper">
    <div id="body-content">


<div class="container" >
    <div class="row px-2">
      <div class="col-1"></div>

    <div class="boardHeader col-10 card py-2">
    <a href="/noticeboard/list?sort=" style="text-decoration:none;"><h1 style="color: white;">공지사항</h1></a></div></div>

 <div>


 <div class="container mt-5" >
       <div class="row mb-2">
         <div class="col-1"></div>

          <div class="col-lg-6 col-sm-12 text-lg-start text-center" style="padding-left:0;">
             <button class="btn btn-outline-dark "
               onClick="self.location.href='/noticeboard/list?sort='">전체보기</button>

            <button data-oper="" class="btn btn-outline-dark "
                onClick="self.location.href='/noticeboard/list?sort=&categoryid=1'">전체공지</button>

            <button  class="btn btn-outline-dark "
                onClick="self.location.href='/noticeboard/list?sort=&categoryid=2'">자유게시판</button>

            <button  class="btn btn-outline-dark"
                onClick="self.location.href='/noticeboard/list?sort=&categoryid=3'">묻고답하기</button>

            <button  class="btn btn-outline-dark "
                onClick="self.location.href='/noticeboard/list?sort=&categoryid=4'">리뷰</button>

            <button  class="btn btn-outline-dark "
                onClick="self.location.href='/noticeboard/list?sort=&categoryid=5'">문의하기</button>
          </div>


          <div class="col-lg-4 col-sm-12 text-lg-end text-center" style="padding-right:0;">
             <button class="btn btn-outline-dark float-right justify-content-right "
                onClick="self.location.href='/noticeboard/list?sort=bno'">최신순</button>

             <button data-oper="" class="btn btn-outline-dark float-right justify-content-right"
                 onClick="self.location.href='/noticeboard/list?sort=likehit'">추천순</button>

             <button  class="btn btn-outline-dark float-right justify-content-right "
                 onClick="self.location.href='/noticeboard/list?sort=replycnt'">댓글순</button>

             <button  class="btn btn-outline-dark float-right justify-content-right "
                 onClick="self.location.href='/noticeboard/list?sort=viewcount'">조회순</button>
         </div>


    </div>
 </div>




<%@include file="/WEB-INF/views/includes/noticeboardlist.jsp"%>
<%@include file="/WEB-INF/views/footer.jsp"%>
  </body>
  </html>