<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!-- 게시글상세 -->
<%@include file="/WEB-INF/views/includes/boardlist.jsp"%>
<!-- 게시글상세 -->

<!-- 검색창 시작 -->
<div class="container text-center">
    <div class="row">
        <div class="col-Lg-12">
            <form action="/freeboard/list" id="searchForm">
                <select class="form-select form-select-sm" style="width: 170px; height: 38px; display:inline;"
                    name="type">
                    <option value="${pageMaker.cri.type == null? 'selected':''}">--</option>
                    <option value="T" <c:out value="${pageMaker.cri.type eq 'T'? 'selected':''}" />>제목</option>
                    <option value="C" <c:out value="${pageMaker.cri.type eq 'C'? 'selected':''}" />>내용</option>
                    <option value="W" <c:out value="${pageMaker.cri.type eq 'W'? 'selected':''}" />>작성자</option>
                    <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'? 'selected':''}" />>제목 + 내용</option>
                    <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'? 'selected':''}" />>제목 + 작성자</option>
                    <option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW'? 'selected':''}" />>제목 + 내용 + 작성자
                    </option>
                </select>
                <input class="form-control form-control-sm" style="width: 200px;height: 38px; display:inline;"
                    type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'>
                <input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"/>'>
                <input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount}"/>'>
                <button class="btn btn-outline-primary" style="height: 38px;">검색</button>
            </form>
        </div>
    </div>
</div>
<!-- 검색창 끝 -->


<!-- 페이징 -->
<%@include file="/WEB-INF/views/includes/boardpaging.jsp"%>
<!-- 페이징 -->



<form id="actionForm" action="/freeboard/list" method='get'>
    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
    <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
    <input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type}"/>'>
    <input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'>
    <input type="hidden" name="sort" value='<c:out value="${pageMaker.cri.sort}"/>'>
</form>
</div>
</div>
</div>
</div>
<script type="text/javascript">
    document.title = "자유게시판 - POST 1T";
    $(document).ready(function () {
        $('head').append($('<link rel="stylesheet" type="text/css" />').attr('href',
            '/resources/css/board.css'));

        var result = '<c:out value="${result}"/>';

        CheckModal(result);
        history.replaceState({}, null, null);

        function CheckModal(result) {
            if (result == '' || history.state) {
                return
            }
            if (parseInt(result) > 0) {
                $(".modal-body").html("게시글" + parseInt(result) + "번이 등록 완료되었습니다.")
            }
            $("#myModal").modal("show");
        }
        $("#regBtn").on("click", function () {
            self.location = "/freeboard/register"; //원래 있던 창을 저 창으로 바꾸는거임
        });

        var actionForm = $("#actionForm");
        $(".page-item a").on("click", function (e) {
            e.preventDefault();
            console.log("click.......");
            actionForm.find("input[name='pageNum']").val($(this).attr("href"));
            //pageNum을 찾아서 href를 수정해줘 ~
            actionForm.submit();
        });


        $(".nmove").on("click", function (e) {
                    e.preventDefault();
                    console.log("move~");
                    actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
                    actionForm.attr("action", "/noticeboard/get");
                    actionForm.submit();
                });

        $(".move").on("click", function (e) {
            e.preventDefault();
            console.log("move~");
            actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
            actionForm.attr("action", "/freeboard/get");
            actionForm.submit();
        });

        var searchForm = $("#searchForm");
        $("#searchForm button").on("click", function (e) {
            if (!searchForm.find("option:selected").val()) {
                alert("검색 타입을 입력해주세요");
                return false;
            }

            if (!searchForm.find("input[name='keyword']").val()) {
                alert("검색어를 입력하세요");
                return false;
            }

            searchForm.find("input[name='pageNum']").val("1");
            e.preventDefault();

            searchForm.submit();

        });
    });
</script>
