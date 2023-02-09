<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<sec:authorize access="isAnonymous()">
<jsp:include page="/WEB-INF/views/header.jsp" />
</sec:authorize>
<sec:authorize access="isAuthenticated()">
<jsp:include page="/WEB-INF/views/loginHeader.jsp" />
</sec:authorize>


<div class="container contentWrap">

    <div class="clistcontent">
        <div class="row mb-4">
            <div class="col-lg-12">
                <h1 class="page-header">자격증 검색</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>

        <div>
            <div class="d-flex justify-content-between mb-1">
                <div class="d-flex align-items-center">직무 분야
                    <button class="tag" name="area" value="정보기술">정보기술</button>
                    <button class="tag" name="area" value="통신">통신</button>
                    <button class="tag" name="area" value="전자">전자</button>
                    <button class="tag" name="area" value="디자인">디자인</button>
                </div>
                <div style="display: flex;">
                    <input class="search-box" type="text">
                    <button class="btn btn-success button" type="button">검색</button>
                </div>
            </div>
            <div class="d-flex align-items-center mb-2">자격 등급
                <button class="tag" name="grade" value="기술사">기술사</button>
                <button class="tag" name="grade" value="기사">기사</button>
                <button class="tag" name="grade" value="산업기사">산업기사</button>
                <button class="tag" name="grade" value="기능사">기능사</button>
            </div>
        </div>


        <ul class="list mb-5">
                    <c:forEach items="${list}" var="cert">
                        <li class="shadow list-item">
                            <div class="list-item-box">
                                <div class="list-content d-flex flex-column">
                                    <div class="d-flex mb-2">
                                        <div class="area">
                                            <c:out value="${cert.area}" />
                                        </div>
                                        <div class="qname align-items-center">
                                            <a class="move" href='details/<c:out value="${cert.id}" />'>
                                                <h3>
                                                    <c:out value="${cert.qname}" />
                                                </h3>
                                            </a>
                                        </div>
                                    </div>
                                    <c:choose>
                                    <c:when test="${cert.grade == '기술사'}">
                                        <c:set var="pilgiapply" value="${professional[0].pilgiapply}" />
                                        <c:set var="pilgidate" value="${professional[0].pilgidate}" />
                                        <c:set var="silgiapply" value="${professional[0].silgiapply}" />
                                        <c:set var="silgidate" value="${professional[0].silgidate}" />
                                    </c:when>
                                    <c:when test="${cert.grade == '기사'}">
                                        <c:set var="pilgiapply" value="${engineer[2].pilgiapply}" />
                                        <c:set var="pilgidate" value="${engineer[2].pilgidate}" />
                                        <c:set var="silgiapply" value="${engineer[1].silgiapply}" />
                                        <c:set var="silgidate" value="${engineer[1].silgidate}" />
                                    </c:when>
                                    <c:when test="${cert.grade == '산업기사'}">
                                        <c:set var="pilgiapply" value="${industrial[2].pilgiapply}" />
                                        <c:set var="pilgidate" value="${industrial[2].pilgidate}" />
                                        <c:set var="silgiapply" value="${industrial[1].silgiapply}" />
                                        <c:set var="silgidate" value="${industrial[1].silgidate}" />
                                    </c:when>
                                    <c:when test="${cert.grade == '기능사'}">
                                        <c:set var="pilgiapply" value="${craftsman[1].pilgiapply}" />
                                        <c:set var="pilgidate" value="${craftsman[1].pilgidate}" />
                                        <c:set var="silgiapply" value="${craftsman[1].silgiapply}" />
                                        <c:set var="silgidate" value="${craftsman[1].silgidate}" />
                                    </c:when>
                                    </c:choose>
                                    <div class="d-flex flex-row justify-content-end">
                                        <span class="date">필기접수 ${pilgiapply}</span>
                                        <span class="date">필기시험 ${pilgidate}</span>
                                    </div>
                                    <div class="d-flex flex-row justify-content-end">
                                        <span class="date">실기접수 ${silgiapply}</span>
                                        <span class="date">실기시험 ${silgidate}</span>
                                    </div>
                                </div>
                                <div class="organizer">
                                    <c:out value="${cert.organizer}" />
                                </div>
                            </div>
                        </li>
                    </c:forEach>

                </ul>
    </div>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp" />



<script type="text/javascript">
    document.title = "자격증 정보 - POST 1T";
    $(document).ready(function () {
    $('head').append($('<link rel="stylesheet" type="text/css" />').attr('href', '/resources/css/certinfo.css'));

        $(".search-box").on("keydown", function (e) {
            if (e.keyCode == 13) {
                console.log($(".button"));
                $(".button").trigger("click");
            }
        });
        $(".button").on("click", function () {
            var search = $(".search-box").val();
            console.log(search);
            $.ajax({
                type: "get",
                url: "/certinfo/searchList",
                data: {
                    search: search
                },
                success: function (res) {
                    $(".list").empty();
                    console.log(res);
                    res.forEach(function (item) {
                        if(item.grade == '기술사'){
                            var pilgiapply = "${professional[0].pilgiapply}";
                            var pilgidate = "${professional[0].pilgidate}";
                            var silgiapply = "${professional[0].silgiapply}";
                            var silgidate = "${professional[0].silgidate}";
                        } else if(item.grade == '기사'){
                            var pilgiapply = "${engineer[2].pilgiapply}";
                            var pilgidate = "${engineer[2].pilgidate}";
                            var silgiapply = "${engineer[1].silgiapply}";
                            var silgidate = "${engineer[1].silgidate}";
                        } else if(item.grade == '산업기사'){
                            var pilgiapply = "${industrial[2].pilgiapply}";
                            var pilgidate = "${industrial[2].pilgidate}";
                            var silgiapply = "${industrial[1].silgiapply}";
                            var silgidate = "${industrial[1].silgidate}";
                        } else if(item.grade == '기능사'){
                            var pilgiapply = "${craftsman[1].pilgiapply}";
                            var pilgidate = "${craftsman[1].pilgidate}";
                            var silgiapply = "${craftsman[1].silgiapply}";
                            var silgidate = "${craftsman[1].silgidate}";
                        }

                        console.log(item);
                        str = '<li class="shadow list-item">';
                        str += '<div class="list-item-box">';
                        str += '<div class="list-content d-flex flex-column">';
                        str += '<div class="d-flex mb-2">';
                        str += '<div class="area">'+item.area+'</div>';
                        str += '<div class="qname align-items-center">';
                        str += '<a class="move" href="details/' +item.id+ '">';
                        str += '<h3>' +item.qname+ '</h3></a></div></div>';
                        str += '<div class="d-flex flex-row justify-content-end">';
                        str += '<span class="date">필기접수 '+pilgiapply+'</span>';
                        str += '<span class="date">필기시험 '+pilgidate+'</span></div>';
                        str += '<div class="d-flex flex-row justify-content-end">';
                        str += '<span class="date">실기접수 '+silgiapply+'</span>';
                        str += '<span class="date">실기시험 '+silgidate+'</span></div></div>';
                        str += '<div class="organizer">'+item.organizer+'</div></div></li>';
                        $(".list").append(str);
                    });

                },
                error: function () {
                    alert("에러입니다");
                }
            });
        });

        $(".tag").on("click", function () {
            console.log($(this));
            if ($(this).hasClass("active")) {
                $(this).removeClass("active");
            } else {
                $(this).addClass("active");
            }
            var areaList = new Array();
            var gradeList = new Array();
            $.each($(".tag").get(), function (index, item) {
                if ($(item).hasClass("active") && $(item).attr("name") == "area") {
                    console.log($(item).val());
                    areaList.push($(item).val());
                } else if ($(item).hasClass("active") && $(item).attr("name") == "grade") {
                    gradeList.push($(item).val());
                }

            });
            console.log(areaList);
            console.log(gradeList);
            $.ajax({
                type: "get",
                url: "/certinfo/tagList",
                data: {
                    areaList: areaList,
                    gradeList: gradeList
                },
                success: function (res) {
                    $(".list").empty();
                    console.log(res);
                    res.forEach(function (item) {
                        if(item.grade == '기술사'){
                            var pilgiapply = "${professional[0].pilgiapply}";
                            var pilgidate = "${professional[0].pilgidate}";
                            var silgiapply = "${professional[0].silgiapply}";
                            var silgidate = "${professional[0].silgidate}";
                        } else if(item.grade == '기사'){
                            var pilgiapply = "${engineer[2].pilgiapply}";
                            var pilgidate = "${engineer[2].pilgidate}";
                            var silgiapply = "${engineer[1].silgiapply}";
                            var silgidate = "${engineer[1].silgidate}";
                        } else if(item.grade == '산업기사'){
                            var pilgiapply = "${industrial[2].pilgiapply}";
                            var pilgidate = "${industrial[2].pilgidate}";
                            var silgiapply = "${industrial[1].silgiapply}";
                            var silgidate = "${industrial[1].silgidate}";
                        } else if(item.grade == '기능사'){
                            var pilgiapply = "${craftsman[1].pilgiapply}";
                            var pilgidate = "${craftsman[1].pilgidate}";
                            var silgiapply = "${craftsman[1].silgiapply}";
                            var silgidate = "${craftsman[1].silgidate}";
                        }

                        console.log(item);
                        str = '<li class="shadow list-item">';
                        str += '<div class="list-item-box">';
                        str += '<div class="list-content d-flex flex-column">';
                        str += '<div class="d-flex mb-2">';
                        str += '<div class="area">'+item.area+'</div>';
                        str += '<div class="qname align-items-center">';
                        str += '<a class="move" href="details/' +item.id+ '">';
                        str += '<h3>' +item.qname+ '</h3></a></div></div>';
                        str += '<div class="d-flex flex-row justify-content-end">';
                        str += '<span class="date">필기접수 '+pilgiapply+'</span>';
                        str += '<span class="date">필기시험 '+pilgidate+'</span></div>';
                        str += '<div class="d-flex flex-row justify-content-end">';
                        str += '<span class="date">실기접수 '+silgiapply+'</span>';
                        str += '<span class="date">실기시험 '+silgidate+'</span></div></div>';
                        str += '<div class="organizer">'+item.organizer+'</div></div></li>';
                        $(".list").append(str);

                    });

                },
                error: function () {
                    alert("에러입니다");
                }
            });
        });
        switch ("${tag}") {
            case "it":
                $("button[value=정보기술]").trigger("click");
                break;
            case "communication":
                $("button[value=통신]").trigger("click");
                break;
            case "electron":
                $("button[value=전자]").trigger("click");
                break;
            case "design":
                $("button[value=디자인]").trigger("click");
                break;
            case "professional":
                $("button[value=기술사]").trigger("click");
                break;
            case "engineer":
                $("button[value=기사]").trigger("click");
                break;
            case "industrial":
                $("button[value=산업기사]").trigger("click");
                break;
            case "craftsman":
                $("button[value=기능사]").trigger("click");
                break;
            }
    });
</script>
</body>
</html>