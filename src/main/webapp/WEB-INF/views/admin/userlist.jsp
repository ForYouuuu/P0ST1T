<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!DOC TYPE html>
<html lang="ko">
  <head>
    <title> 관리자 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>

  </head>
  <body>


<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">P0ST 1T - ADMIN</a>
  <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <input class="form-control form-control-dark w-100" type="hidden" placeholder="Search" aria-label="Search">
  <div class="navbar-nav">
    <div class="nav-item text-nowrap">
      <a class="nav-link px-3" href="/index">index</a>
    </div>
  </div>
</header>

<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-dark sidebar collapse">
      <div class="position-sticky pt-3">
        <ul class="nav flex-column">
<ul class="list-unstyled ps-0">
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed text-white"  onClick="location.href='/admin/userlist'" >
          회원관리
        </button>
      </li>



      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed text-white" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
          커뮤니티
        </button>
        <div class="collapse" id="orders-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small ">
            <li><a href="/admin/boardlist?boardid=1&categoryid=0&sort=bno" style="text-decoration: none;" class="link-warning rounded text-white">공지사항</a></li>
            <li><a href="/admin/boardlist?boardid=2&categoryid=0&sort=bno" style="text-decoration: none;" class="link-Warning rounded text-white">자유게시판</a></li>
            <li><a href="/admin/boardlist?boardid=3&categoryid=0&sort=bno" style="text-decoration: none;" class="link-Warning rounded text-white">묻고답하기</a></li>
            <li><a href="/admin/boardlist?boardid=4&categoryid=0&sort=bno" style="text-decoration: none;" class="link-Warning rounded text-white">리뷰게시판</a></li>
            <li><a href="/admin/boardlist?boardid=5&categoryid=0&sort=bno" style="text-decoration: none;" class="link-Warning rounded text-white">문의하기</a></li>
          </ul>
        </div>
      </li>
      <li class="border-top my-3"></li>

    </ul>
    </nav>

    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">회원관리</h1>
        <div class="btn-toolbar mb-2 mb-md-0">

        </div>
      </div>



<div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th scope="col"><input id="allCheck" type="checkbox" name="allCheck"></th>
              <th scope="col">아이디</th>
              <th scope="col">이메일</th>
              <th scope="col">이름</th>
              <th scope="col">닉네임</th>
            </tr>
          </thead>

          <tbody>
              <c:forEach items="${user}" var="user">
                  <tr style="font-weight: bold">
                     <td class="text-center"><input name="RowCheck" type="checkbox" value="${user.user_id}"/> </td>
                     <td class="text-center"> <c:out value="${user.user_id }"/> </td>
                     <td class="text-left"> <c:out value="${user.email }"/> </td>
                     <td class="text-left"> <c:out value="${user.name }"/> </td>
                     <td class="text-left"> <c:out value="${user.nickname }"/> </td>
                  </tr>
              </c:forEach>
          </tbody>
        </table>


         <button class="btn btn-outline-info"  onclick="userDelete()">선택삭제</button>
      </div>
    </main>

    <!-- 검색창 시작 -->
      <div class="container text-center"  >
      <div class="row">
        <div class="col-Lg-12">
        <form action="/admin/userlist" id="searchForm">
          <select name ="type">
            <option value="${pageMaker.cri.type == null? 'selected':''}">--</option>
            <option value="I" <c:out value="${pageMaker.cri.type eq 'I'? 'selected':''}"/>>아이디</option>
            <option value="E" <c:out value="${pageMaker.cri.type eq 'E'? 'selected':''}"/>>이메일</option>
            <option value="N" <c:out value="${pageMaker.cri.type eq 'N'? 'selected':''}"/>>이름</option>
            <option value="K" <c:out value="${pageMaker.cri.type eq 'K'? 'selected':''}"/>>닉네임</option>
          </select>
          <input type= "text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'>
          <input type= "hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"/>'>
          <input type= "hidden" name="amount" value='<c:out value="${pageMaker.cri.amount}"/>'>
          <button class="btn btn-default">검색</button>
        </form>
        </div>
      </div>
    </div>
    <!-- 검색창 끝 -->


    <!-- 페이징 -->
    <%@include file="/WEB-INF/views/includes/boardpaging.jsp"%>
    <!-- 페이징 -->



        <form id="actionForm" action="/admin/userlist" method='get'>
            <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
            <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
            <input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type}"/>'>
            <input type="hidden" name= "keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'>
        </form>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>






  </div>
</div>


<script src="/docs/5.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script><script src="dashboard.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

</body>
</html>
<script type="text/javascript">
			$(document).ready(function(){

			 var actionForm = $("#actionForm");
			 	$(".page-item a").on("click" ,function(e){
			 			e.preventDefault();
			 			console.log("click.......");
			 			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			 			//pageNum을 찾아서 href를 수정해줘 ~
			 			actionForm.submit();
			 	});


			 	var searchForm = $("#searchForm");
			 	$("#searchForm button").on("click",function(e){
			 		if(!searchForm.find("option:selected").val()){
			 			alert("검색 타입을 입력해주세요");
			 			return false;
			 		}

			 		if(!searchForm.find("input[name='keyword']").val()){
			 			alert("검색어를 입력하세요");
			 			return false;
			 		}

			 		searchForm.find("input[name='pageNum']").val("1");
			 		e.preventDefault();

			 		searchForm.submit();

			 	});
			});

         </script>

<script type="text/javascript">
        $(function(){
                var chkObj = document.getElementsByName("RowCheck");
                var rowCnt = chkObj.length;

            $("input[name='allCheck']").click(function(){
                var chk_listArr= $("input[name='RowCheck']");
                for (var i=0; i<chk_listArr.length; i++){
                    chk_listArr[i].checked = this.checked;
             }
         });

         $("input[name='RowCheck'}").click(function(){
            if($("input[name='RowCheck']:checked").length == rowCnt){
                $("input[name='allCheck']")[0].checked = true;
            }
            else{
                $("input[name='allCheck']")[0].checked = false;
                }
            });
        });

        function userDelete(){
            var url = "/admin/userDelete";
            var valueArr = new Array();
            var list = $("input[name='RowCheck']");
            for(var i = 0; i < list.length; i++) {
                if(list[i].checked){
                    valueArr.push(list[i].value);
            }
        }
        if (valueArr.length == 0){
            alert("선택된 회원이 없습니다.");
        }
        else{
            var chk = confirm("정말 삭제하시겠습니까?");
            $.ajax({
                url : url,
                type : 'POST',
                traditional : true,
                data : {
                    valueArr : valueArr // 보내고자 하는 데이터
                },
                success : function(jdata){
                    if(jdata = 1){
                        alert("삭제성공");
                        location.replace("userlist")
                    }
                    else{
                        alert("삭제 실패");
                    }
                }
        });

    }
}
</script>
