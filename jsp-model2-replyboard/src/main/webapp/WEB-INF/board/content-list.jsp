<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-27
  Time: 오전 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/header.jsp"%>
<div class="container">
    <h2 class="mt-5 mb-5">LIST</h2>
    <div class="text-end">
        <form action="" method="post">
            <input type="text" name="userID">
            <button id="btn-search-content">검색</button>
        </form>
    </div>
    <form action="" method="get" id="member-list-form">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>No</th>
                <th>Subject</th>
                <%--                <th>viewSubject</th>--%>
                <th>Name</th>
                <th>Hit</th>
                <th>Date</th>
                <th>regroup</th>
                <th>relevel</th>
                <th>restep</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="boardList" items="${contentList}" begin="0" end="9" varStatus="loop">
                <c:choose>
                    <c:when test="${boardList.available>0}">
                <tr>
                    <td>${boardList.no}</td>
                    <c:choose>
                        <c:when test="${boardList.restep > 1}">
                    <td><a href="/board/content-view?no=${boardList.no}" class="step step${boardList.restep}"><i class="bi bi-arrow-return-right"></i>${boardList.subject}</a></td>
                        <%--                    <td><a href="">${boardList.subject}view</a></td>--%>
                        </c:when>
                    <c:otherwise>
                        <td><a href="/board/content-view?no=${boardList.no}">${boardList.subject}</a></td>
                    </c:otherwise>
                    </c:choose>
                        <td>${boardList.userName}</td>
                        <td>${boardList.hit}</td>
                        <td>${boardList.regdate}</td>
                        <td>${boardList.regroup}</td>
                        <td>${boardList.relevel}</td>
                        <td>${boardList.restep}</td>
                </tr>
                    </c:when>
                    <c:otherwise>
                        <td>삭제된 글입니다.</td>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            </tbody>
        </table>
    </form>
    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <c:choose>
                <c:when test="${param.page==1}">
                    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                </c:otherwise>
            </c:choose>
            <c:forEach var="boardDto" begin="0" end="9" varStatus="loop">
                <c:choose>
                    <c:when test="${param.page==loop.count}" >
                        <li class="page-item active"><span class="page-link" >${loop.count}</span></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link" href=../board/content-list?page=${loop.count}">${loop.count}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
        </ul>
    </nav>
    <c:choose>
        <c:when test="${sessionMemberDto.userID!=null}">
            <div class="mt-5 mb-5"><a href="../board/content-write" class="btn btn-primary">글쓰기</a></div>
        </c:when>
    </c:choose>
</div>
<%@include file="../include/footer.jsp"%>
