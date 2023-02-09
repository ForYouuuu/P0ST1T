<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>

<!-- 페이징 처리 시작 -->
<div class="container text-center mt-4 " >
 <nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center">

        <%--
            <c:if test="${rpageMaker.first}">
               <li class="page-item">
                 <a class="page-link"href="${rpageMaker.startPage}">First
                 </a>
               </li>
            </c:if>
         --%>

        <c:if test="${rpageMaker.prev}">
            <li class="page-item">
                <a class="page-link" href="${rpageMaker.startPage -1}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;
                    </span>
                </a>
            </li>
        </c:if>

        <c:forEach var="num" begin="${rpageMaker.startPage}" end="${rpageMaker.endPage}">
            <li class="page-item ${rpageMaker.cri.pageNum==num? 'active':''}">
                <a class="page-link" href="${num}"> ${num}</a>
            </li>
        </c:forEach>

        <c:if test="${rpageMaker.next }">
            <li class="page-item">
                <a class="page-link" href="${rpageMaker.endPage + 1}" aria-label="Next">
                    <span aria-hidden="true">&raquo;
                    </span>
                </a>
            </li>
        </c:if>

        <%--
         <c:if test="${rpageMaker.last }">
            <li class="page-item">
                <a class="page-link" href="${rpageMaker.endPage}">Last
                </a>
            </li>
         </c:if>
        --%>

        </ul>
    </nav>
</div>
<!-- 페이징 처리 끝-->