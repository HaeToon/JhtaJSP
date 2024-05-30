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
        <form action="/board/search">
            <div class="row g-3 align-items-center text-end">
                <div class="col-auto">
                    <select class="form-select" aria-label="Default select example" name="search">
                        <option value="subject" ${search eq "subject"?"selected":""}>제목</option>
                        <option value="content" ${search eq "content"?"selected":""}>내용</option>
                        <option value="all" ${search eq "all"?"selected":""}>제목+내용</option>
                        <option value="username" ${search eq "username"?"selected":""}>작성자</option>
                    </select>
                </div>
                <div  class="col-auto">
                <input type="text" name="searchWord" class  ="form-control">
                </div>
                <div  class="col-auto">
                    <button class="btn btn-outline-primary">검색</button>
                    <a href="/board/content-list" class="btn btn-outline-primary">목록</a>
                </div>

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
                                    <td><a href="/board/content-view?no=${boardList.no}&num=${boardList.num}"
                                           class="step step${boardList.restep}"><i
                                            class="bi bi-arrow-return-right"></i>${boardList.subject}</a></td>
                                </c:when>
                                <c:otherwise>
                                    <td><a href="/board/content-view?no=${boardList.no}&num=${boardList.num}">${boardList.subject}</a></td>
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
                                        <%--pagination--%>
    <c:choose>
        <c:when test="${empty search}">
            <c:set var="link" value=""></c:set>
        </c:when>
        <c:otherwise>
            <c:set var="link" value="&search=${search}&searchWord=${searchWord}"></c:set>
        </c:otherwise>
    </c:choose>
    <nav aria-label="Page navigation example" class="mt-5 mb-5">
        <ul class="pagination d-flex justify-content-center">
            <li class="page-item">
                <a class="page-link" href="../board/content-list?page=1${link}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <c:choose>
                <c:when test="${param.page<=paginationPerPage ||empty param.page}">
                    <li class="page-item disabled"><a class="page-link" href="../board/content-list?page=${paginationStart-1}${link}">이전</a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="../board/content-list?page=${paginationStart-1}${link}">이전</a></li>
                </c:otherwise>
            </c:choose>
            <c:forEach begin="${paginationStart}" end="${paginationEnd}" step="1" var="page">
                <c:choose>
                    <c:when test="${param.page==page}">
                        <li class="page-item active"><span class="page-link">${page}</span></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item "><a class="page-link"href="../board/content-list?page=${page}${link}">${page}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:choose>
                <c:when test="${paginationStart+paginationPerPage>totalPage}">
                    <li class="page-item disabled"><a class="page-link" href="../board/content-list?page=${paginationStart+paginationPerPage}${link}">다음</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="../board/content-list?page=${paginationStart+paginationPerPage}${link}">다음</a>
                    </li>
                </c:otherwise>
            </c:choose>
            <li class="page-item">
                <a class="page-link" href="../board/content-list?page=${totalPage}${link}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
    <div>
        <span>paginationStart==${paginationStart}</span>
        <span>paginationPerPage==${paginationPerPage}</span>
        <span>totalPagination==${totalPagination}</span>
        <span>paginationEnd==${paginationEnd}</span>
        <span>totalPage==${totalPage}</span>
    </div>
    <c:choose>
        <c:when test="${sessionMemberDto.userID!=null}">
            <div class="mt-5 mb-5"><a href="../board/content-write" class="btn btn-primary">글쓰기</a></div>
        </c:when>
    </c:choose>
</div>
<%@include file="../include/footer.jsp" %>
