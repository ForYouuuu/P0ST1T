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
       <div class="container pt-7 pb-2" style="text-align: center;">
         <div style="width: 100%; display: inline-block">
           <div class="landingpage-title mt-2" id="top-box">
             <b style="font-size: 3.4ch;">인증된 </b>
             <b style="color: dodgerblue; font-size: 5.5ch;">자격증</b>
             <b style="font-size: 3.4ch;"> 리뷰</b>

           </div>
         </div>
       </div>

       <div class="container text-cener">
         <div class="d-flex justify-content-center align-items-center mt-4 mb-4">
           <div class="landingpage-count row pl-4 pr-4 py-1" style="width:600px;color:#494949;text-align:center;">
             <div class="col-3 p-0"> 작성된 리뷰</div>
             <div class="col-3 p-0 text-right">
               <strong class="counter reviewcount" style="color:black;" data-count="111111">19</strong>개
             </div>
             <div class="col-3 p-0 text-right">
               회원 수
             </div>
             <div class="col-3 p-0 text-right">
               <strong class="counter userCnt" style="color:black;" data-count="">11</strong>명
             </div>
           </div>
         </div>
       </div>



       <div class="mt-5 mb-5">
         <div class="row g-1">
           <div class="col-2 searchicon">
             <a href="/certinfo/list"><img src="/resources/images/wjscp.png" alt="전체" style="width: 100%;"></a>
           </div>
           <div class="col-2 searchicon">
             <a href="/certinfo/list?tag=it"><img src="/resources/images/wjdqhrltnf.png" alt="정보기술" style="width: 100%;"></a>
           </div>
           <div class="col-2 searchicon">
             <a href="/certinfo/list?tag=communication"><img src="/resources/images/xhdtls.png" alt="통신" style="width: 100%;"></a>
           </div>
           <div class="col-2 searchicon">
             <a href="/certinfo/list?tag=electron"><img src="/resources/images/wjswk.png" alt="전자" style="width: 100%;"></a>
           </div>
           <div class="col-2 searchicon">
             <a href="/certinfo/list?tag=design"><img src="/resources/images/elwkdls.png" alt="디자인" style="width: 100%;"></a>
           </div>
           <div class="col-2 searchicon">
             <a href="/certinfo/list?tag=professional"><img src="/resources/images/rltnftk.png" alt="기술사" style="width: 100%;"></a>
           </div>
         </div>
         <div class="row g-1 mt-1">

           <div class="col-2 searchicon">
             <a href="/certinfo/list?tag=engineer"><img src="/resources/images/rltk.png" alt="기사" style="width: 100%;"></a>
           </div>
           <div class="col-2 searchicon">
             <a href="/certinfo/list?tag=industrial"><img src="/resources/images/tksdjqrltk.png" alt="산업기사" style="width: 100%;"></a>
           </div>
           <div class="col-2 searchicon">
             <a href="/certinfo/list?tag=craftsman"><img src="/resources/images/rlsmdtk.png" alt="기능사" style="width: 100%;"></a>
           </div>
           <div class="col-2">
             <a href="#"><img src="/resources/images/etcimg.png" alt="etc" style="width: 100%;"></a>
           </div>
           <div class="col-2">
             <a href="#"><img src="/resources/images/etcimg.png" alt="etc" style="width: 100%;"></a>
           </div>
           <div class="col-2">
             <a href="#"><img src="/resources/images/etcimg.png" alt="etc" style="width: 100%;"></a>
           </div>
         </div>
       </div>
     </div>
     </div>
     </div>
     <input type="hidden" name="tag">
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
<script type="text/javascript">

  var memberCountConTxt= "${boardCnt}";
  var userCnt= "${userCnt}";

  $({ val : 0 }).animate({ val : memberCountConTxt, val2 : userCnt }, {
   duration: 2000,
  step: function() {
    var num = numberWithCommas(Math.floor(this.val));
    var num2 = numberWithCommas(Math.floor(this.val2));

    $(".reviewcount").text(num);
    $(".userCnt").text(num2);
  },
  complete: function() {
    var num = numberWithCommas(Math.floor(this.val));
    var num2 = numberWithCommas(Math.floor(this.val2));
    $(".reviewcount").text(num);
    $(".userCnt").text(num2);
  }
});

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

</script>
</body>
</html>
