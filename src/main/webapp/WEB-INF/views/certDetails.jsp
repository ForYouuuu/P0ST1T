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
<div class="contentWrap container-fluid">

	<div class="content mb-5">

		<!--  상단  시작  -->
		<div class=" d-flex justify-content-between align-items-center mb-3">
			<h1 class="title-qname">
				<c:out value="${cert.qname}" />
			</h1>
			<c:if test="${cert.organizer == '한국산업인력공단'}">
			    <span class="organizer">주관처   <a href="https://www.q-net.or.kr/man001.do?imYn=Y&gSite=Q" target='_blank'><c:out value="${cert.organizer}" /></a></span>
			</c:if>
			<c:if test="${cert.organizer == '한국방송통신전파진흥원'}">
			    <span class="organizer">주관처   <a href="https://www.cq.or.kr/main.do" target='_blank'><c:out value="${cert.organizer}" /></a></span>
            </c:if>
            <c:if test="${cert.organizer == '한국데이터산업진흥원'}">
                <span class="organizer">주관처   <a href="https://www.dataq.or.kr/www/sub/a_07.do" target='_blank'><c:out value="${cert.organizer}" /></a></span>
            </c:if>

		</div>

		<div class="top-box">
			<h4>개요</h4>
			<div class="summary">
				<c:out value="${cert.summary}" />
			</div>
		</div>
		<!--  상단  끝  -->

		<!--  탭 시작   -->
		<div class="d-flex justify-content-center mt-4">

			<div class="mid-box">
				<h5>
					게시판 이동
				</h5>
				<div class="btn-group">
					<button class="btn btn-outline-primary btnLink" onclick = "location.href='/qnaboard/list?sort=&qid=${cert.id}'">Q & A</button>
					<button class="btn btn-outline-primary btnLink" onclick = "location.href='/reviewboard/list?sort=&qid=${cert.id}'">리뷰</button>
				</div>
			</div>


		</div>
		<!--  탭 끝   -->



		<div class="mt-4">


			<div class="card">
				<div class="accordion" id="accordionPanelsStayOpenExample">
					<div class="accordion-item">
						<h2 class="accordion-header" id="panelsStayOpen-headingOne">
							<button class="accordion-button" type="button" data-bs-toggle="collapse"
								data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true"
								aria-controls="panelsStayOpen-collapseOne">
								응시자격
							</button>
						</h2>
						<div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show"
							aria-labelledby="panelsStayOpen-headingOne">
							<div id="eligibility" class="accordion-body" style="text-align: left">
								<c:forEach items="${eligibility}" var="eli">
									<div style="margin-bottom:5px;">
										<c:out value="${eli.eligibility}" />
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="panelsStayOpen-headingTwo">
							<button class="accordion-button" type="button" data-bs-toggle="collapse"
								data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false"
								aria-controls="panelsStayOpen-collapseTwo">
								시험일정
							</button>
						</h2>
						<div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse show"
							aria-labelledby="panelsStayOpen-headingTwo">
							<div id="schedule" class="accordion-body">
							<c:choose>
							<c:when test="${cert.grade == '기능사'}">
							<table class="table align-middle">
                                <thead class="align-middle">
                                    <tr>
                                        <th style='width:12%;'>년도/회</th>
                                        <th style='width:15%;'>필기원서접수</th>
                                        <th style='width:15%;'>필기시험</th>
                                        <th style='width:15%;'>필기시험<br>합격예정자<br>발표</th>
                                        <th style='width:15%;'>실기원서접수</th>
                                        <th style='width:15%;'>실기시험</th>
                                        <th style='width:15%;'>합격자발표</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${schedule}" var="schedule">
                                        <tr>
                                            <td>
                                                <c:out value="${schedule.round}" />
                                            </td>
                                            <td>
                                                <c:out value="${schedule.pilgiapply}" />
                                            </td>
                                            <td>
                                                <c:out value="${schedule.pilgidate}" />
                                            </td>
                                            <td>
                                                <c:out value="${schedule.pilgipass}" />
                                            </td>
                                            <td>
                                                <c:out value="${schedule.silgiapply}" />
                                            </td>
                                            <td>
                                                <c:out value="${schedule.silgidate}" />
                                            </td>
                                            <td>
                                                <c:out value="${schedule.finalpass}" />
                                            </td>

                                        </tr>
                                    </c:forEach>
                                    <tr>
                                       <td colspan="8"><b>※ 시험 자격명에 따라 시험이 시행되지 않는 회차가 있으니 주관처에서 상세 내용을 확인 바랍니다.</b></td>
                                    </tr>
                                </tbody>
                            </table>
							</c:when>
							<c:otherwise>
                                <table class="table align-middle">
                                    <thead class="align-middle">
                                        <tr>
                                            <th style='width:13%'>년도/회</th>
                                            <th style='width:13%'>필기원서접수</th>
                                            <th style='width:12%'>필기시험</th>
                                            <th style='width:13%'>필기시험<br>합격예정자<br>발표</th>
                                            <th style='width:12%'>응시자격<br>서류제출</th>
                                            <th style='width:13%'>실기원서접수</th>
                                            <th style='width:12%'>실기시험</th>
                                            <th style='width:12%'>합격자발표</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${schedule}" var="schedule">
                                            <tr>
                                                <td>
                                                    <c:out value="${schedule.round}" />
                                                </td>
                                                <td>
                                                    <c:out value="${schedule.pilgiapply}" />
                                                </td>
                                                <td>
                                                    <c:out value="${schedule.pilgidate}" />
                                                </td>
                                                <td>
                                                    <c:out value="${schedule.pilgipass}" />
                                                </td>
                                                <td>
                                                    <c:out value="${schedule.document}" />
                                                </td>
                                                <td>
                                                    <c:out value="${schedule.silgiapply}" />
                                                </td>
                                                <td>
                                                    <c:out value="${schedule.silgidate}" />
                                                </td>
                                                <td>
                                                    <c:out value="${schedule.finalpass}" />
                                                </td>

                                            </tr>
                                        </c:forEach>
                                        <tr>
                                        <td colspan="8"><b>※ 시험 자격명에 따라 시험이 시행되지 않는 회차가 있으니 주관처에서 상세 내용을 확인 바랍니다.</b></td>
                                        </tr>
                                    </tbody>
                                </table>
							</c:otherwise>
							</c:choose>

							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="panelsStayOpen-headingThree">
							<button class="accordion-button" type="button" data-bs-toggle="collapse"
								data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false"
								aria-controls="panelsStayOpen-collapseThree">
								시험내용
							</button>
						</h2>
						<div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse show"
							aria-labelledby="panelsStayOpen-headingThree">
							<div id="subject" class="accordion-body">
                            <c:choose>
                            <c:when test="${cert.grade == '기술사'}">
                               <table class="table align-middle">
                                    <thead class="align-middle">
                                        <tr>
                                            <th style="width:19%">구분</td>
                                            <th style="width:55%">시험과목</td>
                                            <th style="width:13%">문제형식</td>
                                            <th style="width:15%">시험시간</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>필기</td>
                                        <td>
                                            <c:forEach items="${pilgi}" var="pilgi">
                                                <div>
                                                    <c:out value="${pilgi.pilgisubject}" />
                                                </div>
                                            </c:forEach>
                                        </td>
                                        <td><c:out value="${cert.pilgiform}" /></td>
                                        <td><c:out value="${cert.pilgitime}" /></td>
                                    </tr>
                                    <tr>
                                        <td>실기</td>
                                        <td>

                                                <c:out value="${silgi.silgisubject}" />
                                        </td>
                                        <td><c:out value="${silgi.silgiform}" /></td>
                                        <td><c:out value="${silgi.silgitime}" /></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </c:when>
                            <c:otherwise>
                                <table class="table align-middle">
                                    <thead class="align-middle">
                                        <tr>
                                            <th style="width:15%">구분</td>
                                            <th style="width:40%">시험과목</td>
                                            <th style="width:15%">문제형식</td>
                                            <th style="width:15%">문항수</td>
                                            <th style="width:15%">시험시간</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>필기</td>
                                        <td>
                                            <c:forEach items="${pilgi}" var="pilgi">
                                                <div>
                                                    <c:out value="${pilgi.pilgisubject}" />
                                                </div>
                                            </c:forEach>
                                        </td>
                                        <td><c:out value="${cert.pilgiform}" /></td>
                                        <td><c:out value="${cert.pilginum}" /></td>
                                        <td><c:out value="${cert.pilgitime}" /></td>
                                    </tr>
                                    <tr>
                                         <td>실기</td>
                                         <td>

                                                 <c:out value="${silgi.silgisubject}" />
                                         </td>
                                         <td><c:out value="${silgi.silgiform}" /></td>
                                         <td>-</td>
                                         <td><c:out value="${silgi.silgitime}" /></td>
                                     </tr>
                                     </tbody>
                                </table></c:otherwise>
                            </c:choose>

							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="panelsStayOpen-headingThree">
							<button class="accordion-button" type="button" data-bs-toggle="collapse"
								data-bs-target="#panelsStayOpen-collapseFour" aria-expanded="false"
								aria-controls="panelsStayOpen-collapseFour">
								응시료
							</button>
						</h2>
						<div id="panelsStayOpen-collapseFour" class="accordion-collapse collapse show"
							aria-labelledby="panelsStayOpen-headingThree">
							<div id="cost" class="accordion-body">
								필기시험 :
								<fmt:formatNumber value="${cert.pilgicost}" type="number" />원
								&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
								실기시험 :
								<fmt:formatNumber value="${cert.silgicost}" type="number" />원
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="d-flex justify-content-center mt-5"><button id="goBackBtn" class="btn btn-primary" style="padding: 6px 50px;">목록</button></div>
	</div>
</div>
    <jsp:include page="/WEB-INF/views/footer.jsp" />
    <script type="text/javascript">
        document.title = "${cert.qname} - POST 1T";
        $(document).ready(function () {
        $('head').append($('<link rel="stylesheet" type="text/css" />').attr('href', '/resources/css/certinfo.css'));

        $('#goBackBtn').on('click', function(){
            location.href= '/certinfo/list';
        });
    });
    </script>
</body>

</html>