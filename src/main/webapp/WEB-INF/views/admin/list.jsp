<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 <div class="container mt-5" >
    <div class="row">

        <div class="col-1"> </div>

<div class="col-10 cardtable-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th scope="col"><input id="allCheck" type="checkbox" name="allCheck"></th>
              <th scope="col">번호</th>
              <th scope="col">제목</th>
              <th scope="col">작성자</th>
              <th scope="col">작성일</th>
              <th scope="col">조회수</th>
              <th scope="col">추천수</th>
            </tr>
          </thead>

          <tbody>
            <c:forEach items="${list}" var="list">
                <tr style="font-weight: bold">
                    <td class="text-center"><input name="RowCheck" type="checkbox" value="${list.bno}"/> </td>
                    <td class="text-center"> <c:out value="${list.bno }"/> </td>
                    <td class="text-left">
                    <a class='move' href='<c:out value="${list.bno}"/>'>
                     [<c:out value ="${list.boardname}"/>]
                        <c:out value="${list.title}"/>
                         [<c:out value ="${list.replycnt}"/>]
                      </a>
                    </td>
                    <td class="text-center"> <c:out value="${list.writer }"/> </td>
                    <td  class="text-center"> <fmt:formatDate pattern="yyyy-MM-dd" value="${list.writedate }"/></td>
                    <td style="width: 10%" class="text-center">${list.viewcount}</td>
                    <td style="width: 10%" class="text-center">${list.likehit}</td>
                </tr>
            </c:forEach>
          </tbody>
        </table>


         <button class="btn btn-outline-info"  onclick="deleteValue()">선택삭제</button>

      </div>
   </div>

   </div>


 <!-- 검색창 시작 -->
  <div class="container text-center"  >
  <div class="row">
    <div class="col-Lg-12">
    <form action="/admin/boardlist" id="searchForm">
      <select name ="type">
        <option value="${pageMaker.cri.type == null? 'selected':''}">--</option>
        <option value="N" <c:out value="${pageMaker.cri.type eq 'N'? 'selected':''}"/>>번호</option>
        <option value="T" <c:out value="${pageMaker.cri.type eq 'T'? 'selected':''}"/>>제목</option>
        <option value="C" <c:out value="${pageMaker.cri.type eq 'C'? 'selected':''}"/>>내용</option>
        <option value="W" <c:out value="${pageMaker.cri.type eq 'W'? 'selected':''}"/>>작성자</option>
        <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'? 'selected':''}"/>>제목 + 내용</option>
        <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'? 'selected':''}"/>>제목 + 작성자</option>
        <option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW'? 'selected':''}"/>>제목 + 내용 + 작성자</option>
      </select>
      <input type= "text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'>
      <input type= "hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"/>'>
      <input type= "hidden" name="amount" value='<c:out value="${pageMaker.cri.amount}"/>'>
      <input type= "hidden" name="boardid" value='<c:out value="${pageMaker.cri.boardid}"/>'>
      <input type= "hidden" name="categoryid" value='<c:out value="${pageMaker.cri.categoryid}"/>'>
      <input type= "hidden" name="sort" value='<c:out value="${pageMaker.cri.sort }"/>'>
      <button class="btn btn-default">검색</button>
    </form>
    </div>
  </div>
</div>


<!-- 검색창 끝 -->


<!-- 페이징 -->
<%@include file="/WEB-INF/views/includes/boardpaging.jsp"%>
<!-- 페이징 -->



    <form id="actionForm" action="/admin/boardlist" method='get'>
        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
        <input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type}"/>'>
        <input type="hidden" name= "keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'>
         <input type="hidden" name= "sort" value='<c:out value="${pageMaker.cri.sort}"/>'>
         <input type="hidden" name= "boardid" value='<c:out value="${pageMaker.cri.boardid}"/>'>
         <input type="hidden" name= "categoryid" value='<c:out value="${pageMaker.cri.categoryid}"/>'>
    </form>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

</body>
</html>
<script type="text/javascript">
			$(document).ready(function(){
				var result = '<c:out value="${result}"/>';

            CheckModal(result);
            history.replaceState({},null,null);

            function CheckModal(result){
                if(result=='' || history.state){
                 return
                }
                if(parseInt(result)>0){
                $(".modal-body").html("게시글" +parseInt(result) + "번이 등록 완료되었습니다.")
                }
                $("#myModal").modal("show");
            }


			 var actionForm = $("#actionForm");
			 	$(".page-item a").on("click" ,function(e){
			 			e.preventDefault();
			 			console.log("click.......");
			 			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			 			//pageNum을 찾아서 href를 수정해줘 ~
			 			actionForm.submit();
			 	});


			 	$(".move").on("click",function(e){
			 			e.preventDefault();
			 			console.log("move~");
			 			actionForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+"'>");
			 			actionForm.attr("action","/admin/get");
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

        function deleteValue(){
            var url = "/admin/delete";
            var valueArr = new Array();
            var list = $("input[name='RowCheck']");
            for(var i = 0; i < list.length; i++) {
                if(list[i].checked){
                    valueArr.push(list[i].value);
            }
        }
        if (valueArr.length == 0){
            alert("선택된 글이 없습니다.");
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
                        location.replace("boardlist?boardid=1")
                    }
                    else{
                        alert("삭제 실패");
                    }
                }
        });

    }
}
</script>

