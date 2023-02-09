<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>

<!-- 페이징 처리 시작 -->
<div class="container text-center mt-4 ">
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">

            <%--
            <c:if test="${pageMaker.first}">
               <li class="page-item">
                 <a class="page-link"href="${pageMaker.startPage}">First
                 </a>
               </li>
            </c:if>
         --%>

            <c:if test="${pageMaker.prev}">
                <li class="page-item">
                    <a class="page-link" href="${pageMaker.startPage -1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;
                        </span>
                    </a>
                </li>
            </c:if>

            <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                <li class="page-item ${pageMaker.cri.pageNum==num? 'active':''}">
                    <a class="page-link" href="${num}"> ${num}</a>
                </li>
            </c:forEach>

            <c:if test="${pageMaker.next }">
                <li class="page-item">
                    <a class="page-link" href="${pageMaker.endPage + 1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;
                        </span>
                    </a>
                </li>
            </c:if>

            <%--
         <c:if test="${pageMaker.last }">
            <li class="page-item">
                <a class="page-link" href="${pageMaker.endPage}">Last
                </a>
            </li>
         </c:if>
        --%>

        </ul>
    </nav>
</div>
<!-- 페이징 처리 끝-->