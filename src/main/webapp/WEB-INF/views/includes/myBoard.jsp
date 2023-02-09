<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="container">
    <div class="row">
        <div class="col-1"> </div>

        <div class="col-10 card ">
            <table class="table table-hover" style=" margin-bottom: 32px;">
                <thead>
                    <tr>
                        <th scope="col" class="text-center">번호</th>
                        <th scope="col" class="text-center">게시판</th>
                        <th scope="col" class="text-center">제목</th>
                        <th scope="col" class="text-center">작성일</th>
                        <th scope="col" class="text-center">조회수</th>
                        <th scope="col" class="text-center">추천수</th>

                    </tr>
                </thead>
                <tbody>

                    <c:forEach var="item" items="${blist }">
                        <tr>
                            <td style="width: 8%" class="text-center">
                                <c:out value="${item.bno }" />
                            </td>
                            <td style="width: 14%" class="text-center">
                                <c:out value="${item.boardname }" />
                            </td>

                            <td style="width: 44%" class="text-left">
                                <a class='move' href=<c:if test="${item.boardid == 1}">'/noticeboard/get?bno=<c:out value="${item.bno}" />'</c:if>
                                    <c:if test="${item.boardid == 2}">'/freeboard/get?bno=<c:out value="${item.bno}" />'</c:if>
                                    <c:if test="${item.boardid == 3}">'/qnaboard/get?bno=<c:out value="${item.bno}" />'</c:if>
                                    <c:if test="${item.boardid == 4}">'/reviewboard/get?bno=<c:out value="${item.bno}" />'</c:if>
                                    <c:if test="${item.boardid == 5}">'/inquireboard/get?bno=<c:out value="${item.bno}" />'</c:if>>
                                    <c:if test="${item.boardid == 3}">
                                        <span style='color:white;border: 1px solid gray;background-color:#198754;border-radius:4px;padding:0 3px;'>
                                        <c:out value="${item.qname}" /></span>
                                    </c:if>
                                    <c:if test="${item.boardid == 4}">
                                        <span
                                            style='color:white;border: 1px solid gray;background-color:#198754;border-radius:4px;padding:0 3px;'>
                                            <c:out value="${item.qname}" /></span>
                                    </c:if>
                                    <c:out value="${item.title}" />
                                    [<c:out value="${item.replycnt}" />]
                                </a>
                            </td>
                            <td style="width: 14%" class="text-center">
                                <fmt:formatDate pattern="yyyy-MM-dd" value="${item.writedate }" />
                            </td>
                            <td style="width: 10%" class="text-center">${item.viewcount}</td>
                            <td style="width: 10%" class="text-center">${item.likehit}</td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
</div>
