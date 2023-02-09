<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAnonymous()">
    <jsp:include page="/WEB-INF/views/header.jsp" />
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    <jsp:include page="/WEB-INF/views/loginHeader.jsp" />
</sec:authorize>
<div id="body-wrapper">
    <div id="body-content" style="margin-bottom:50px;">

        <div class="container">
            <div class="row mb-2">
                <div class="col-2"></div>

                <div class="boardHeader col-8 card py-2">
                    <h1 style="color: white;">자유게시판 등록</h1>
                </div>
            </div>

            <div class="row">
                <div class="col-2"> </div>


                <div class="col-8 card ">
                    <form role="form" action="/freeboard/register" method="post">

                        <div class="form-group">
                            <label for="title">제목</label>
                            <input id="title" class="form-control" maxlength="30" name="title" placeholder="제목은 3글자 이상 입력해주세요." value="${freeBoardVO.title}">
                            <span> ${valid_title }</span>
                        </div>

                        <div class="form-group">
                            <label for="content">내용</label>
                            <textarea id="content" class="form-control" rows="3" maxlength="2000" placeholder="내용은 10글자 이상 입력해주세요." name="content">${freeBoardVO.content}</textarea>
                            <span>${valid_content }</span>
                        </div>

                        <div class="form-group">
                            <label for="writer">작성자</label>
                            <input class="form-control" placeholder="Enter text" id="writer" name="writer"
                                value="${freeBoardVO.writer}" readonly>
                        </div>

                        <div class="container mt-2 mb-4">
                            <div class="row">
                                <div class="col-lg-6 col-sm-12 text-lg-start text-center "> </div>
                                <div class="col-lg-6 col-sm-12 text-lg-end text-center ">
                                    <button type="submit" class="btn btn-primary justify-content-right ">등록</button>
                                    <button type="button" class="btn btn-warning"
                                        onClick="history.go(-1);return false;">취소</button>
                                </div>
                            </div>
                        </div>
                    </form>


                </div>
            </div>
        </div>
    </div>

</div>
<%@include file="/WEB-INF/views/footer.jsp"%>
<script>
    document.title = "자유게시판 등록 - POST 1T";
    $(document).ready(function () {
        $('head').append($('<link rel="stylesheet" type="text/css" />').attr('href',
            '/resources/css/board.css'));
        $("#writer").val("${user.nickname}");
    });
</script>
</body>

</html>
