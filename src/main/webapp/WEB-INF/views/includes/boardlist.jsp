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
                        <th scope="col" class="text-center">제목</th>
                        <th scope="col" class="text-center">작성자</th>
                        <th scope="col" class="text-center">작성일</th>
                        <th scope="col" class="text-center">조회수</th>
                        <th scope="col" class="text-center">추천수</th>

                    </tr>
                </thead>
                <tbody>

                    <c:forEach items="${notice}" var="notice">
                        <tr style="font-weight: bold">
                            <td style="width: 8%" class="text-center">
                                <c:out value="${notice.bno }" />
                            </td>
                            <td style="width: 50%" class="text-left">
                                <a class='nmove' href='<c:out value="${notice.bno}"/>'>
                                    <c:out value="${notice.title}" />
                                    [<c:out value="${notice.replycnt}" />]
                                </a>
                            </td>
                            <td style="width: 16%" class="text-center">
                                <c:out value="${notice.writer }" />
                            </td>
                            <td style="width: 10%" class="text-center">
                                <fmt:formatDate pattern="yyyy-MM-dd" value="${notice.updatedate }" />
                            </td>
                            <td style="width: 8%" class="text-center"> ${notice.viewcount}</td>
                            <td style="width: 8%" class="text-center">${notice.likehit}</td>
                        </tr>
                    </c:forEach>

                    <c:forEach var="item" items="${list }">
                        <tr>
                            <td style="width: 8%" class="text-center">
                                <c:out value="${item.bno }" />
                            </td>
                            <c:if test="${item.secret == true}">
                                <c:choose>
                                    <c:when test="${fn:contains(user.roles, 'ROLE_ADMIN')}">
                                        <td style="width: 50%" class="text-left">
                                            <a class='move' href='<c:out value="${item.bno}"/>'>
                                                🔑<c:out value="${item.title}" />
                                                [<c:out value="${item.replycnt}" />]
                                            </a>
                                        </td>
                                    </c:when>
                                    <c:otherwise>
                                        <c:choose>
                                            <c:when test="${item.writerid eq user.userId}">
                                                <td style="width: 50%" class="text-left">
                                                    <a class='move' href='<c:out value="${item.bno}"/>'>
                                                        🔑<c:out value="${item.title}" />
                                                        [<c:out value="${item.replycnt}" />]
                                                    </a>
                                                </td>
                                            </c:when>

                                            <c:otherwise>
                                                <td style="width: 50%" class="text-left">
                                                    <i>🔒</i>
                                                    <c:out value="비밀글 입니다." />
                                                </td>
                                            </c:otherwise>
                                        </c:choose>

                                    </c:otherwise>
                                </c:choose>
                            </c:if>
                            <c:if test="${item.secret == false}">
                                <td style="width: 50%" class="text-left">
                                    <a class='move' href='<c:out value="${item.bno}"/>'>
                                        <c:if test="${item.boardid == 3}">
                                            <span
                                                style='color:white;border: 1px solid gray;background-color:#198754;border-radius:4px;padding:0 3px;'>
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
                            </c:if>
                            <td style="width: 16%" class="text-center">
                                <c:out value="${item.writer }" />
                            </td>
                            <td style="width: 10%" class="text-center">
                                <fmt:formatDate pattern="yyyy-MM-dd" value="${item.updatedate }" />
                            </td>
                            <td style="width: 8%" class="text-center">${item.viewcount}</td>
                            <td style="width: 8%" class="text-center">${item.likehit}</td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="container">
    <div class="row mt-2">
        <div class="col-lg-1 col-sm-12 text-lg-start text-center">
        </div>

        <c:choose>
            <c:when test="${isNotice}">
                <c:if test="${fn:contains(user.roles, 'ROLE_ADMIN')}">
                    <div class="col-lg-10 col-sm-12 text-lg-end text-center" style="padding-right:0;">
                        <button id="regBtn" type="button" class="btn btn-primary">글쓰기</button>
                    </div>
                </c:if>
            </c:when>
            <c:otherwise>
                <div class="col-lg-10 col-sm-12 text-lg-end text-center" style="padding-right:0;">
                    <button id="regBtn" type="button" class="btn btn-primary">글쓰기</button>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>