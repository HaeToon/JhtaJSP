
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/header.jsp"%>
<div class="container">
    <h2 class="mt-5 mb-5">VIEW</h2>
    <table class="table table-striped">
        <tbody>
        <tr>
            <td>제목</td>
            <td colspan="3" >${boardDto.subject}</td>
            <td>글번호</td>
            <td colspan="3"  >${boardDto.no}</td>
        </tr>
        <tr>
            <td>글쓴이</td>
            <td colspan="3">${boardDto.userName}</td>
        </tr>
        <tr>
            <td>날짜</td>
            <td>${boardDto.regdate}</td>
            <td>조회수</td>
            <td>${boardDto.hit}</td>
        </tr>
        <tr>
            <td>내용</td>
            <td colspan="3" class="content" >
                ${boardDto.content}
            </td>
        </tr>
        </tbody>
    </table>
    <hr>
    <div class="container">
        <h2 class="mt-3 mb-3">댓글</h2>
        <form>
            <input type="hidden" name="userName" value="${sessionMemberDto.userName}">
            <input type="text">
            <button>댓글달기</button>
        </form>
    </div>
    <div class="mt-5 mb-5">
        <a href="../board/list" class="btn btn-primary">목록으로</a>
        <a href="/board/content-reply?regroup=${boardDto.regroup}&relevel=${boardDto.relevel}&restep=${boardDto.restep}" class="btn btn-primary">답글달기</a>
        <a href="/board/delete?no=${boardDto.no}" class="btn btn-danger">삭제하기</a>
    </div>
    <div class="mt-5 mb-5">
        <div class="row">
            <span class="col-2">이전글</span>
            <c:choose>
                <c:when test="${empty prev.subject}">
                    <a href="/board/content-list" class="col-10">이전글이 없습니다. 목록으로</a>
                </c:when>
                <c:otherwise>
                    <a href="/board/content-view?no=${prev.no}&num=${prev.num}" class="col-10">${prev.subject}</a>
                </c:otherwise>
            </c:choose>

        </div>
        <div class="row">
            <span class="col-2">다음글</span>
            <c:choose>
                <c:when test="${empty next.subject}">
                    <a href="/board/content-list" class="col-10">다음글이 없습니다. 목록으로</a>
                </c:when>
                <c:otherwise>
                    <a href="/board/content-view?no=${next.no}&num=${next.num}" class="col-10">${next.subject}</a>
                </c:otherwise>
            </c:choose>

        </div>
    </div>
</div>
<%@include file="../include/footer.jsp"%>
