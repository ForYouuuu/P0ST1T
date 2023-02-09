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
    <div id="body-content">

<div class="container" >
<div class="row px-2">
          <div class="col-1"></div>

        <div class="boardHeader col-10 card py-2"><a href="/reviewboard/list?sort=" style="text-decoration:none;"><h1 style="color: white;">리뷰</h1></a></div></div>
 <div>

 <div class="container mt-5" >
       <div class="row mb-2">
         <div class="col-1"></div>

          <div class="col-lg-6 col-sm-12 text-lg-start text-center" style="padding-left:0px">
          <span style="margin-right:2px;">자격명</span>
              <select id="qid" name="qid" class="custom-select" onchange="self.location.href=(this.value)">
           			<option value="/reviewboard/list?sort=&qid=0" <c:if test="${qid==0}"> selected </c:if>>전체</option>
           			<option value="/reviewboard/list?sort=&qid=1" <c:if test="${qid==1}"> selected </c:if>>정보관리기술사</option>
           			<option value="/reviewboard/list?sort=&qid=2" <c:if test="${qid=='2'}"> selected </c:if>>정보처리기사</option>
            			<option value="/reviewboard/list?sort=&qid=3" <c:if test="${qid=='3'}"> selected </c:if>>정보처리산업기사</option>
            			<option value="/reviewboard/list?sort=&qid=4" <c:if test="${qid=='4'}"> selected </c:if>>정보처리기능사</option>
            			<option value="/reviewboard/list?sort=&qid=5" <c:if test="${qid=='5'}"> selected </c:if>>정보보안기사</option>
            			<option value="/reviewboard/list?sort=&qid=6" <c:if test="${qid=='6'}"> selected </c:if>>정보보안산업기사</option>
            			<option value="/reviewboard/list?sort=&qid=7" <c:if test="${qid=='7'}"> selected </c:if>>컴퓨터시스템응용기술사</option>
            			<option value="/reviewboard/list?sort=&qid=8" <c:if test="${qid=='8'}"> selected </c:if>>전자계산기조직응용기사</option>
            			<option value="/reviewboard/list?sort=&qid=9" <c:if test="${qid=='9'}"> selected </c:if>>빅데이터분석기사</option>
            			<option value="/reviewboard/list?sort=&qid=10" <c:if test="${qid=='10'}"> selected </c:if>>사무자동화산업기사</option>
            			<option value="/reviewboard/list?sort=&qid=11" <c:if test="${qid=='11'}"> selected </c:if>>정보기기운용기능사</option>
            			<option value="/reviewboard/list?sort=&qid=12" <c:if test="${qid=='12'}"> selected </c:if>>정보통신기술사</option>
            			<option value="/reviewboard/list?sort=&qid=13" <c:if test="${qid=='13'}"> selected </c:if>>정보통신기사</option>
            			<option value="/reviewboard/list?sort=&qid=14" <c:if test="${qid=='14'}"> selected </c:if>>정보통신산업기사</option>
            			<option value="/reviewboard/list?sort=&qid=15" <c:if test="${qid=='15'}"> selected </c:if>>전자계산기기사</option>
            			<option value="/reviewboard/list?sort=&qid=16" <c:if test="${qid=='16'}"> selected </c:if>>전자계산기제어산업기사</option>
            			<option value="/reviewboard/list?sort=&qid=17" <c:if test="${qid=='17'}"> selected </c:if>>전자계산기기능사</option>
            			<option value="/reviewboard/list?sort=&qid=18" <c:if test="${qid=='18'}"> selected </c:if>>로봇소프트웨어개발기사</option>
            			<option value="/reviewboard/list?sort=&qid=19" <c:if test="${qid=='19'}"> selected </c:if>>임베디드기사</option>
            			<option value="/reviewboard/list?sort=&qid=20" <c:if test="${qid=='20'}"> selected </c:if>>컴퓨터그래픽스운용기능사</option>
            			<option value="/reviewboard/list?sort=&qid=21" <c:if test="${qid=='21'}"> selected </c:if>>웹디자인기능사</option>
              </select>

          </div>


          <div class="col-lg-4 col-sm-12 text-lg-end text-center" style="padding-right:0px">
             <button class="btn btn-outline-dark float-right justify-content-right "
                onClick="self.location.href='/reviewboard/list?sort=bno&qid=${qid}'">최신순</button>

             <button data-oper="" class="btn btn-outline-dark float-right justify-content-right"
                 onClick="self.location.href='/reviewboard/list?sort=likehit&qid=${qid}'">추천순</button>

             <button  class="btn btn-outline-dark float-right justify-content-right "
                 onClick="self.location.href='/reviewboard/list?sort=replycnt&qid=${qid}'">댓글순</button>

             <button  class="btn btn-outline-dark float-right justify-content-right "
                 onClick="self.location.href='/reviewboard/list?sort=viewcount&qid=${qid}'">조회순</button>
         </div>


    </div>
 </div>



<%@include file="/WEB-INF/views/includes/reviewboardlist.jsp"%>
<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>