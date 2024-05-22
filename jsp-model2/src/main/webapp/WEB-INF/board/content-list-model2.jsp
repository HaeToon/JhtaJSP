<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-21
  Time: 오후 4:22
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
                <th>viewSubject</th>
                <th>Name</th>
                <th>Hit</th>
                <th>Date</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="boardList" items="${contentListDto}" begin="0" end="9" varStatus="loop">
                <tr>
                    <td>${boardList.no}</td>
                    <td><a href="/board/content-view?no=${boardList.no}">${boardList.subject}</a></td>
                    <td><a href="">${boardList.subject}view</a></td>
                    <td>${boardList.userName}</td>
                    <td>${boardList.hit}</td>
                    <td>${boardList.regdate}</td>
                </tr>
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
    <div class="mt-5 mb-5"><a href="../board/write.jsp" class="btn btn-primary">글쓰기</a></div>
</div>
<%@include file="../include/footer.jsp"%>
