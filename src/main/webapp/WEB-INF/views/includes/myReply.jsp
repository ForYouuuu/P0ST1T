<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="container" >
    <div class="row">
      <div class="col-1"> </div>

      <div class="col-10 card ">
      <table class="table table-hover" style=" margin-bottom: 32px;width:794px;table-layout:fixed;">
        <colgroup>
            <col style="width: 7%"/>
            <col style="width: 13%"/>
            <col style="width: 33%"/>
            <col style="width: 33%"/>
            <col style="width: 14%"/>
        </colgroup>
        <thead>
        <tr>
          <th scope="col" class="text-center">번호</th>
          <th scope="col" class="text-center">게시판</th>
          <th scope="col" class="text-center">댓글</th>
          <th scope="col" class="text-center">원글</th>
          <th scope="col" class="text-center">작성일</th>

        </tr>
        </thead>
        <tbody>

        <c:forEach var="item" items="${rlist }">
          <tr>
             <td class="text-center"> <c:out value="${item.bno }"/> </td>
             <td class="text-center"> <c:out value="${item.boardname }"/> </td>
             <td style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" class="text-center"> <c:out value="${item.reply }"/> </td>

                                   <td style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" class="text-left">
                                      <a class='move' href=
                                      <c:if test="${item.boardid == 1}">'/noticeboard/get?bno=<c:out value="${item.bno}"/>'</c:if>
                                      <c:if test="${item.boardid == 2}">'/freeboard/get?bno=<c:out value="${item.bno}"/>'</c:if>
                                      <c:if test="${item.boardid == 3}">'/qnaboard/get?bno=<c:out value="${item.bno}"/>'</c:if>
                                      <c:if test="${item.boardid == 4}">'/reviewboard/get?bno=<c:out value="${item.bno}"/>'</c:if>
                                      <c:if test="${item.boardid == 5}">'/inquireboard/get?bno=<c:out value="${item.bno}"/>'</c:if>

                                      >
                                        <c:if test="${item.boardid == 3}">
                                        <span style='color:white;border: 1px solid gray;background-color:#198754;border-radius:4px;padding:0 3px;'><c:out value ="${item.qname}"/></span>
                                        </c:if>
                                        <c:if test="${item.boardid == 4}">
                                        <span style='color:white;border: 1px solid gray;background-color:#198754;border-radius:4px;padding:0 3px;'><c:out value ="${item.qname}"/></span>
                                        </c:if>
                                        <c:out value="${item.title}"/>
                                      </a>
                                   </td>
                                    <td class="text-center"> <fmt:formatDate pattern="yyyy-MM-dd" value="${item.replydate }"/></td>

                                 </tr>
      </c:forEach>

        </tbody>
      </table>
      </div>
    </div>
  </div>


