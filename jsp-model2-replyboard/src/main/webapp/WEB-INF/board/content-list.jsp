<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-27
  Time: 오전 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/header.jsp" %>
<div class="container">
    <h2 class="mt-5 mb-5">LIST</h2>
        <form action="/board/content-search?">
            <div class="row g-3 align-items-center text-end">
                <div class="col-auto">
                <select class="form-select" aria-label="Default select example" name="search">
                    <option selected value="subject">제목</option>
                    <option value="content">내용</option>
                    <option value="all">제목+내용</option>
                    <option value="username">작성자</option>
                </select>
                </div>
                <div  class="col-auto">
                <input type="text" name="searchWord" class="form-control">
                </div>
                <div  class="col-auto"><button class="btn btn-outline-primary">검색</button></div>
            </div>
        </form>
    <form action="" method="get" id="member-list-form">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>No</th>
                <th>Subject</th>
                <th>Name</th>
                <th>Hit</th>
                <th>Date</th>
                <th>regroup</th>
                <th>relevel</th>
                <th>restep</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="boardList" items="${contentList}" varStatus="loop">
                <c:choose>
                    <c:when test="${boardList.available>0}">
                        <tr>
                            <td>${boardList.no}</td>
                            <c:choose>
                                <c:when test="${boardList.restep > 1}">
                                    <td><a href="/board/content-view?no=${boardList.no}"
                                           class="step step${boardList.restep}"><i
                                            class="bi bi-arrow-return-right"></i>${boardList.subject}</a></td>
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
                        <tr>
                            <td></td>
                            <td>
                                <span>삭제된 글입니다.</span>
                            </td>

                        </tr>

                    </c:otherwise>
                </c:choose>
            </c:forEach>
            </tbody>
        </table>
    </form>
    <nav aria-label="Page navigation example" class="mt-5 mb-5">
        <div>
            <span>paginationStart==${paginationStart}</span>
            <span>paginationEnd==${paginationEnd}</span>
            <span>paginationPerPage==${paginationPerPage}</span>

        </div>
        <ul class="pagination d-flex justify-content-center">
            <li class="page-item">
                <a class="page-link" href="../board/content-list?page=1" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <c:choose>
                <c:when test="${param.page<=paginationPerPage}">
                    <li class="page-item disabled"><a class="page-link" href="../board/content-list?page=${paginationStart-1}">이전</a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="../board/content-list?page=${paginationStart-1}">이전</a></li>
                </c:otherwise>
            </c:choose>
            <c:forEach begin="${paginationStart}" end="${paginationEnd}" step="1" var="page">
                <c:choose>
                    <c:when test="${param.page==page}">
                        <li class="page-item active"><span class="page-link">${page}</span></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item "><a class="page-link"href="../board/content-list?page=${page}">${page}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:choose>
                <c:when test="${param.page/5>=totalPagination-1}">
                    <li class="page-item disabled"><a class="page-link" href="../board/content-list?page=${paginationStart+paginationPerPage}">다음</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="../board/content-list?page=${paginationStart+paginationPerPage}">다음</a>
                    </li>
                </c:otherwise>
            </c:choose>
            <li class="page-item">
                <a class="page-link" href="../board/content-list?page=${totalPage}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
    <c:choose>
        <c:when test="${sessionMemberDto.userID!=null}">
            <div class="mt-5 mb-5"><a href="../board/content-write" class="btn btn-primary">글쓰기</a></div>
        </c:when>
    </c:choose>
</div>
<%@include file="../include/footer.jsp" %>
