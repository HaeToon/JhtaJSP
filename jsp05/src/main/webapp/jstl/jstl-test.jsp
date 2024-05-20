<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-20
  Time: 오전 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp" %>
<div class="container">
    <h2>JSTL</h2>
    <%--  scope 지정을 안하면 page에 저장됨.  --%>
    <c:set var="pageVar01" value="page에 설정된 변수"></c:set>
    <c:set var="requestVar01" value="request 설정된 변수" scope="request"></c:set>
    <c:set var="sessionVar01" value="session에 설정된 변수" scope="session"></c:set>
    <c:set var="applicationVar01" value="application에 설정된 변수" scope="application"></c:set>
    <c:set var="betweenVar01">application사이에 설정된 변수</c:set>
    <c:set var="number" value="10"></c:set>
    <c:set var="string" value="java"></c:set>
    <ul>
        <%--    scope들 생략가능    --%>
        <li>page에 변수 설정 : ${pageScope.pageVar01}</li>
        <li>request에 변수 설정 : ${requestScope.requestVar01}</li>
        <li>session에 변수 설정 : ${sessionScope.sessionVar01}</li>
        <li>application에 변수 설정 : ${applicationScope.applicationVar01}</li>
        <li>application사이에 변수 설정 : ${betweenVar01}</li>
        <c:if test="${number % 2 ==0}">
            <li>${number}는 짝수이므로 출력</li>
        </c:if>
        <c:if test="${string eq 'java'}">
            <li>${string}는 java이므로 출력</li>
        </c:if>
        <c:if test="true">
            <li>test의 ${true}가 들어가면 출력</li>
        </c:if>
        <c:if test="TRUE">
            <li>test의 ${true}가 들어가면 출력</li>
        </c:if>
            <c:if test="${  true }">
                <li>test의 ${true}가 들어가면 출력</li>
            </c:if>
<%--    if else 믄        --%>
        <c:choose>
            <c:when test="${number mod 2 eq 0}">
                <li>${number}는 짝수입니다</li>
            </c:when>
            <c:otherwise>
                <li>${number}는 홀수입니다.</li>
            </c:otherwise>
        </c:choose>

    </ul>
    <ul>
        <%--     5(begin)~20(end)까지 var를(변수)1(step)씩증가시킴       --%>
        <c:set var="total" value="100"></c:set>
        <c:forEach begin="1" end="10" step="1" var="i" varStatus="status">
            <li>
                <p> i : ${i}</p>
                <p> count : ${status.count}</p>
                <p> index : ${status.index}</p>
                <p> current : ${status.current}</p>
                <p> first : ${status.first}</p>
                <p> last : ${status.last}</p>
            </li>
        </c:forEach>
    </ul>
    <table class="table table-striped">
        <%--     5(begin)~20(end)까지 var를(변수)1(step)씩증가시킴       --%>
        <c:set var="total" value="100"></c:set>
        <c:forEach begin="1" end="10" step="1" var="idx" varStatus="loop">
            <tr>
                <td>${total - idx}</td>
                <td>제목을 씁니다. ${idx}</td>
                <td>작성자 : ${idx}</td>
            </tr>
        </c:forEach>
    </table>
    <table class="table table-striped">
        <%--     5(begin)~20(end)까지 var를(변수)1(step)씩증가시킴       --%>
        <c:set var="total" value="0"></c:set>
            <c:choose>
                <c:when test="${total==0}">
                    <tr>
                        <p>게시글이 없습니다.</p>
                    </tr>
                </c:when>
                <c:otherwise>
        <c:forEach begin="1" end="10" step="1" var="idx" varStatus="loop">
            <tr>
                <td>${total - idx}</td>
                <td>제목을 씁니다. ${idx}</td>
                <td>작성자 : ${idx}</td>
            </tr>
        </c:forEach>
                </c:otherwise>
            </c:choose>
    </table>
</div>
<%@include file="../include/footer.jsp" %>